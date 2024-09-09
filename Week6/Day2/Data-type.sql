--Parte 1: Base de Datos para un Supermercado

dDROP DATABASE IF EXISTS supermercado;

CREATE DATABASE supermercado;

USE supermercado;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

-- Insertar clientes
INSERT INTO Clientes (nombre, direccion, telefono, email) VALUES
('Juan Perez', 'Av. Central 123', '555-123456', 'juan@example.com'),
('Maria Gomez', 'Calle 45 #12-34', '555-654321', 'maria@example.com'),
('Carlos Ruiz', 'Cra 9 #89-12', '555-987654', 'carlos@example.com');

-- Insertar proveedores
INSERT INTO Proveedores (nombre_proveedor, direccion, telefono, email) VALUES
('Proveedor 1', 'Av. de los Proveedores 1', '555-111111', 'prov1@example.com'),
('Proveedor 2', 'Calle 22 #13-45', '555-222222', 'prov2@example.com');

-- Insertar productos
INSERT INTO Productos (nombre_producto, precio, id_proveedor) VALUES
('Manzanas', 2.50, 1),
('Leche', 1.30, 2),
('Pan', 1.00, 2),
('Queso', 5.00, 1);

--Parte 1: Base de Datos para un Supermercado

CREATE TABLE Peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(100),
    anio YEAR,
    genero VARCHAR(50),
    duracion INT
);

-- Insertar películas de ciencia ficción
INSERT INTO Peliculas (titulo, director, anio, genero, duracion) VALUES
('Blade Runner', 'Ridley Scott', 1982, 'Ciencia Ficción', 117),
('The Matrix', 'Wachowski Sisters', 1999, 'Ciencia Ficción', 136),
('Interstellar', 'Christopher Nolan', 2014, 'Ciencia Ficción', 169),
('Star Wars: A New Hope', 'George Lucas', 1977, 'Ciencia Ficción', 121),
('2001: A Space Odyssey', 'Stanley Kubrick', 1968, 'Ciencia Ficción', 149),
('Alien', 'Ridley Scott', 1979, 'Ciencia Ficción', 117),
('Inception', 'Christopher Nolan', 2010, 'Ciencia Ficción', 148),
('The Terminator', 'James Cameron', 1984, 'Ciencia Ficción', 107),
('Avatar', 'James Cameron', 2009, 'Ciencia Ficción', 162),
('Dune', 'Denis Villeneuve', 2021, 'Ciencia Ficción', 155);

