-- =====================================================
-- CONSULTA 1
-- Cuántas bebidas se han vendido en una localidad
-- =====================================================

SELECT 
    SUM(pp.cantidad) AS bebidas_vendidas
FROM
    pedido_producto pp
        JOIN
    producto p ON pp.id_producto = p.id_producto
        JOIN
    categoria c ON p.id_categoria = c.id_categoria
        JOIN
    pedido pe ON pp.id_pedido = pe.id_pedido
        JOIN
    cliente cl ON pe.id_cliente = cl.id_cliente
        JOIN
    localidad l ON cl.id_localidad = l.id_localidad
WHERE
    c.nombre = 'Beguda'
        AND l.nombre = 'Barcelona';

-- =====================================================
-- CONSULTA 2
-- Cuántos pedidos ha entregado un empleado
-- =====================================================

SELECT 
    COUNT(*) AS total_pedidos
FROM
    pedido
WHERE
    id_repartidor = 2;

SELECT * FROM pedido;
SELECT * FROM pedido_producto;
SELECT * FROM producto;