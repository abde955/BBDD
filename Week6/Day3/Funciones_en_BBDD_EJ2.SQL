dDROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE biblioteca;

USE biblioteca;

-- Crear tabla Libros
CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    fecha_publicacion DATE
);

-- Crear tabla Autores
CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(100)
);

-- Crear tabla Géneros
CREATE TABLE Generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre_genero VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Crear tabla Miembros
CREATE TABLE Miembros (
    id_miembro INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    email VARCHAR(100)
);

-- Crear tabla Préstamos
CREATE TABLE Prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_devolucion DATE,
    id_miembro INT,
    FOREIGN KEY (id_miembro) REFERENCES Miembros(id_miembro)
);

-- Crear tabla intermedia Libro_Autor para la relación muchos a muchos entre Libros y Autores
CREATE TABLE Libro_Autor (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);

-- Crear tabla intermedia Libro_Genero para la relación muchos a muchos entre Libros y Géneros
CREATE TABLE Libro_Genero (
    id_libro INT,
    id_genero INT,
    PRIMARY KEY (id_libro, id_genero),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
    FOREIGN KEY (id_genero) REFERENCES Generos(id_genero)
);

-- Crear tabla intermedia Prestamo_Libro para la relación muchos a muchos entre Prestamos y Libros
CREATE TABLE Prestamo_Libro (
    id_prestamo INT,
    id_libro INT,
    PRIMARY KEY (id_prestamo, id_libro),
    FOREIGN KEY (id_prestamo) REFERENCES Prestamos(id_prestamo),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);
