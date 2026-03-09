USE pizzeria;

DROP TABLE IF EXISTS pedido_producto;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS tienda;
DROP TABLE IF EXISTS localidad;
DROP TABLE IF EXISTS provincia;

CREATE TABLE provincia (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE localidad (
    id_localidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_provincia INT,
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    direccion VARCHAR(200),
    codigo_postal VARCHAR(10),
    telefono VARCHAR(20),
    id_localidad INT,
    FOREIGN KEY (id_localidad) REFERENCES localidad(id_localidad)
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255),
    imagen VARCHAR(255),
    precio DECIMAL(6,2),
    tipo_producto VARCHAR(50),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);
CREATE TABLE tienda (
    id_tienda INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(200),
    codigo_postal VARCHAR(10),
    id_localidad INT,
    FOREIGN KEY (id_localidad)
        REFERENCES localidad (id_localidad)
);
CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    nif VARCHAR(20),
    telefono VARCHAR(20),
    tipo_empleado VARCHAR(50),
    id_tienda INT,
    FOREIGN KEY (id_tienda)
        REFERENCES tienda (id_tienda)
);
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME,
    tipo_pedido VARCHAR(50),
    precio_total DECIMAL(8,2),
    id_cliente INT,
    id_tienda INT,
    id_repartidor INT,
    fecha_entrega DATETIME,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
    FOREIGN KEY (id_repartidor) REFERENCES empleado(id_empleado)
);
CREATE TABLE pedido_producto (
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);




