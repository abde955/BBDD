CREATE DATABASE peliculas_complejo;

USE peliculas_complejo;

-- Crear la tabla Directores
CREATE TABLE Directores (
    id_director INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Crear la tabla Actores
CREATE TABLE Actores (
    id_actor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Crear la tabla Peliculas
CREATE TABLE Peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    anio INT,
    id_director INT,
    genero VARCHAR(100),
    FOREIGN KEY (id_director) REFERENCES Directores(id_director)
);

-- Crear la tabla intermedia PeliculasActores para la relación muchos a muchos entre Peliculas y Actores
CREATE TABLE PeliculasActores (
    id_pelicula INT,
    id_actor INT,
    PRIMARY KEY (id_pelicula, id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor)
);

INSERT INTO Directores (nombre) VALUES
('Christopher Nolan'),
('Quentin Tarantino'),
('Frank Darabont'),
('Francis Ford Coppola'),
('Robert Zemeckis'),
('Steven Spielberg'),
('James Cameron'),
('Martin Scorsese'),
('The Wachowskis'),
('David Fincher'),
('Ridley Scott'),
('Peter Jackson'),
('Alejandro G. Iñárritu'),
('Wes Anderson'),
('Spike Jonze'),
('Damien Chazelle'),
('Brad Bird'),
('Pete Docter'),
('Hayao Miyazaki'),
('Andrew Stanton');

INSERT INTO Actores (nombre) VALUES
('Leonardo DiCaprio'),
('Christian Bale'),
('John Travolta'),
('Tim Robbins'),
('Marlon Brando'),
('Tom Hanks'),
('Keanu Reeves'),
('Brad Pitt'),
('Elijah Wood'),
('Russell Crowe'),
('Joaquin Phoenix'),
('Jodie Foster'),
('Sam Neill'),
('Kate Winslet'),
('Sam Worthington'),
('Matt Damon'),
('Kevin Spacey'),
('Gabriel Byrne'),
('Ralph Fiennes'),
('Joaquin Phoenix');

INSERT INTO Peliculas (titulo, anio, id_director, genero) VALUES
('Inception', 2010, 1, 'Sci-Fi'),
('The Dark Knight', 2008, 1, 'Action'),
('Pulp Fiction', 1994, 2, 'Crime'),
('The Shawshank Redemption', 1994, 3, 'Drama'),
('The Godfather', 1972, 4, 'Crime'),
('Forrest Gump', 1994, 5, 'Drama'),
('The Matrix', 1999, 6, 'Sci-Fi'),
('Fight Club', 1999, 7, 'Drama'),
('The Lord of the Rings: The Return of the King', 2003, 8, 'Fantasy'),
('Gladiator', 2000, 9, 'Action'),
('The Silence of the Lambs', 1991, 10, 'Thriller'),
('Jurassic Park', 1993, 11, 'Adventure'),
('Titanic', 1997, 12, 'Romance'),
('Avatar', 2009, 12, 'Sci-Fi'),
('The Departed', 2006, 13, 'Crime'),
('The Usual Suspects', 1995, 14, 'Crime'),
('Saving Private Ryan', 1998, 11, 'War'),
('Interstellar', 2014, 1, 'Sci-Fi'),
('The Prestige', 2006, 1, 'Drama'),
('Whiplash', 2014, 15, 'Drama'),
('Her', 2013, 16, 'Romance'),
('The Grand Budapest Hotel', 2014, 17, 'Comedy'),
('The Revenant', 2015, 12, 'Adventure'),
('The Social Network', 2010, 7, 'Drama'),
('The Wolf of Wall Street', 2013, 13, 'Biography'),
('The Shining', 1980, 14, 'Horror'),
('Psycho', 1960, 14, 'Horror'),
('American Beauty', 1999, 15, 'Drama'),
('Goodfellas', 1990, 13, 'Crime'),
('No Country for Old Men', 2007, 13, 'Crime'),
('The Big Lebowski', 1998, 14, 'Comedy'),
('A Beautiful Mind', 2001, 15, 'Biography'),
('The Curious Case of Benjamin Button', 2008, 7, 'Fantasy'),
('The Iron Giant', 1999, 16, 'Animation'),
('WALL-E', 2008, 16, 'Animation'),
('Spirited Away', 2001, 17, 'Animation'),
('Coco', 2017, 17, 'Animation'),
('Inside Out', 2015, 16, 'Animation'),
('Moana', 2016, 17, 'Animation'),
('Zootopia', 2016, 17, 'Animation'),
('Finding Nemo', 2003, 16, 'Animation'),
('Ratatouille', 2007, 16, 'Animation');

INSERT INTO PeliculasActores (id_pelicula, id_actor) VALUES
-- Inception
(1, 1), (1, 2),
-- The Dark Knight
(2, 1), (2, 3),
-- Pulp Fiction
(3, 4), (3, 5),
-- The Shawshank Redemption
(4, 6), (4, 7),
-- The Godfather
(5, 8), (5, 9),
-- Forrest Gump
(6, 6), (6, 10),
-- The Matrix
(7, 11), (7, 12),
-- Fight Club
(8, 13), (8, 14),
-- The Lord of the Rings: The Return of the King
(9, 15), (9, 16),
-- Gladiator
(10, 17), (10, 18),
-- The Silence of the Lambs
(11, 19), (11, 20),
-- Jurassic Park
(12, 21), (12, 22),
-- Titanic
(13, 1), (13, 23),
-- Avatar
(14, 24), (14, 25),
-- The Departed
(15, 1), (15, 26),
-- The Usual Suspects
(16, 27), (16, 28),
-- Saving Private Ryan
(17, 29), (17, 30),
-- Interstellar
(18, 1), (18, 31),
-- The Prestige
(19, 1), (19, 32),
-- Whiplash
(20, 33), (20, 34),
-- Her
(21, 35), (21, 36),
-- The Grand Budapest Hotel
(22, 37), (22, 38),
-- The Revenant
(23, 39), (23, 40),
-- The Social Network
(24, 41), (24, 42),
-- The Wolf of Wall Street
(25, 1), (25, 43),
-- The Shining
(26, 44), (26, 45),
-- Psycho
(27, 44), (27, 46),
-- American Beauty
(28, 47), (28, 48),
-- Goodfellas
(29, 49), (29, 50),
-- No Country for Old Men
(30, 49), (30, 51),
-- The Big Lebowski
(31, 52), (31, 53),
-- A Beautiful Mind
(32, 54), (32, 55),
-- The Curious Case of Benjamin Button
(33, 56), (33, 57),
-- The Iron Giant
(34, 58), (34, 59),
-- WALL-E
(35, 60), (35, 61),
-- Spirited Away
(36, 62), (36, 63),
-- Coco
(37, 64), (37, 65),
-- Inside Out
(38, 66), (38, 67),
-- Moana
(39, 68), (39, 69),
-- Zootopia
(40, 70), (40, 71),
-- Finding

--Realizar consultas y funciones:

--Consulta que devuelva todas las películas

SELECT * FROM Peliculas;

--Consulta que devuelva las películas entre 1980 y 2000

SELECT * FROM Peliculas WHERE anio BETWEEN 1980 AND 2000;

--Consulta que devuelva la cantidad de películas de un género bajo el nombre de "num_peliculas"

SELECT genero, COUNT(*) AS num_peliculas FROM Peliculas GROUP BY genero;

--Consulta que devuelva todas las películas con sus actores principales y secundarios

SELECT p.titulo, a1.nombre AS actor_principal, a2.nombre AS actor_secundario
FROM Peliculas p
JOIN PeliculasActores pa1 ON p.id_pelicula = pa1.id_pelicula
JOIN Actores a1 ON pa1.id_actor = a1.id_actor
JOIN PeliculasActores pa2 ON p.id_pelicula = pa2.id_pelicula
JOIN Actores a2 ON pa2.id_actor = a2.id_actor AND a1.id_actor != a2.id_actor;

--Consulta que seleccione todas las películas que tengan un actor específico (Por ejemplo: Tom Hanks)

SELECT p.*
FROM Peliculas p
JOIN PeliculasActores pa ON p.id_pelicula = pa.id_pelicula
JOIN Actores a ON pa.id_actor = a.id_actor
WHERE a.nombre = 'Tom Hanks';

-- Insertar Datos en Varias Tablas con START TRANSACTION y COMMIT

START TRANSACTION;

SET @id_director = (SELECT id_director FROM Directores WHERE nombre = 'James Cameron');
SET @id_actor = (SELECT id_actor FROM Actores WHERE nombre = 'Tom Hanks');

INSERT INTO Peliculas (titulo, anio, id_director, genero) VALUES
('Terminator', 1984, @id_director, 'Sci-Fi');

SET @id_pelicula = LAST_INSERT_ID();

INSERT INTO PeliculasActores (id_pelicula, id_actor) VALUES
(@id_pelicula, @id_actor);

COMMIT;


