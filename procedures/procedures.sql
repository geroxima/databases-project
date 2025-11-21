
-- sp_upsert_cliente
CREATE OR REPLACE FUNCTION sp_upsert_cliente(
    accion text,
    p_id_cliente integer DEFAULT NULL,
    p_nombre text DEFAULT NULL, 
    p_direccion text DEFAULT NULL,
    p_telefono text DEFAULT NULL,
    p_email text DEFAULT NULL 
) RETURNS TABLE(success boolean, cliente_id integer, msg text)
LANGUAGE plpgsql AS $$ 
BEGIN  
  accion := upper(accion);
  IF accion = 'INSERT' THEN 
    INSERT INTO public."Clientes"(nombre, direccion, telefono, email)
    VALUES (p_nombre, p_direccion, p_telefono, p_email)
    RETURNING id_cliente INTO cliente_id;
    success := true; 
    msg := 'Inserted';
    RETURN NEXT;
    RETURN;
  ELSIF accion = 'UPDATE' THEN 
    IF p_id_cliente IS NULL THEN 
      RAISE EXCEPTION 'Es necesario el id del cliente';
    END IF;
    UPDATE public."Clientes"
      SET nombre = p_nombre,  
      direccion = p_direccion, 
      telefono = p_telefono,
      email = p_email
    WHERE id_cliente = p_id_cliente;
    IF found THEN 
      success := true; cliente_id := p_id_cliente; msg := 'Actualizado';
    ELSE 
      success := false; cliente_id := NULL; msg := 'Cliente no encontrado';
    END IF;
    RETURN NEXT;
    RETURN;
  ELSIF accion = 'DELETE' THEN 
    IF p_id_cliente IS NULL THEN  
      RAISE EXCEPTION 'el id del cliente es requerido para eliminar';
    END IF;
    DELETE FROM public."Clientes" WHERE id_cliente = p_id_cliente;
    IF found THEN
      success := true; cliente_id := p_id_cliente; msg := 'Eliminado';
    ELSE 
      success := false; cliente_id := NULL; msg := 'Cliente no encontrado';
    END IF; 
    RETURN NEXT; 
    RETURN;
  ELSE
    RAISE EXCEPTION 'accion invalida';
  END IF ;
END;
$$;

-- upsert_funcionario

CREATE OR REPLACE FUNCTION sp_upsert_funcionario(
  accion TEXT,
  p_id_empleado integer DEFAULT NULL,
  p_nombre text DEFAULT NULL
)RETURNS TABLE(success boolean, empleado_id integer, msg text)
LANGUAGE plpgsql AS $$
BEGIN
  accion := upper(accion);
  IF accion = 'INSERT' THEN
    INSERT INTO public."Empleados" (nombre_completo)
    VALUES (p_nombre)
    RETURNING id_empleado INTO empleado_id;
    success := true; msg := 'Inserted';
    RETURN NEXT;
    RETURN;
  ELSIF accion = 'UPDATE' THEN
    UPDATE public."Empleados"
    SET nombre_completo = p_nombre
    WHERE id_empleado = p_id_empleado;
    IF found THEN 
      success := true; empleado_id := p_id_empleado; msg := 'Actualizado correctamente';
    ELSE 
      success := false; empleado_id := p_id_empleado; msg := 'El id del empleado no existe';
    END IF;
    RETURN NEXT; 
    RETURN; 
  ELSIF accion = 'DELETE' THEN   
    IF p_id_empleado IS NULL THEN      
      RAISE EXCEPTION 'Para eliminar se necesita un id';
    END IF;    
    DELETE FROM public."Empleados" WHERE id_empleado = p_id_empleado;
    IF found THEN 
      success := true; empleado_id := p_id_empleado; msg := 'ELIMINADO';
    ELSE  
      success := false; empleado_id := p_id_empleado; msg := 'Empleado no encontrado';
    END IF; 
    RETURN NEXT; 
    RETURN;
  ELSE
    RAISE EXCEPTION 'Accion invalida';
  END IF;
END;
$$;

--  Crear presupuesto (cabecera).

CREATE OR REPLACE FUNCTION sp_agregar_presupuesto_cabecera(
  p_id_cliente integer,
  p_id_emplpeado integer,
  p_forma_pago text,
  p_id_estado integer default 10,
  p_id_motivo integer DEFAULT NULL,
  p_importe_total numeric DEFAULT 0
) RETURNS TABLE (success boolean, id_presupuesto integer, msg text)
LANGUAGE plpgsql AS $$
BEGIN
     -- Verifica cliente
    PERFORM 1 FROM public."Clientes" WHERE id_cliente = p_id_cliente;
    IF NOT FOUND THEN
        success := false;
        id_presupuesto := NULL;
        msg := 'no se encontro el cliente';
        RETURN NEXT;
        RETURN;
    END IF;

    -- Verifica empleado
    PERFORM 1 FROM public."Empleados" WHERE id_empleado = p_id_emplpeado;
    IF NOT FOUND THEN
        success := false;
        id_presupuesto := NULL;
        msg := 'no se encuentra el empleado';
        RETURN NEXT;
        RETURN;
    END IF;

    INSERT INTO public."Presupuestos" (id_cliente, id_empleado, forma_pago, id_estaado, id_motivo, importe_total)
    VALUES (
        p_id_cliente,
        p_id_emplpeado,
        p_forma_pago::public."Presupuestos_forma_pago_enum",
        p_id_estado
        p_id_motivo,
        p_importe_total
    )

    RETURNING "Presupuestos".id_presupuesto INTO id_presupuesto;

    success := true;
    msg := 'Presupuesto creado';
    RETURN NEXT;
END;
$$

-- Agregar línea a presupuesto(detalle)
CREATE OR REPLACE FUNCTION sp_agregar_presupuesto_linea(
  p_id_presupuesto integer, 
  p_id_producto integer, 
  p_cantidad integer
) RETURNS TABLE (success boolean, id_detalle integer, msg text)
LANGUAGE plpgsql AS $$
DECLARE 
  l_precio_unitario numeric;
BEGIN
  
  -- Verificar presupuesto
  PERFORM 1 FROM public."Presupuestos" WHERE id_presupuesto = p_id_presupuesto;
  IF NOT FOUND THEN 
    success := false; 
    id_detalle := NULL; 
    msg := 'Presupuesto no encontrado'; 
    RETURN NEXT; 
    RETURN;
  END IF;

  
  PERFORM 1 FROM public."Productos" WHERE id_producto = p_id_producto;
  IF NOT FOUND THEN  
    success := false; 
    id_detalle := NULL; 
    msg := 'Producto no encontrado';
    RETURN NEXT;
    RETURN;
  END IF;

  SELECT precio_venta 
  INTO l_precio_unitario
  FROM public."Productos"
  WHERE id_producto = p_id_producto;

  -- Insertar detalle
  INSERT INTO public."PresupuestoDetalles"(
      id_presupuesto, 
      id_producto, 
      cantidad, 
      precio_unitario
  )
  VALUES (
      p_id_presupuesto, 
      p_id_producto, 
      p_cantidad, 
      l_precio_unitario
  )
  RETURNING "PresupuestoDetalles".id_detalle INTO id_detalle;
  -- Actualizar total del presupuesto sumando todos los subtotales
    UPDATE public."Presupuestos"
    SET importe_total = (
        SELECT SUM(subtotal)
        FROM public."PresupuestoDetalles"
        WHERE id_presupuesto = p_id_presupuesto)
    WHERE id_presupuesto = p_id_presupuesto;

  success := true; 
  msg := 'Aniadido'; 
  RETURN NEXT;
END; 
$$;

CREATE OR REPLACE FUNCTION sp_cambiar_estado_presupuesto(
    p_id_presupuesto integer,
    p_nuevo_estado integer,
    p_id_motivo integer DEFAULT 1
)
RETURNS TABLE(success boolean, msg text)
LANGUAGE plpgsql AS $$
BEGIN
    PERFORM 1 FROM public."Presupuestos" 
    WHERE id_presupuesto = p_id_presupuesto;

    IF NOT FOUND THEN
        success := FALSE;
        msg := 'El presupuesto no existe';
        RETURN NEXT;
        RETURN;
    END IF;

    PERFORM 1 FROM public."EstadosPresupuesto"
    WHERE id_estado = p_nuevo_estado;

    IF NOT FOUND THEN
        success := FALSE;
        msg := 'El estado no existe';
        RETURN NEXT;
        RETURN;
    END IF;

    UPDATE public."Presupuestos"
    SET id_estado = p_nuevo_estado,
        id_motivo = p_id_motivo
    WHERE id_presupuesto = p_id_presupuesto;

    success := TRUE;
    msg := 'Estado cambiado con éxito';
    RETURN NEXT;
END;
$$;

CREATE OR REPLACE FUNCTION sp_anular_o_confirmar_pedido(
    p_accion TEXT,
    p_id_pedido INTEGER
) RETURNS TABLE(success BOOLEAN, msg TEXT) 
LANGUAGE plpgsql AS $$
DECLARE
    v_id_presupuesto INTEGER;
BEGIN
    p_accion := UPPER(p_accion);
    
    -- Obtener el presupuesto asociado al pedido
    SELECT id_presupuesto INTO v_id_presupuesto 
    FROM public."Pedidos" 
    WHERE id_pedido = p_id_pedido;
    
    IF NOT FOUND THEN
        success := FALSE;
        msg := 'Pedido no encontrado';
        RETURN NEXT;
        RETURN;
    END IF;
    
    IF p_accion = 'CONFIRMAR' THEN
        -- Confirmar pedido
        UPDATE public."Pedidos" 
        SET id_estado = 4
        WHERE id_pedido = p_id_pedido;
        
        success := TRUE;
        msg := 'Pedido confirmado';
        
    ELSIF p_accion = 'ANULAR' THEN
        -- Anular pedido y revertir presupuesto
        UPDATE public."Pedidos" 
        SET id_estado = 25
        WHERE id_pedido = p_id_pedido;
        
        -- Revertir presupuesto a EMITIDO (10)
        UPDATE public."Presupuestos" 
        SET id_estado = 10 
        WHERE id_presupuesto = v_id_presupuesto;
        
        success := TRUE;
        msg := 'Pedido anulado y presupuesto revertido';
        
    ELSE
        success := FALSE;
        msg := 'Acción inválida. Use CONFIRMAR o ANULAR';
    END IF;
    
    RETURN NEXT;
END;
$$;

CREATE OR REPLACE FUNCTION sp_generar_factura_desde_pedido(
    p_id_pedido INTEGER,
) RETURNS TABLE(success BOOLEAN, id_factura INTEGER, msg TEXT)
LANGUAGE plpgsql AS $$
DECLARE
    v_numero_factura TEXT;
    v_id_deposito INTEGER;
    v_id_usuario INTEGER;
BEGIN
    
    PERFORM 1 FROM public."Pedidos" WHERE id_pedido = p_id_pedido;
    IF NOT FOUND THEN
        success := FALSE;
        id_factura := NULL;
        msg := 'Pedido no encontrado';
        RETURN NEXT;
        RETURN;
    END IF;
    

    SELECT id_cliente INTO v_id_usuario from public."Pedidos" WHERE id_pedido = p_id_pedido;

    -- Generar número de factura único
    v_numero_factura := 'FAC-' || EXTRACT(YEAR FROM NOW()) || '-' || p_id_pedido || '-' || v_id_usuario;
    
    -- Insertar factura
    INSERT INTO public."Facturas" (id_pedido, numero_factura)
    VALUES (p_id_pedido, v_numero_factura)
    RETURNING id_factura INTO id_factura;
    
    -- Copiar detalles del pedido a la factura
    INSERT INTO public."FacturaDetalles" (id_factura, id_producto, cantidad, precio_unitario, porcentaje_iva)
    SELECT 
        id_factura,
        pd.id_producto,
        pd.cantidad,
        pd.precio_unitario,
        COALESCE(pr.porcentaje_iva, 10)
    FROM public."PedidoDetalles" pd
    JOIN public."Productos" pr ON pd.id_producto = pr.id_producto
    WHERE pd.id_pedido = p_id_pedido;
    
    -- Descontar del stock confirmado y afectar inventario real
    UPDATE public."Stock" s
    SET 
        cantidad_confirmada = cantidad_confirmada - pd.cantidad,
        cantidad_disponible = cantidad_disponible - pd.cantidad
    FROM public."PedidoDetalles" pd
    WHERE s.id_producto = pd.id_producto 
      AND s.id_deposito = v_id_deposito
      AND pd.id_pedido = p_id_pedido;
    
    success := TRUE;
    msg := 'Factura generada correctamente';
    
    RETURN NEXT;
END;
$$;
