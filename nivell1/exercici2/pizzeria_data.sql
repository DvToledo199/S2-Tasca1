-- =====================================================
-- DATOS DE PRUEBA
-- =====================================================

-- PROVINCIAS
INSERT INTO provincia (nombre)
VALUES ('Barcelona');

-- LOCALIDADES
INSERT INTO localidad (nombre, id_provincia)
VALUES 
('Barcelona', 1),
('Badalona', 1);

-- CLIENTES
INSERT INTO cliente (nombre, apellidos, direccion, codigo_postal, telefono, id_localidad)
VALUES
('Juan', 'Perez', 'Calle Mayor 10', '08001', '600111111', 1),
('Maria', 'Lopez', 'Calle Sol 22', '08910', '600222222', 2);

-- TIENDAS
INSERT INTO tienda (direccion, codigo_postal, id_localidad)
VALUES
('Avenida Central 5', '08001', 1);

-- EMPLEADOS
INSERT INTO empleado (nombre, apellidos, nif, telefono, tipo_empleado, id_tienda)
VALUES
('Carlos', 'Garcia', '12345678A', '600333333', 'cocinero', 1),
('Luis', 'Martinez', '87654321B', '600444444', 'repartidor', 1);

-- CATEGORIAS
INSERT INTO categoria (nombre)
VALUES
('Pizza'),
('Hamburguesa'),
('Beguda');

-- PRODUCTOS
INSERT INTO producto (nombre, descripcion, precio, id_categoria)
VALUES
('Pizza Margarita', 'Pizza clasica', 10.50, 1),
('Hamburguesa Completa', 'Hamburguesa con queso', 8.50, 2),
('Coca Cola', 'Refresco 33cl', 2.50, 3);

-- PEDIDOS
INSERT INTO pedido (fecha_hora, tipo_pedido, precio_total, id_cliente, id_tienda, id_repartidor, fecha_entrega)
VALUES
('2026-03-20 20:00:00', 'domicilio', 13.00, 1, 1, 2, '2026-03-20 20:30:00'),
('2026-03-21 21:00:00', 'recoger', 10.50, 2, 1, NULL, NULL);

-- PEDIDO_PRODUCTO
INSERT INTO pedido_producto (id_pedido, id_producto, cantidad)
VALUES
(1, 1, 1),
(1, 3, 1),
(2, 1, 1);