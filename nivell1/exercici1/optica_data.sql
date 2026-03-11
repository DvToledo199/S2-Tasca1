USE optica;

-- PROVEEDORES
INSERT INTO proveedores (nombre, calle, numero, ciudad, codigo_postal, pais, telefono, nif)
VALUES 
('VisionPro', 'Calle Mayor', '10', 'Barcelona', '08001', 'España', '123456789', 'A12345678'),
('OpticGlobal', 'Avenida Sol', '25', 'Madrid', '28001', 'España', '987654321', 'B87654321');

-- MARCAS
INSERT INTO marcas (nombre, id_proveedor)
VALUES
('RayBan', 1),
('Oakley', 2);

-- GAFAS
INSERT INTO gafas (id_marca, graduacion_izq, graduacion_der, tipo_montura, color_montura, color_vidrio_izq, color_vidrio_der, precio)
VALUES
(1, -1.25, -1.25, 'metalica', 'negro', 'transparente', 'transparente', 120.00),
(2, -2.00, -2.00, 'pasta', 'azul', 'transparente', 'transparente', 150.00);

-- CLIENTES
INSERT INTO clientes (nombre, direccion, telefono, email, fecha_registro)
VALUES
('Juan Perez', 'Calle Luna 5', '600111222', 'juan@email.com', '2026-01-10'),
('Maria Lopez', 'Calle Sol 8', '600333444', 'maria@email.com', '2026-02-15');

-- EMPLEADOS
INSERT INTO empleados (nombre)
VALUES
('Laura'),
('Carlos');

-- VENTAS
INSERT INTO ventas (numero_factura, id_cliente, id_empleado, fecha)
VALUES
('FAC-001', 1, 1, '2026-03-01'),
('FAC-002', 2, 2, '2026-03-02');

-- DETALLE VENTA
INSERT INTO detalle_venta (id_venta, id_gafas, cantidad, precio_unitario)
VALUES
(1, 1, 1, 120.00),
(2, 2, 1, 150.00);

SELECT * FROM proveedores;
SELECT * FROM marcas;
SELECT * FROM gafas;
SELECT * FROM ventas;