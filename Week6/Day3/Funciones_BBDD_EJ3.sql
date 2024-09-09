CREATE DATABASE peliculas_db;

USE peliculas_db;

CREATE TABLE Peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    anio INT,
    director VARCHAR(255),
    actor_principal VARCHAR(255),
    actor_secundario VARCHAR(255),
    genero VARCHAR(100)
);

INSERT INTO Peliculas (titulo, anio, director, actor_principal, actor_secundario, genero) VALUES
('Inception', 2010, 'Christopher Nolan', 'Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Sci-Fi'),
('The Dark Knight', 2008, 'Christopher Nolan', 'Christian Bale', 'Heath Ledger', 'Action'),
('Pulp Fiction', 1994, 'Quentin Tarantino', 'John Travolta', 'Uma Thurman', 'Crime'),
('The Shawshank Redemption', 1994, 'Frank Darabont', 'Tim Robbins', 'Morgan Freeman', 'Drama'),
('The Godfather', 1972, 'Francis Ford Coppola', 'Marlon Brando', 'Al Pacino', 'Crime'),
('Forrest Gump', 1994, 'Robert Zemeckis', 'Tom Hanks', 'Robin Wright', 'Drama'),
('The Matrix', 1999, 'The Wachowskis', 'Keanu Reeves', 'Laurence Fishburne', 'Sci-Fi'),
('Fight Club', 1999, 'David Fincher', 'Brad Pitt', 'Edward Norton', 'Drama'),
('The Lord of the Rings: The Return of the King', 2003, 'Peter Jackson', 'Elijah Wood', 'Viggo Mortensen', 'Fantasy'),
('Gladiator', 2000, 'Ridley Scott', 'Russell Crowe', 'Joaquin Phoenix', 'Action'),
('The Silence of the Lambs', 1991, 'Jonathan Demme', 'Jodie Foster', 'Anthony Hopkins', 'Thriller'),
('Jurassic Park', 1993, 'Steven Spielberg', 'Sam Neill', 'Laura Dern', 'Adventure'),
('Titanic', 1997, 'James Cameron', 'Leonardo DiCaprio', 'Kate Winslet', 'Romance'),
('Avatar', 2009, 'James Cameron', 'Sam Worthington', 'Zoe Saldana', 'Sci-Fi'),
('The Departed', 2006, 'Martin Scorsese', 'Leonardo DiCaprio', 'Matt Damon', 'Crime'),
('The Usual Suspects', 1995, 'Bryan Singer', 'Kevin Spacey', 'Gabriel Byrne', 'Crime'),
('Saving Private Ryan', 1998, 'Steven Spielberg', 'Tom Hanks', 'Matt Damon', 'War'),
('Interstellar', 2014, 'Christopher Nolan', 'Matthew McConaughey', 'Anne Hathaway', 'Sci-Fi'),
('The Prestige', 2006, 'Christopher Nolan', 'Christian Bale', 'Hugh Jackman', 'Drama'),
('Whiplash', 2014, 'Damien Chazelle', 'Miles Teller', 'J.K. Simmons', 'Drama'),
('Her', 2013, 'Spike Jonze', 'Joaquin Phoenix', 'Scarlett Johansson', 'Romance'),
('The Grand Budapest Hotel', 2014, 'Wes Anderson', 'Ralph Fiennes', 'F. Murray Abraham', 'Comedy'),
('The Revenant', 2015, 'Alejandro G. Iñárritu', 'Leonardo DiCaprio', 'Tom Hardy', 'Adventure'),
('The Social Network', 2010, 'David Fincher', 'Jesse Eisenberg', 'Andrew Garfield', 'Drama'),
('The Wolf of Wall Street', 2013, 'Martin Scorsese', 'Leonardo DiCaprio', 'Jonah Hill', 'Biography'),
('The Shining', 1980, 'Stanley Kubrick', 'Jack Nicholson', 'Shelley Duvall', 'Horror'),
('Psycho', 1960, 'Alfred Hitchcock', 'Anthony Perkins', 'Janet Leigh', 'Horror'),
('American Beauty', 1999, 'Sam Mendes', 'Kevin Spacey', 'Annette Bening', 'Drama'),
('Goodfellas', 1990, 'Martin Scorsese', 'Ray Liotta', 'Robert De Niro', 'Crime'),
('No Country for Old Men', 2007, 'Joel and Ethan Coen', 'Josh Brolin', 'Tommy Lee Jones', 'Crime'),
('The Big Lebowski', 1998, 'Joel and Ethan Coen', 'Jeff Bridges', 'John Goodman', 'Comedy'),
('A Beautiful Mind', 2001, 'Ron Howard', 'Russell Crowe', 'Jennifer Connelly', 'Biography'),
('The Curious Case of Benjamin Button', 2008, 'David Fincher', 'Brad Pitt', 'Cate Blanchett', 'Fantasy'),
('The Iron Giant', 1999, 'Brad Bird', 'Jennifer Aniston', 'Vin Diesel', 'Animation'),
('WALL-E', 2008, 'Andrew Stanton', 'Ben Burtt', 'Elissa Knight', 'Animation'),
('Spirited Away', 2001, 'Hayao Miyazaki', 'Daveigh Chase', 'Suzanne Pleshette', 'Animation'),
('Coco', 2017, 'Lee Unkrich', 'Anthony Gonzalez', 'Gail Garcia Bernal', 'Animation'),
('Inside Out', 2015, 'Pete Docter', 'Amy Poehler', 'Phyllis Smith', 'Animation'),
('Moana', 2016, 'Ron Clements', 'Auliʻi Cravalho', 'Dwayne Johnson', 'Animation'),
('Zootopia', 2016, 'Byron Howard', 'Ginnifer Goodwin', 'Jason Bateman', 'Animation'),
('Finding Nemo', 2003, 'Andrew Stanton', 'Albert Brooks', 'Ellen DeGeneres', 'Animation'),
('Ratatouille', 2007, 'Brad Bird', 'Patton Oswalt', 'Ian Holm', 'Animation');

--Consulta que devuelva todas las películas:

SELECT * FROM Peliculas;

--Consulta que devuelva las películas de Christopher Nolan:

SELECT * FROM Peliculas WHERE director = 'Christopher Nolan';

--Consulta que ordene las películas por orden descendente en función al año:

SELECT * FROM Peliculas ORDER BY anio DESC;

--Consulta que devuelva las películas entre los años 1990 y 2000:

SELECT * FROM Peliculas WHERE anio BETWEEN 1990 AND 2000;

--Consulta que devuelva cuántas películas hay de cada género:

SELECT genero, COUNT(*) AS cantidad_peliculas FROM Peliculas GROUP BY genero;

