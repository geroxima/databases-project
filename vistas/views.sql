-- Cantidad de presupuestos por estado
CREATE OR REPLACE VIEW "PresupuestosPorEstado" AS
SELECT
    e.nombre AS estado,
    COUNT(p.id_presupuesto) AS cantidad
FROM "Presupuestos" p
JOIN "EstadosPresupuesto" e
    ON p.id_estado = e.id_estado
GROUP BY e.nombre;

-- Presupuestos rechazados

create or replace view "PresupuestosRechazados" as
select
  p.id_presupuesto,
  c.nombre as cliente,
  e.nombre_completo as empleado,
  p.fecha_emision,
  p.forma_pago,
  p.importe_total,
  ep.nombre as estado,
  m.descripcion as motivo
from
  "Presupuestos" p
  join "Clientes" c on p.id_cliente = c.id_cliente
  join "Empleados" e on p.id_empleado = e.id_empleado
  join "EstadosPresupuesto" ep on p.id_estado = ep.id_estado
  left join "Motivos" m on p.id_motivo = m.id_motivo
where
  ep.id_estado = 4;

-- Stock de productos

  CREATE OR REPLACE VIEW vista_stock_productos AS
  SELECT
      p.descripcion,
      m.nombre AS marca,
      s.cantidad_disponible,
      s.cantidad_confirmada
  FROM "Stock" s
  JOIN "Productos" p ON p.id_producto = s.id_producto
  JOIN "Marcas" m   ON m.id_marca    = p.id_marca;
