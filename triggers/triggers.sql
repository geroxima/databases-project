
DROP TRIGGER IF EXISTS log_all_pedidos ON public."Pedidos";
CREATE TRIGGER log_all_pedidos
AFTER INSERT OR UPDATE OR DELETE ON public."Pedidos"
FOR EACH ROW
EXECUTE FUNCTION log_pedidos();


DROP TRIGGER IF EXISTS trg_actualizar_stock_confirmacion ON public."Pedidos";
CREATE TRIGGER trg_actualizar_stock_confirmacion
AFTER UPDATE OF id_estado ON public."Pedidos"
FOR EACH ROW
EXECUTE FUNCTION fn_actualizar_stock_confirmacion();


DROP TRIGGER IF EXISTS trg_validar_modificacion_presupuesto ON public."Presupuestos";
CREATE TRIGGER trg_validar_modificacion_presupuesto
BEFORE UPDATE ON public."Presupuestos"
FOR EACH ROW
EXECUTE FUNCTION validar_modificacion_presupuesto();


DROP TRIGGER IF EXISTS trg_prevenir_eliminacion_presupuesto ON public."Presupuestos";
CREATE TRIGGER trg_prevenir_eliminacion_presupuesto
BEFORE DELETE ON public."Presupuestos"
FOR EACH ROW
EXECUTE FUNCTION prevenir_eliminacion_presupuesto();


DROP TRIGGER IF EXISTS trg_validar_motivo_presupuesto ON public."Presupuestos";
CREATE TRIGGER trg_validar_motivo_presupuesto
BEFORE INSERT OR UPDATE ON public."Presupuestos"
FOR EACH ROW
EXECUTE FUNCTION validar_motivo_presupuesto();


DROP TRIGGER IF EXISTS trg_generar_pedido_desde_presupuesto ON public."Presupuestos";
CREATE TRIGGER trg_generar_pedido_desde_presupuesto
AFTER UPDATE OF id_estado ON public."Presupuestos"
FOR EACH ROW
WHEN (OLD.id_estado IS DISTINCT FROM 3 AND NEW.id_estado = 3)
EXECUTE FUNCTION generar_pedido_desde_presupuesto();


DROP TRIGGER IF EXISTS trg_descontar_stock_factura ON public."Facturas";
CREATE TRIGGER trg_descontar_stock_factura
AFTER INSERT ON public."Facturas"
FOR EACH ROW
EXECUTE FUNCTION descontar_stock_factura();


DROP TRIGGER IF EXISTS trg_revertir_stock_factura_anulada ON public."Facturas";
CREATE TRIGGER trg_revertir_stock_factura_anulada
AFTER UPDATE ON public."Facturas"
FOR EACH ROW
EXECUTE FUNCTION revertir_stock_factura_anulada();


DROP TRIGGER IF EXISTS trg_prevenir_eliminacion_pedido ON public."Pedidos";
CREATE TRIGGER trg_prevenir_eliminacion_pedido
BEFORE DELETE ON public."Pedidos"
FOR EACH ROW
EXECUTE FUNCTION prevenir_eliminacion_pedido();


DROP TRIGGER IF EXISTS trg_validar_stock_no_negativo ON public."Stock";
CREATE TRIGGER trg_validar_stock_no_negativo
BEFORE UPDATE ON public."Stock"
FOR EACH ROW
EXECUTE FUNCTION validar_stock_no_negativo();


DROP TRIGGER IF EXISTS trg_validar_pedido_modificacion ON public."Pedidos";
CREATE TRIGGER trg_validar_pedido_modificacion
BEFORE UPDATE ON public."Pedidos"
FOR EACH ROW
EXECUTE FUNCTION validar_pedido_modificacion();



DROP TRIGGER IF EXISTS trg_actualizar_presupuesto_pedido_anulado ON public."Pedidos";
CREATE TRIGGER trg_actualizar_presupuesto_pedido_anulado
AFTER UPDATE OF id_estado ON public."Pedidos"
FOR EACH ROW
WHEN (OLD.id_estado IS DISTINCT FROM NEW.id_estado 
      AND NEW.id_estado IN (24, 25))
EXECUTE FUNCTION actualizar_presupuesto_pedido_anulado();
