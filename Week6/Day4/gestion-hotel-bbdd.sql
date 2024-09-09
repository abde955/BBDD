-- Crear tabla Hotel
CREATE TABLE Hotel (
    ID_Hotel INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20)
);

-- Crear tabla Habitación
CREATE TABLE Habitacion (
    ID_Habitacion INT PRIMARY KEY,
    ID_Hotel INT,
    Número INT,
    Tipo VARCHAR(50),
    Precio_Noche DECIMAL(10, 2),
    FOREIGN KEY (ID_Hotel) REFERENCES Hotel(ID_Hotel)
);

-- Crear tabla Cliente
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Teléfono VARCHAR(20),
    Correo_Electronico VARCHAR(100)
);

-- Crear tabla Reserva
CREATE TABLE Reserva (
    ID_Reserva INT PRIMARY KEY,
    ID_Cliente INT,
    ID_Habitacion INT,
    Fecha_Checkin DATE,
    Fecha_Checkout DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Habitacion) REFERENCES Habitacion(ID_Habitacion)
);

-- Crear tabla Servicio
CREATE TABLE Servicio (
    ID_Servicio INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Costo DECIMAL(10, 2)
);

-- Crear tabla Cliente_Servicio (tabla intermedia para la relación muchos a muchos)
CREATE TABLE Cliente_Servicio (
    ID_Cliente INT,
    ID_Servicio INT,
    Fecha_Utilizacion DATE,
    PRIMARY KEY (ID_Cliente, ID_Servicio),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Servicio) REFERENCES Servicio(ID_Servicio)
);

--INSERTAR DATOS FALSOS EN LAS TABLAS

INSERT INTO Hotel (ID_Hotel, Nombre, Dirección, Teléfono) VALUES
(1, 'Hotel Gran Vista', 'Av. Principal 123, Ciudad', '555-1234'),
(2, 'Hotel Playa Azul', 'Calle Mar 456, Playa', '555-5678');

INSERT INTO Habitacion (ID_Habitacion, ID_Hotel, Número, Tipo, Precio_Noche) VALUES
(1, 1, 101, 'Doble', 100.00),
(2, 1, 102, 'Suite', 200.00),
(3, 2, 201, 'Sencilla', 80.00),
(4, 2, 202, 'Doble', 120.00);

INSERT INTO Cliente (ID_Cliente, Nombre, Teléfono, Correo_Electronico) VALUES
(1, 'Juan Pérez', '555-0001', 'juan.perez@email.com'),
(2, 'Ana Gómez', '555-0002', 'ana.gomez@email.com'),
(3, 'Luis Martínez', '555-0003', 'luis.martinez@email.com');

INSERT INTO Reserva (ID_Reserva, ID_Cliente, ID_Habitacion, Fecha_Checkin, Fecha_Checkout) VALUES
(1, 1, 1, '2024-09-10', '2024-09-15'),
(2, 2, 2, '2024-09-12', '2024-09-14'),
(3, 3, 4, '2024-09-20', '2024-09-25');

INSERT INTO Servicio (ID_Servicio, Nombre, Costo) VALUES
(1, 'Spa', 50.00),
(2, 'Gimnasio', 30.00),
(3, 'Desayuno', 20.00);

INSERT INTO Cliente_Servicio (ID_Cliente, ID_Servicio, Fecha_Utilizacion) VALUES
(1, 1, '2024-09-11'),
(1, 3, '2024-09-11'),
(2, 2, '2024-09-13'),
(3, 1, '2024-09-21');

--Parte 2: Implementación de Relaciones

--1. Relación One-to-One entre Cliente y Habitación

-- Añadir columna ID_Habitacion en la tabla Cliente
ALTER TABLE Cliente
ADD COLUMN ID_Habitacion INT UNIQUE;

-- Establecer la relación one-to-one
ALTER TABLE Cliente
ADD CONSTRAINT FK_Cliente_Habitacion
FOREIGN KEY (ID_Habitacion) REFERENCES Habitacion(ID_Habitacion);

--2. Relación One-to-Many entre Hotel y Habitación

ALTER TABLE Habitacion
ADD CONSTRAINT FK_Habitacion_Hotel
FOREIGN KEY (ID_Hotel) REFERENCES Hotel(ID_Hotel);

--3. Relación Many-to-Many entre Cliente y Servicio

ALTER TABLE Cliente_Servicio
ADD CONSTRAINT FK_Cliente_Servicio_Cliente
FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente);

ALTER TABLE Cliente_Servicio
ADD CONSTRAINT FK_Cliente_Servicio_Servicio
FOREIGN KEY (ID_Servicio) REFERENCES Servicio(ID_Servicio);

--Parte 3: Alteración de Tablas

-- Añadir columnas Fecha_Checkin, Fecha_Checkout y Estado
ALTER TABLE Reserva
ADD COLUMN Fecha_Checkin DATE,
ADD COLUMN Fecha_Checkout DATE,
ADD COLUMN Estado VARCHAR(50) NOT NULL;

--Parte 4: Consultas con Joins

--1. Obtener la Lista de Habitaciones Reservadas Junto con los Nombres de los Clientes

-- Obtener la lista de habitaciones reservadas junto con los nombres de los clientes
SELECT
    r.ID_Reserva,
    h.Número AS Habitacion_Numero,
    h.Tipo AS Habitacion_Tipo,
    c.Nombre AS Cliente_Nombre,
    r.Fecha_Checkin,
    r.Fecha_Checkout
FROM
    Reserva r
    INNER JOIN Habitacion h ON r.ID_Habitacion = h.ID_Habitacion
    INNER JOIN Cliente c ON r.ID_Cliente = c.ID_Cliente
WHERE
    r.Fecha_Checkin IS NOT NULL AND r.Fecha_Checkout IS NOT NULL;

--2. Obtener la Lista de Servicios Reservados por un Cliente Específico Junto con los Detalles de Cada Servicio

-- Obtener la lista de servicios reservados por un cliente específico junto con los detalles de cada servicio
SELECT
    cs.Fecha_Utilizacion,
    s.Nombre AS Servicio_Nombre,
    s.Costo AS Servicio_Costo
FROM
    Cliente_Servicio cs
    INNER JOIN Servicio s ON cs.ID_Servicio = s.ID_Servicio
WHERE
    cs.ID_Cliente = 1; -- Hay que reemplazar el 1 con el ID del cliente específico
