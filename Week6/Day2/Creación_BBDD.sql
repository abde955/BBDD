--Ejercicio 1: Normalización de una Base de Datos de Películas

--Tabla original
CREATE TABLE Peliculas (
  id_pelicula INT PRIMARY KEY,
  titulo VARCHAR(255),
  director VARCHAR(255),
  año_estreno INT,
  genero VARCHAR(50),
  actor_principal VARCHAR(255),
  actor_secundario VARCHAR(255),
  pais_origen VARCHAR(50)
);

INSERT INTO Peliculas (id_pelicula, titulo, director, año_estreno, genero, actor_principal, actor_secundario, pais_origen) VALUES
(1, 'The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama', 'Tim Robbins', 'Morgan Freeman', 'USA'),
(2, 'The Godfather', 'Francis Ford Coppola', 1972, 'Crime', 'Marlon Brando', 'Al Pacino', 'USA'),
(3, 'The Dark Knight', 'Christopher Nolan', 2008, 'Action', 'Christian Bale', 'Heath Ledger', 'USA'),
(4, 'Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 'Tom Hanks', 'Robin Wright', 'USA'),
(5, 'Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 'John Travolta', 'Samuel L. Jackson', 'USA'),
(6, 'Inception', 'Christopher Nolan', 2010, 'Sci-Fi', 'Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'USA'),
(7, 'Titanic', 'James Cameron', 1997, 'Romance', 'Leonardo DiCaprio', 'Kate Winslet', 'USA'),
(8, 'The Matrix', 'The Wachowskis', 1999, 'Sci-Fi', 'Keanu Reeves', 'Laurence Fishburne', 'USA'),
(9, 'Avatar', 'James Cameron', 2009, 'Sci-Fi', 'Sam Worthington', 'Zoe Saldana', 'USA'),
(10, 'Gladiator', 'Ridley Scott', 2000, 'Action', 'Russell Crowe', 'Joaquin Phoenix', 'USA');

--Descompón la tabla Peliculas en varias tablas siguiendo las reglas de normalización hasta alcanzar la 3FN. 

CREATE TABLE Peliculas (
  id_pelicula INT PRIMARY KEY,
  titulo VARCHAR(255),
  año_estreno INT,
  genero VARCHAR(50),
  pais_origen VARCHAR(50),
  id_director INT
);

INSERT INTO Peliculas (id_pelicula, titulo, año_estreno, genero, pais_origen, id_director) VALUES
(1, 'The Shawshank Redemption', 1994, 'Drama', 'USA', 1),
(2, 'The Godfather', 1972, 'Crime', 'USA', 2),
(3, 'The Dark Knight', 2008, 'Action', 'USA', 3),
(4, 'Forrest Gump', 1994, 'Drama', 'USA', 4),
(5, 'Pulp Fiction', 1994, 'Crime', 'USA', 5),
(6, 'Inception', 2010, 'Sci-Fi', 'USA', 3),
(7, 'Titanic', 1997, 'Romance', 'USA', 6),
(8, 'The Matrix', 1999, 'Sci-Fi', 'USA', 7),
(9, 'Avatar', 2009, 'Sci-Fi', 'USA', 6),
(10, 'Gladiator', 2000, 'Action', 'USA', 8);

--Tabla 2: Directores

CREATE TABLE Directores (
  id_director INT PRIMARY KEY,
  nombre VARCHAR(255)
);

INSERT INTO Directores (id_director, nombre) VALUES
(1, 'Frank Darabont'),
(2, 'Francis Ford Coppola'),
(3, 'Christopher Nolan'),
(4, 'Robert Zemeckis'),
(5, 'Quentin Tarantino'),
(6, 'James Cameron'),
(7, 'The Wachowskis'),
(8, 'Ridley Scott');

--Tabla 3: Actores

CREATE TABLE Actores (
  id_actor INT PRIMARY KEY,
  nombre VARCHAR(255)
);

INSERT INTO Actores (id_actor, nombre) VALUES
(1, 'Tim Robbins'),
(2, 'Morgan Freeman'),
(3, 'Marlon Brando'),
(4, 'Al Pacino'),
(5, 'Christian Bale'),
(6, 'Heath Ledger'),
(7, 'Tom Hanks'),
(8, 'Robin Wright'),
(9, 'John Travolta'),
(10, 'Samuel L. Jackson'),
(11, 'Leonardo DiCaprio'),
(12, 'Joseph Gordon-Levitt'),
(13, 'Kate Winslet'),
(14, 'Keanu Reeves'),
(15, 'Laurence Fishburne'),
(16, 'Sam Worthington'),
(17, 'Zoe Saldana'),
(18, 'Russell Crowe'),
(19, 'Joaquin Phoenix');

--Tabla 4: Reparto

CREATE TABLE Reparto (
  id_pelicula INT,
  id_actor INT,
  rol VARCHAR(50),
  PRIMARY KEY (id_pelicula, id_actor)
);

INSERT INTO Reparto (id_pelicula, id_actor, rol) VALUES
(1, 1, 'Principal'),
(1, 2, 'Secundario'),
(2, 3, 'Principal'),
(2, 4, 'Secundario'),
(3, 5, 'Principal'),
(3, 6, 'Secundario'),
(4, 7, 'Principal'),
(4, 8, 'Secundario'),
(5, 9, 'Principal'),
(5, 10, 'Secundario'),
(6, 11, 'Principal'),
(6, 12, 'Secundario'),
(7, 11, 'Principal'),
(7, 13, 'Secundario'),
(8, 14, 'Principal'),
(8, 15, 'Secundario'),
(9, 16, 'Principal'),
(9, 17, 'Secundario'),
(10, 18, 'Principal'),
(10, 19, 'Secundario');

--Ejercicio 2: Normalización de una Base de Datos de Coches

--Tabla 1: Propietarios
CREATE TABLE Propietarios (
    id_propietario INT PRIMARY KEY,  
    nombre VARCHAR(255) NOT NULL,   
    direccion VARCHAR(255) NOT NULL, 
    telefono VARCHAR(20) NOT NULL   
);

INSERT INTO Propietarios (id_propietario, nombre, direccion, telefono) VALUES
(1, 'Juan Pérez', 'Calle Principal 123', '123-456-7890'),
(2, 'María López', 'Avenida Libertad 456', '987-654-3210'),
(3, 'Pedro García', 'Calle Sur 789', '456-789-0123'),
(4, 'Ana Martínez', 'Calle Este 567', '321-654-0987'),
(5, 'Luisa Torres', 'Avenida Central 789', '789-012-3456'),
(6, 'Carlos Ruiz', 'Calle Norte 345', '210-987-6543'),
(7, 'Sofía Rodríguez', 'Avenida Oeste 890', '543-210-9876'),
(8, 'Javier Gómez', 'Calle Este 789', '012-345-6789'),
(9, 'Laura Sánchez', 'Avenida Libertad 678', '876-543-2109'),
(10, 'Diego Martín', 'Calle Principal 567', '234-567-8901');

--Tabla 2: Talleres

CREATE TABLE Talleres (
    id_taller INT PRIMARY KEY,      
    nombre VARCHAR(255) NOT NULL,  
    direccion VARCHAR(255) NOT NULL, 
    telefono VARCHAR(20) NOT NULL   
);

INSERT INTO Talleres (id_taller, nombre, direccion, telefono) VALUES
(1, 'Taller Juan', 'Avenida Central 456', '111-111-1111'),
(2, 'Taller Martínez', 'Calle Independencia 789', '222-222-2222'),
(3, 'Taller Rodríguez', 'Avenida Norte 123', '333-333-3333'),
(4, 'Taller Sánchez', 'Avenida Oeste 567', '444-444-4444'),
(5, 'Taller Gómez', 'Calle Principal 234', '555-555-5555'),
(6, 'Taller López', 'Avenida Sur 890', '666-666-6666'),
(7, 'Taller Martín', 'Calle Este 678', '777-777-7777'),
(8, 'Taller Pérez', 'Avenida Norte 345', '888-888-8888'),
(9, 'Taller Hernández', 'Calle Sur 456', '999-999-9999'),
(10, 'Taller Ruiz', 'Avenida Central 678', '000-000-0000');

--Tabla 3: Coches

CREATE TABLE Coches (
    id_coche INT PRIMARY KEY,       
    marca VARCHAR(255) NOT NULL,     
    modelo VARCHAR(255) NOT NULL, 
    año INT NOT NULL,            
    id_propietario INT NOT NULL,    
    id_taller INT NOT NULL,         
    FOREIGN KEY (id_propietario) REFERENCES Propietarios(id_propietario), 
    FOREIGN KEY (id_taller) REFERENCES Talleres(id_taller)                
);

INSERT INTO Coches (id_coche, marca, modelo, año, id_propietario, id_taller) VALUES
(1, 'Toyota', 'Corolla', 2018, 1, 1),
(2, 'Honda', 'Civic', 2017, 2, 2),
(3, 'Ford', 'Mustang', 2020, 3, 3),
(4, 'Chevrolet', 'Camaro', 2019, 4, 4),
(5, 'Nissan', 'Altima', 2016, 5, 5),
(6, 'BMW', 'X5', 2021, 6, 6),
(7, 'Mercedes-Benz', 'C-Class', 2019, 7, 7),
(8, 'Audi', 'A4', 2018, 8, 8),
(9, 'Hyundai', 'Elantra', 2017, 9, 9),
(10, 'Kia', 'Optima', 2019, 10, 10);

--Ejercicio 3: Normalización de una Base de Datos de Equipos de Fútbol

--Tabla 1: Equipos

CREATE TABLE Equipos (
    id_equipo INT PRIMARY KEY,
    nombre_equipo VARCHAR(255) NOT NULL,
    id_estadio INT NOT NULL,
    id_entrenador INT NOT NULL
);

INSERT INTO Equipos (id_equipo, nombre_equipo, id_estadio, id_entrenador) VALUES
(1, 'Real Madrid', 1, 1),
(2, 'FC Barcelona', 2, 2),
(3, 'Liverpool FC', 3, 3),
(4, 'Manchester City', 4, 4),
(5, 'Juventus FC', 5, 5),
(6, 'Bayern Munich', 6, 6),
(7, 'Paris Saint-Germain', 7, 7),
(8, 'Chelsea FC', 8, 8),
(9, 'Atlético de Madrid', 9, 9),
(10, 'AC Milan', 10, 10);

--Tabla 2: Estadios

CREATE TABLE Estadios (
    id_estadio INT PRIMARY KEY,
    nombre_estadio VARCHAR(255) NOT NULL,
    ciudad VARCHAR(255) NOT NULL
);

INSERT INTO Estadios (id_estadio, nombre_estadio, ciudad) VALUES
(1, 'Santiago Bernabéu', 'Madrid'),
(2, 'Camp Nou', 'Barcelona'),
(3, 'Anfield', 'Liverpool'),
(4, 'Etihad Stadium', 'Manchester'),
(5, 'Allianz Stadium', 'Turín'),
(6, 'Allianz Arena', 'Múnich'),
(7, 'Parc des Princes', 'París'),
(8, 'Stamford Bridge', 'Londres'),
(9, 'Wanda Metropolitano', 'Madrid'),
(10, 'San Siro', 'Milán');

--Tabla 3: Entrenadores

CREATE TABLE Entrenadores (
    id_entrenador INT PRIMARY KEY,
    nombre_entrenador VARCHAR(255) NOT NULL
);

INSERT INTO Entrenadores (id_entrenador, nombre_entrenador) VALUES
(1, 'Carlo Ancelotti'),
(2, 'Ronald Koeman'),
(3, 'Jürgen Klopp'),
(4, 'Pep Guardiola'),
(5, 'Massimiliano Allegri'),
(6, 'Julian Nagelsmann'),
(7, 'Mauricio Pochettino'),
(8, 'Thomas Tuchel'),
(9, 'Diego Simeone'),
(10, 'Stefano Pioli');

--Tabla 4: Jugadores

CREATE TABLE Jugadores (
    id_jugador INT PRIMARY KEY,
    nombre_jugador VARCHAR(255) NOT NULL
);

INSERT INTO Jugadores (id_jugador, nombre_jugador) VALUES
(1, 'Karim Benzema'),
(2, 'Luka Modric'),
(3, 'Sergio Ramos'),
(4, 'Lionel Messi'),
(5, 'Gerard Piqué'),
(6, 'Sergio Busquets'),
(7, 'Mohamed Salah'),
(8, 'Virgil van Dijk'),
(9, 'Sadio Mané'),
(10, 'Kevin De Bruyne'),
(11, 'Raheem Sterling'),
(12, 'Phil Foden'),
(13, 'Cristiano Ronaldo'),
(14, 'Paulo Dybala'),
(15, 'Giorgio Chiellini'),
(16, 'Robert Lewandowski'),
(17, 'Thomas Müller'),
(18, 'Manuel Neuer'),
(19, 'Kylian Mbappé'),
(20, 'Neymar Jr.'),
(21, 'Marco Verratti'),
(22, "N\'Golo Kanté"),
(23, 'Mason Mount'),
(24, 'Christian Pulisic'),
(25, 'Luis Suárez'),
(26, 'João Félix'),
(27, 'Jan Oblak'),
(28, 'Zlatan Ibrahimović'),
(29, 'Gianluigi Donnarumma'),
(30, 'Franck Kessié');

--Ejercicio 4: Normalización de una Base de Datos de Canciones

--Tabla 1: Canciones

CREATE TABLE Canciones (
    id_cancion INT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    id_artista INT NOT NULL,
    id_album INT NOT NULL,
    año_lanzamiento INT NOT NULL,
    id_genero INT NOT NULL,
    duracion TIME NOT NULL,
    id_compositor INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista),
    FOREIGN KEY (id_album) REFERENCES Albumes(id_album),
    FOREIGN KEY (id_genero) REFERENCES Generos(id_genero),
    FOREIGN KEY (id_compositor) REFERENCES Compositores(id_compositor)
);

INSERT INTO Canciones (id_cancion, titulo, id_artista, id_album, año_lanzamiento, id_genero, duracion, id_compositor) VALUES
(1, 'Bohemian Rhapsody', 1, 1, 1975, 1, '00:05:55', 1),
(2, 'Shape of You', 2, 2, 2017, 2, '00:03:53', 2),
(3, 'Rolling in the Deep', 3, 3, 2010, 2, '00:03:48', 3),
(4, 'Despacito', 4, 4, 2017, 2, '00:03:48', 4),
(5, 'Billie Jean', 5, 5, 1982, 2, '00:04:54', 6),
(6, 'Hotel California', 6, 6, 1976, 1, '00:06:30', 7),
(7, 'Stairway to Heaven', 7, 7, 1971, 1, '00:08:02', 10),
(8, 'Thinking Out Loud', 2, 2, 2014, 2, '00:04:41', 13),
(9, 'Shape of You', 2, 2, 2017, 2, '00:03:54', 2),
(10, 'Thriller', 5, 5, 1982, 2, '00:05:57', 12);

--Tabla 2: Artistas

CREATE TABLE Artistas (
    id_artista INT PRIMARY KEY,
    nombre_artista VARCHAR(255) NOT NULL
);

INSERT INTO Artistas (id_artista, nombre_artista) VALUES
(1, 'Queen'),
(2, 'Ed Sheeran'),
(3, 'Adele'),
(4, 'Luis Fonsi'),
(5, 'Michael Jackson'),
(6, 'Eagles'),
(7, 'Led Zeppelin');

--Tabla 3: Álbumes

CREATE TABLE Albumes (
    id_album INT PRIMARY KEY,
    nombre_album VARCHAR(255) NOT NULL
);

INSERT INTO Albumes (id_album, nombre_album) VALUES
(1, 'A Night at the Opera'),
(2, '÷'),
(3, '21'),
(4, 'Vida'),
(5, 'Thriller'),
(6, 'Hotel California'),
(7, 'Led Zeppelin IV');

--Tabla 4: Géneros

CREATE TABLE Generos (
    id_genero INT PRIMARY KEY,
    nombre_genero VARCHAR(255) NOT NULL
);

INSERT INTO Generos (id_genero, nombre_genero) VALUES
(1, 'Rock'),
(2, 'Pop');

--Ejercicio 5: Normalización de una Base de Datos de Animales

--Tabla 1: Animales

CREATE TABLE Animales (
    id_animal INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    especie VARCHAR(255) NOT NULL,
    edad INT NOT NULL,
    id_propietario INT NOT NULL,
    id_veterinario INT NOT NULL,
    FOREIGN KEY (id_propietario) REFERENCES Propietarios(id_propietario),
    FOREIGN KEY (id_veterinario) REFERENCES Veterinarios(id_veterinario)
);

INSERT INTO Animales (id_animal, nombre, especie, edad, id_propietario, id_veterinario) VALUES
(1, 'Max', 'Perro', 5, 1, 1),
(2, 'Whiskers', 'Gato', 3, 2, 2),
(3, 'Buddy', 'Perro', 7, 3, 3),
(4, 'Oliver', 'Gato', 2, 4, 4),
(5, 'Luna', 'Perro', 4, 5, 5),
(6, 'Simba', 'Gato', 1, 6, 6),
(7, 'Charlie', 'Perro', 6, 7, 7),
(8, 'Milo', 'Gato', 5, 8, 8),
(9, 'Bella', 'Perro', 3, 9, 9),
(10, 'Oreo', 'Gato', 2, 10, 10);

--Tabla 2: Propietarios

CREATE TABLE Propietarios (
    id_propietario INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

INSERT INTO Propietarios (id_propietario, nombre, direccion) VALUES
(1, 'Ana Martínez', 'Calle Principal 123'),
(2, 'Luisa Rodríguez', 'Calle Libertad 456'),
(3, 'Carlos Sánchez', 'Avenida Norte 789'),
(4, 'Laura Pérez', 'Calle Oeste 567'),
(5, 'Diego Gómez', 'Calle Principal 234'),
(6, 'María López', 'Avenida Sur 890'),
(7, 'Javier Ruiz', 'Calle Este 678'),
(8, 'Sofía Martín', 'Avenida Norte 345'),
(9, 'Pablo Hernández', 'Calle Oeste 678'),
(10, 'Lucía Rodríguez', 'Calle Libertad 890');

--Tabla 3: Veterinarios

CREATE TABLE Veterinarios (
    id_veterinario INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

INSERT INTO Veterinarios (id_veterinario, nombre, direccion) VALUES
(1, 'Dr. Pérez', 'Avenida Central 456'),
(2, 'Dr. Gómez', 'Avenida Sur 789'),
(3, 'Dra. López', 'Calle Este 123'),
(4, 'Dr. Martínez', 'Avenida Central 890'),
(5, 'Dra. Rodríguez', 'Avenida Libertad 678'),
(6, 'Dr. Hernández', 'Calle Norte 345'),
(7, 'Dra. Sánchez', 'Avenida Oeste 456'),
(8, 'Dra. Gómez', 'Avenida Central 789'),
(9, 'Dr. Pérez', 'Calle Principal 567'),
(10, 'Dr. Martínez', 'Avenida Sur 456');
