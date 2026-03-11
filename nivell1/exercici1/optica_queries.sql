USE optica;

-- =====================================================
-- CONSULTA 1
-- Total de facturas de un cliente en un período
-- =====================================================

SELECT COUNT(*) AS total_facturas
FROM ventas
WHERE id_cliente = 1
AND fecha BETWEEN '2026-01-01' AND '2026-12-31';


-- =====================================================
-- CONSULTA 2
-- Modelos de gafas vendidos por un empleado en un año
-- =====================================================

SELECT DISTINCT g.id_gafas
FROM ventas v
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
JOIN gafas g ON dv.id_gafas = g.id_gafas
WHERE v.id_empleado = 1
AND YEAR(v.fecha) = 2026;


-- =====================================================
-- CONSULTA 3
-- Proveedores de gafas que han sido vendidas
-- =====================================================

SELECT DISTINCT p.nombre
FROM proveedores p
JOIN marcas m ON p.id_proveedor = m.id_proveedor
JOIN gafas g ON m.id_marca = g.id_marca
JOIN detalle_venta dv ON g.id_gafas = dv.id_gafas;