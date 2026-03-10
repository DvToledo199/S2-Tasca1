CREATE SCHEMA IF NOT EXISTS youtube;
USE youtube;

DROP TABLE IF EXISTS reaccion_comentario;
DROP TABLE IF EXISTS reaccion_video;
DROP TABLE IF EXISTS playlist_video;
DROP TABLE IF EXISTS suscripcion;
DROP TABLE IF EXISTS video_etiqueta;
DROP TABLE IF EXISTS comentario;
DROP TABLE IF EXISTS playlist;
DROP TABLE IF EXISTS etiqueta;
DROP TABLE IF EXISTS video;
DROP TABLE IF EXISTS canal;
DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    password VARCHAR(100),
    nombre_usuario VARCHAR(100),
    fecha_nacimiento DATE,
    sexo VARCHAR(20),
    pais VARCHAR(100),
    codigo_postal VARCHAR(10)
);

CREATE TABLE canal (
    id_canal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255),
    fecha_creacion DATETIME,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE video (
    id_video INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    descripcion TEXT,
    tamano INT,
    nombre_archivo VARCHAR(255),
    duracion INT,
    thumbnail VARCHAR(255),
    reproducciones INT,
    estado ENUM('publico','oculto','privado'),
    fecha_publicacion DATETIME,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE etiqueta (
    id_etiqueta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE playlist (
    id_playlist INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_creacion DATETIME,
    estado ENUM('publica','privada'),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE comentario (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    texto TEXT,
    fecha DATETIME,
    id_usuario INT,
    id_video INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE video_etiqueta (
    id_video INT,
    id_etiqueta INT,
    PRIMARY KEY (id_video, id_etiqueta),
    FOREIGN KEY (id_video) REFERENCES video(id_video),
    FOREIGN KEY (id_etiqueta) REFERENCES etiqueta(id_etiqueta)
);

CREATE TABLE suscripcion (
    id_usuario INT,
    id_canal INT,
    fecha DATETIME,
    PRIMARY KEY (id_usuario, id_canal),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_canal) REFERENCES canal(id_canal)
);

CREATE TABLE playlist_video (
    id_playlist INT,
    id_video INT,
    PRIMARY KEY (id_playlist, id_video),
    FOREIGN KEY (id_playlist) REFERENCES playlist(id_playlist),
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE reaccion_video (
    id_usuario INT,
    id_video INT,
    tipo ENUM('like','dislike'),
    fecha DATETIME,
    PRIMARY KEY (id_usuario, id_video),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE reaccion_comentario (
    id_usuario INT,
    id_comentario INT,
    tipo ENUM('like','dislike'),
    fecha DATETIME,
    PRIMARY KEY (id_usuario, id_comentario),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_comentario) REFERENCES comentario(id_comentario)
);





