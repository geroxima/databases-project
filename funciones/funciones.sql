CREATE TABLE IF NOT EXISTS pedidos_log (
  id SERIAL PRIMARY KEY,
  pedido_id INT,
  acao TEXT,
  data TIMESTAMP DEFAULT now()
);

CREATE OR REPLACE FUNCTION log_pedidos()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO pedidos_log(pedido_id, acao) VALUES (NEW.id_pedido, 'inserido');
  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO pedidos_log(pedido_id, acao) VALUES (NEW.id_pedido, 'atualizado');
  ELSIF TG_OP = 'DELETE' THEN
    INSERT INTO pedidos_log(pedido_id, acao) VALUES (OLD.id_pedido, 'apagado');
  END IF;
  RETURN NEW;
END;
$$;


CREATE OR REPLACE FUNCTION fn_actualizar_stock_confirmacion()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW.id_estado <> OLD.id_estado AND NEW.id_estado = 4 THEN
    UPDATE public."Stock" s
    SET cantidad_confirmada = cantidad_confirmada + pd.cantidad
    FROM public."PedidoDetalles" pd
    WHERE pd.id_pedido = NEW.id_pedido
        AND s.id_producto = pd.id_producto
        AND s.id_deposito = NEW.id_deposito_origen;
  END IF;
  RETURN NEW;
END;
$$;

CREATE OR REPLACE FUNCTION validar_modificacion_presupuesto()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.id_estado != 2 THEN
        RAISE EXCEPTION 'No se puede modificar un presupuesto que no está en estado Emitido';
    END IF;
    
    IF (CURRENT_TIMESTAMP - OLD.fecha_emision) > INTERVAL '48 hours' THEN
        RAISE EXCEPTION 'No se puede modificar un presupuesto después de 48 horas de su emisión';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION prevenir_eliminacion_presupuesto()
RETURNS TRIGGER AS $$
BEGIN
    RAISE EXCEPTION 'No está permitido eliminar presupuestos';
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION validar_motivo_presupuesto()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id_estado IN (4, 6) AND NEW.id_motivo IS NULL THEN
        RAISE EXCEPTION 'Debe indicar un motivo para rechazar o anular el presupuesto';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generar_pedido_desde_presupuesto()
RETURNS TRIGGER AS $$
DECLARE
    v_id_pedido INTEGER;
BEGIN
        INSERT INTO public."Pedidos" (
            id_presupuesto, 
            id_cliente, 
            id_deposito_origen,
            fecha_pedido,
            id_estado,
            forma_pago
        )
        VALUES (
            NEW.id_presupuesto,
            NEW.id_cliente,
            NEW.id_deposito,
            CURRENT_DATE,
            1,
            NEW.forma_pago
        )
        RETURNING id_pedido INTO v_id_pedido;
        
        INSERT INTO public."PedidoDetalles" (
            id_pedido,
            id_producto,
            cantidad,
            precio_unitario
        )
        SELECT 
            v_id_pedido,
            pd.id_producto,
            pd.cantidad,
            pd.precio_unitario
        FROM public."PresupuestoDetalles" pd
        WHERE pd.id_presupuesto = NEW.id_presupuesto;
        
        UPDATE public."Presupuestos"
        SET id_estado = 7
        WHERE id_presupuesto = NEW.id_presupuesto;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION descontar_stock_factura()
RETURNS TRIGGER AS $$
DECLARE
    detalle RECORD;
    v_id_deposito INTEGER;
    v_cantidad_confirmada INTEGER;
BEGIN
    IF TG_OP = 'INSERT' AND NEW.estado = 'Emitida' THEN
        
        SELECT id_deposito_origen INTO v_id_deposito
        FROM public."Pedidos"
        WHERE id_pedido = NEW.id_pedido;
        
        FOR detalle IN 
            SELECT id_producto, cantidad
            FROM public."FacturaDetalles"
            WHERE id_factura = NEW.id_factura
        LOOP
            SELECT cantidad_confirmada INTO v_cantidad_confirmada
            FROM public."Stock"
            WHERE id_producto = detalle.id_producto 
              AND id_deposito = v_id_deposito;
            
            IF v_cantidad_confirmada IS NULL OR v_cantidad_confirmada < detalle.cantidad THEN
                RAISE EXCEPTION 'Cantidad confirmada insuficiente para producto % en depósito %', 
                    detalle.id_producto, v_id_deposito;
            END IF;
            
            UPDATE public."Stock"
            SET cantidad_confirmada = cantidad_confirmada - detalle.cantidad,
                cantidad_disponible = cantidad_disponible - detalle.cantidad
            WHERE id_producto = detalle.id_producto 
              AND id_deposito = v_id_deposito;
        END LOOP;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION revertir_stock_factura_anulada()
RETURNS TRIGGER AS $$
DECLARE
    detalle RECORD;
    v_id_deposito INTEGER;
BEGIN
    IF NEW.estado = 'Anulada' AND OLD.estado != 'Anulada' THEN
        
        SELECT id_deposito_origen INTO v_id_deposito
        FROM public."Pedidos"
        WHERE id_pedido = NEW.id_pedido;
        
        FOR detalle IN 
            SELECT id_producto, cantidad
            FROM public."FacturaDetalles"
            WHERE id_factura = NEW.id_factura
        LOOP
            UPDATE public."Stock"
            SET cantidad_confirmada = cantidad_confirmada + detalle.cantidad,
                cantidad_disponible = cantidad_disponible + detalle.cantidad
            WHERE id_producto = detalle.id_producto 
              AND id_deposito = v_id_deposito;
        END LOOP;
        
        UPDATE public."Pedidos"
        SET id_estado = 1
        WHERE id_pedido = NEW.id_pedido;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION prevenir_eliminacion_pedido()
RETURNS TRIGGER AS $$
BEGIN
    RAISE EXCEPTION 'No está permitido eliminar pedidos';
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validar_stock_no_negativo()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.cantidad_disponible < 0 THEN
        RAISE EXCEPTION 'No se permite stock negativo para producto % en depósito %', 
            NEW.id_producto, NEW.id_deposito;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validar_pedido_modificacion()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.id_estado IN (4, 24, 25) THEN
        RAISE EXCEPTION 'No se puede modificar un pedido confirmado o anulado';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizar_presupuesto_pedido_anulado()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE public."Presupuestos"
    SET id_estado = 6
    WHERE id_presupuesto = NEW.id_presupuesto;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

