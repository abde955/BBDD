dDROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE libros (
    id_libro INT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    anio_publicacion INT CHECK (anio_publicacion > 0),
    genero VARCHAR(255) NOT NULL
);

CREATE TABLE autores(
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE ejemplares(
    id_ejemplar INT PRIMARY KEY,
    id_libro INT,
    ubicacion VARCHAR(255) NOT NULL,
    estado ENUM('disponible', 'prestado', 'dañado') NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

CREATE TABLE editoriales(
    id_editorial INT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE editoriales(
    id_editorial INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE libroautor(
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro),
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);
