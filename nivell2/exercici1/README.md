# Ejercicio 1 – YouTube

Modelado de una base de datos para una versión simplificada de la plataforma YouTube.

El objetivo del ejercicio es diseñar la estructura de datos necesaria para gestionar usuarios, vídeos, canales, comentarios, playlists y las interacciones entre ellos.

## Entidades principales

- Usuario
- Canal
- Video
- Comentario
- Playlist
- Etiqueta

## Relaciones

El modelo incluye distintas relaciones entre entidades:

- Un usuario puede publicar muchos vídeos.
- Un usuario puede crear un canal.
- Un usuario puede suscribirse a canales de otros usuarios.
- Un vídeo puede tener múltiples etiquetas.
- Un usuario puede crear playlists con vídeos.
- Un usuario puede comentar en vídeos.
- Un usuario puede reaccionar (like / dislike) a vídeos y comentarios.

Para resolver las relaciones **muchos a muchos (N:N)** se utilizan tablas intermedias.

## Tablas intermedias

- video_etiqueta
- suscripcion
- playlist_video
- reaccion_video
- reaccion_comentario

## Archivos incluidos

- **youtube.sql** → Script SQL para la creación de la base de datos y sus tablas.
- **youtube_model.png** → Diagrama entidad-relación del modelo de datos.

## Diagrama

![Modelo YouTube](youtube_model.png)
