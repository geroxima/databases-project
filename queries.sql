/*También se deberán realizar las siguientes consultas:
- Monto de importe total de presupuestos emitidos en un rango de fecha (entre dos
fechas), desplegar los atributos: fecha, código y nombre del depósito, importe total
de presupuestos para esa fecha y depósito. (1)
*/
SELECT 
      DATE("Presupuestos".fecha_emision) AS fecha, 
      "Depositos".id_deposito, 
      "Depositos".nombre,
      SUM("Presupuestos".importe_total) as importe_total_por_dia
FROM "Pedidos"
INNER JOIN "Presupuestos" ON "Presupuestos".id_presupuesto = "Pedidos".id_presupuesto
INNER JOIN "Depositos" ON "Depositos".id_deposito = "Pedidos".id_deposito_origen
WHERE "Presupuestos".fecha_emision BETWEEN '2025-01-01' AND '2025-11-10'
GROUP BY DATE("Presupuestos".fecha_emision), "Depositos".id_deposito, "Depositos".nombre;

/*
- Productos en pedidos, el criterio de recuperación es por rango de clientes y rango de
fechas, desplegar los siguientes atributos: código y nombre del Cliente, código y
nombre del deposito, código y descripción del producto, cantidad y precio unitario.
(1)
*/

SELECT 
    cli.id_cliente, 
    cli.nombre AS nombre_cliente,
    dep.id_deposito, 
    dep.nombre AS nombre_deposito,
    prod.id_producto, 
    prod.descripcion,
    pd.cantidad,
    pd.precio_unitario
FROM "Pedidos" ped
INNER JOIN "Clientes" cli ON cli.id_cliente = ped.id_cliente
INNER JOIN "Depositos" dep ON dep.id_deposito = ped.id_deposito_origen
INNER JOIN "PedidoDetalles" pd ON pd.id_pedido = ped.id_pedido
INNER JOIN "Productos" prod ON prod.id_producto = pd.id_producto
WHERE 
    DATE(ped.fecha_generacion) BETWEEN '2025-01-01' AND '2025-11-10' AND
    cli.id_cliente BETWEEN 1 AND 100
ORDER BY cli.id_cliente, ped.fecha_generacion;
/*
Informe de presupuestos pendientes de confirmación, desplegar los atributos:
Presupuesto, fecha, código y nombre del cliente, importe total del presupuesto. */
SELECT 
    p.id_presupuesto,
    p.fecha_emision,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    p.importe_total
FROM "Presupuestos" p
INNER JOIN "Clientes" c ON c.id_cliente = p.id_cliente
INNER JOIN "EstadosPresupuesto" ep ON ep.id_estado = p.id_estado
WHERE ep.nombre = 'Pendiente' 
ORDER BY p.fecha_emision DESC;
/*
Informe de presupuestos rechazados, desplegar los atributos: Presupuesto, fecha,
código y nombre del cliente, código y nombre del producto, cantidad, precio unitario,
código y descripción del motivo de rechazo. 
*/
SELECT 
    p.id_presupuesto,
    p.fecha_emision,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    prod.id_producto,
    prod.descripcion AS nombre_producto,
    pd.cantidad,
    pd.precio_unitario,
    m.id_motivo,
    m.descripcion AS motivo_rechazo
FROM "Presupuestos" p
INNER JOIN "Clientes" c ON c.id_cliente = p.id_cliente
INNER JOIN "EstadosPresupuesto" ep ON ep.id_estado = p.id_estado
INNER JOIN "Motivos" m ON m.id_motivo = p.id_motivo
INNER JOIN "PresupuestoDetalles" pd ON pd.id_presupuesto = p.id_presupuesto
INNER JOIN "Productos" prod ON prod.id_producto = pd.id_producto
WHERE ep.nombre = 'Rechazado' 
ORDER BY p.fecha_emision DESC;
/*
Ranking de productos (Productos con mas pedidos confirmados, por cantidad de
productos).
*/
SELECT 
    prod.id_producto,
    prod.descripcion,
    SUM(pedd.cantidad) AS cantidad_total_vendida,
    COUNT(ped.id_pedido) AS cantidad_pedidos
FROM "Productos" prod
INNER JOIN "PedidoDetalles" pedd ON pedd.id_producto = prod.id_producto
INNER JOIN "Pedidos" ped ON ped.id_pedido = pedd.id_pedido
INNER JOIN "EstadosPedido" ep ON ep.id_estado = ped.id_estado
WHERE ep.nombre = 'Confirmado'
GROUP BY prod.id_producto, prod.descripcion
ORDER BY cantidad_total_vendida DESC;

/*
Ranking de Clientes con presupuesto (Clientes que más confirman presupuestos, por
importe de facturación).
*/
SELECT 
    c.id_cliente,
    c.nombre,
    COUNT(p.id_presupuesto) AS cantidad_presupuestos_confirmados,
    SUM(p.importe_total) AS importe_total_facturacion
FROM "Clientes" c
INNER JOIN "Presupuestos" p ON p.id_cliente = c.id_cliente
INNER JOIN "EstadosPresupuesto" ep ON ep.id_estado = p.id_estado
WHERE ep.nombre = 'Confirmado'
GROUP BY c.id_cliente, c.nombre
ORDER BY importe_total_facturacion DESC;

