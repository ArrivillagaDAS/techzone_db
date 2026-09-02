-- consultas avanzadas para analisis de datos en techzone

-- 1. listar los productos con stock menor a 5 unidades
SELECT 
    p.id_producto,
    p.nombre AS producto,
    p.categoria,
    p.stock,
    pr.nombre AS proveedor
FROM productos p
JOIN proveedores pr ON p.id_proveedor = pr.id_proveedor
WHERE p.stock < 5
ORDER BY p.stock ASC;

-- 2. calcular ventas totales de un mes especifico (ejemplo: junio de 2026)
SELECT 
    TO_CHAR(fecha_venta, 'YYYY-MM') AS anio_mes,
    COUNT(id_venta) AS total_transacciones,
    SUM(total) AS ingresos_totales
FROM ventas
WHERE fecha_venta >= '2026-06-01 00:00:00' 
  AND fecha_venta <= '2026-06-30 23:59:59'
GROUP BY TO_CHAR(fecha_venta, 'YYYY-MM');

-- 3. obtener el cliente con mas compras realizadas
SELECT 
    c.id_cliente,
    c.nombre AS cliente,
    c.correo,
    COUNT(v.id_venta) AS total_compras,
    SUM(v.total) As monto_total_gastado
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.correo
ORDER BY total_compras DESC
LIMIT 1;

-- 4. listar los productos mas vendidos
SELECT 
    p.id_producto,
    p.nombre AS producto,
    p.categoria,
    SUM(dv.cantidad) AS total_unidades_vendidas,
    SUM(dv.subtotal) AS ingreso_total_producto
FROM productos p
JOIN detalle_ventas dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre, p.categoria
ORDER BY total_unidades_vendidas DESC;

-- 5. consultar ventas realizadas en un rango de fechas (ejemplo: del 1 de junio al 30 de junio de 2026)
SELECT 
    v.id_venta,
    c.nombre AS cliente,
    v.fecha_venta,
    v.total
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
WHERE v.fecha_venta BETWEEN '2026-06-01 00:00:00' AND '2026-06-30 23:59:59'
ORDER BY v.fecha_venta ASC;

-- 6. identificar clientes que no han comprado en los ultimos 6 meses
SELECT 
    c.id_cliente,
    c.nombre AS cliente,
    c.correo,
    MAX(v.fecha_venta) AS ultima_compra
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.correo
HAVING MAX(v.fecha_venta) < NOW() - INTERVAL '6 months' 
   OR MAX(v.fecha_venta) IS NULL;
