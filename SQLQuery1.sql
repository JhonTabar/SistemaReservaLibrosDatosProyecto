CREATE DATABASE SistemaReservaLibros

USE SistemaReservaLibros

CREATE TABLE Usuarios(
IDusuario INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombreUsuario VARCHAR(40) UNIQUE NOT NULL,
emailUsuario VARCHAR(50) NOT NULL
);

CREATE TABLE Genero(
IDgenero INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombreCategorGenero VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE Autores(
IDautor INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombreAutor VARCHAR(40) UNIQUE NOT NULL,
nacimientoAutor DATE,
);

CREATE TABLE Editorias(
IDeditoria INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombreEditoria VARCHAR(40) NOT NULL,
ubicacionEditoria VARCHAR(50),
telefonoEditoria VARCHAR(20) NOT NULL
);

CREATE TABLE Libros(
IDlibro INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
tituloLibro VARCHAR(40) NOT NULL,
fechaPublicacion DATE NOT NULL,
lenguaje VARCHAR(25) NOT NULL,

autor_id INT FOREIGN KEY REFERENCES Autores(IDautor) NOT NULL,
editoria_id INT FOREIGN KEY REFERENCES Editorias(IDeditoria) NOT NULL,
genero_id INT FOREIGN KEY REFERENCES Genero(IDgenero) NOT NULL
);

CREATE TABLE Copias(
IDcopia INT PRIMARY KEY IDENTITY(1,1),
libro_id INT FOREIGN KEY REFERENCES Libros(IDlibro) NOT NULL,
codigoBarra VARCHAR(50) UNIQUE NOT NULL,
ubicacion VARCHAR(100)
);

CREATE TABLE Reservas(
IDreserva INT PRIMARY KEY IDENTITY(1,1),
usuario_id INT FOREIGN KEY REFERENCES Usuarios(IDusuario) NOT NULL,
copias_id INT FOREIGN KEY REFERENCES Copias(IDcopia) NOT NULL
);


-- USUARIOS
INSERT INTO Usuarios (nombreUsuario, emailUsuario) VALUES
('jlopez', 'jlopez@example.com'),
('mgarcia', 'mgarcia@example.com'),
('arodriguez', 'arodriguez@example.com'),
('pcastro', 'pcastro@example.com'),
('lfernandez', 'lfernandez@example.com'),
('cmedina', 'cmedina@example.com'),
('rmartinez', 'rmartinez@example.com'),
('dvera', 'dvera@example.com'),
('hvaldez', 'hvaldez@example.com'),
('nruiz', 'nruiz@example.com');

-- GENERO
INSERT INTO Genero (nombreCategorGenero) VALUES
('Ciencia Ficción'), ('Fantasía'), ('Historia'),
('Biografía'), ('Misterio'), ('Romance'),
('Aventura'), ('Tecnología'), ('Psicología'), ('Filosofía');

-- AUTORES
INSERT INTO Autores (nombreAutor, nacimientoAutor) VALUES
('Isaac Asimov', '1920-01-02'),
('J.K. Rowling', '1965-07-31'),
('Yuval Noah Harari', '1976-02-24');

-- EDITORIAS
INSERT INTO Editorias (nombreEditoria, ubicacionEditoria, telefonoEditoria) VALUES
('Penguin Random House', 'New York, USA', '+1-212-366-2000'),
('Bloomsbury Publishing', 'London, UK', '+44-20-7631-5600'),
('HarperCollins', 'London, UK', '+44-20-7896-4000'),
('Planeta', 'Barcelona, España', '+34-93-492-8000'),
('Vintage Español', 'Miami, USA', '+1-305-555-1234'),
('Debate', 'Madrid, España', '+34-91-555-4433'),
('Alfaguara', 'Madrid, España', '+34-91-567-7890'),
('Ediciones B', 'Buenos Aires, Argentina', '+54-11-5555-5555'),
('Siglo XXI', 'Ciudad de México, México', '+52-55-1234-5678'),
('FCE', 'Ciudad de México, México', '+52-55-6789-1234');

-- LIBROS (usa IDs válidos según inserciones anteriores)
INSERT INTO Libros (tituloLibro, fechaPublicacion, lenguaje, autor_id, editoria_id, genero_id) VALUES
('Fundación', '1951-06-01', 'Español', 1, 1, 1),
('Yo, Robot', '1950-12-02', 'Español', 1, 4, 8),
('El Fin de la Eternidad', '1955-01-01', 'Español', 1, 3, 1),
('Harry Potter y la Piedra Filosofal', '1997-06-26', 'Español', 2, 2, 2),
('Harry Potter y la Cámara Secreta', '1998-07-02', 'Español', 2, 2, 2),
('Harry Potter y el Prisionero de Azkaban', '1999-07-08', 'Español', 2, 5, 2),
('Sapiens: De animales a dioses', '2011-01-01', 'Español', 3, 6, 3),
('Homo Deus', '2015-10-01', 'Español', 3, 6, 3),
('21 lecciones para el siglo XXI', '2018-09-04', 'Español', 3, 7, 3),
('Los propios dioses', '1972-03-15', 'Español', 1, 8, 1);

-- COPIAS (IDs de libro 1 a 10)
INSERT INTO Copias (libro_id, codigoBarra, ubicacion) VALUES
(1, 'CB001-FND', 'Estante A1'),
(2, 'CB002-YRB', 'Estante A1'),
(3, 'CB003-FDE', 'Estante A2'),
(4, 'CB004-HP1', 'Estante B1'),
(5, 'CB005-HP2', 'Estante B2'),
(6, 'CB006-HP3', 'Estante B3'),
(7, 'CB007-SPN', 'Estante C1'),
(8, 'CB008-HMD', 'Estante C2'),
(9, 'CB009-21L', 'Estante C3'),
(10, 'CB010-PDS', 'Estante A3');

-- RESERVAS (IDs de usuario 1 a 10, copias 1 a 10)
INSERT INTO Reservas (usuario_id, copias_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

SELECT *
FROM Libros

SELECT *
from Usuarios

SELECT a.nombreAutor
FROM Autores a

SELECT l.tituloLibro
FROM Libros l

SELECT a.IDautor, l.autor_id, a.nombreAutor, l.tituloLibro
FROM Autores a 
INNER JOIN Libros l
on a.IDautor = l.autor_id
WHERE nombreAutor = 'J.K. Rowling'

UPDATE Usuarios
SET nombreUsuario = 'Jhonatan Tabares', emailUsuario = 'tabaresjhonatan771@gmail.com'
WHERE IDusuario = 1

ALTER TABLE Usuarios
ADD telefono VARCHAR(20);

SELECT *
FROM Usuarios

UPDATE Usuarios SET telefono = '+1-202-555-0143' WHERE IDusuario = 1;
UPDATE Usuarios SET telefono = '+34-612-345-678' WHERE IDusuario = 2;
UPDATE Usuarios SET telefono = '+52-55-1234-5678' WHERE IDusuario = 3;
UPDATE Usuarios SET telefono = '+54-11-4567-8901' WHERE IDusuario = 4;
UPDATE Usuarios SET telefono = '+57-1-234-5678' WHERE IDusuario = 5;
UPDATE Usuarios SET telefono = '+506-2222-3333' WHERE IDusuario = 6;
UPDATE Usuarios SET telefono = '+56-2-9876-5432' WHERE IDusuario = 7;
UPDATE Usuarios SET telefono = '+1-305-555-0199' WHERE IDusuario = 8;
UPDATE Usuarios SET telefono = '+593-2-345-6789' WHERE IDusuario = 9;
UPDATE Usuarios SET telefono = '+591-2-876-5432' WHERE IDusuario = 10;


