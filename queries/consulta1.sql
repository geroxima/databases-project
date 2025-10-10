--Monto de importe total de presupuestos emitidos en un rango de fecha (entre dos
--fechas), desplegar los atributos: fecha, código y nombre del depósito, importe total
--de presupuestos para esa fecha y depósito.

SELECT 
    p.fecha,
    d.id AS codigo_deposito,
    d.nombre AS nombre_deposito,
    SUM(p.importe_total) AS importe_total_presupuestos
FROM Presupuestos p
JOIN Depositos d ON p.deposito_id = d.id
WHERE p.estado = 'Emitido'
  AND p.fecha BETWEEN '2025-09-01' AND '2025-09-30'
GROUP BY p.fecha, d.id, d.nombre
ORDER BY p.fecha, d.id;
