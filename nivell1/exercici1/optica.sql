-- Script de creación de la base de datos Óptica Cul d'Ampolla
-- Autor: David
-- Fecha: 03/2026

DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;
USE optica;

-- PROVEEDORES
CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    calle VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    piso VARCHAR(10),
    puerta VARCHAR(10),
    ciudad VARCHAR(50) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fax VARCHAR(20),
    nif VARCHAR(20) NOT NULL UNIQUE
);

-- MARCAS
CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    id_proveedor INT NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

-- GAFAS
CREATE TABLE gafas (
    id_gafas INT AUTO_INCREMENT PRIMARY KEY,
    id_marca INT NOT NULL,
    graduacion_izq DECIMAL(4,2) NOT NULL,
    graduacion_der DECIMAL(4,2) NOT NULL,
    tipo_montura ENUM('flotante','pasta','metalica') NOT NULL,
    color_montura VARCHAR(50) NOT NULL,
    color_vidrio_izq VARCHAR(50) NOT NULL,
    color_vidrio_der VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);

-- CLIENTES
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL,
    recomendado_por INT,
    FOREIGN KEY (recomendado_por) REFERENCES clientes(id_cliente)
);

-- EMPLEADOS
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- VENTAS
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    numero_factura VARCHAR(20) NOT NULL UNIQUE,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- DETALLE VENTA
CREATE TABLE detalle_venta (
    id_venta INT NOT NULL,
    id_gafas INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_venta, id_gafas),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_gafas) REFERENCES gafas(id_gafas)
);



