-- =====================================================
-- Base de datos: Pizzeria
-- Autor: David
-- Fecha: 03/2026
-- Descripción: Script de creación de las tablas para
-- el sistema de pedidos de una pizzería
-- =====================================================


DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;

-- =====================================================
-- PROVINCIA
-- =====================================================

CREATE TABLE provincia (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- =====================================================
-- LOCALIDAD
-- =====================================================

CREATE TABLE localidad (
    id_localidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_provincia INT NOT NULL,
    
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

-- =====================================================
-- CLIENTE
-- =====================================================

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    id_localidad INT NOT NULL,

    FOREIGN KEY (id_localidad) REFERENCES localidad(id_localidad)
);

-- =====================================================
-- TIENDA
-- =====================================================

CREATE TABLE tienda (
    id_tienda INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(200) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    id_localidad INT NOT NULL,

    FOREIGN KEY (id_localidad) REFERENCES localidad(id_localidad)
);

-- =====================================================
-- EMPLEADO
-- =====================================================

CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    nif VARCHAR(20) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    tipo_empleado ENUM('cocinero','repartidor') NOT NULL,
    id_tienda INT NOT NULL,

    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);

-- =====================================================
-- CATEGORIA
-- =====================================================

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- =====================================================
-- PRODUCTO
-- =====================================================

CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    imagen VARCHAR(255),
    precio DECIMAL(6,2) NOT NULL,
    id_categoria INT NOT NULL,

    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- =====================================================
-- PEDIDO
-- =====================================================

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    tipo_pedido ENUM('domicilio','recoger') NOT NULL,
    precio_total DECIMAL(8,2) NOT NULL,
    id_cliente INT NOT NULL,
    id_tienda INT NOT NULL,
    id_repartidor INT,
    fecha_entrega DATETIME,

    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
    FOREIGN KEY (id_repartidor) REFERENCES empleado(id_empleado)
);

-- =====================================================
-- PEDIDO_PRODUCTO
-- =====================================================

CREATE TABLE pedido_producto (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,

    PRIMARY KEY (id_pedido, id_producto),

    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

