-- DDL 
CREATE DATABASE politecnico;
GO

USE politecnico;
GO

CREATE TABLE Estudiantes (
    EstudianteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apeliido VARCHAR(100) NOT NULL,
    Correo VARCHAR(150) UNIQUE NOT NULL,
    FechaNacimiento DATE NOT NULL
);

CREATE TABLE Profesores (
    ProfesorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(150),
    Correo VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY IDENTITY(1,1),
    NombreCurso VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(250),
    Creditos INT NOT NULL,
    ProfesorID INT NOT NULL,
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID)
);

CREATE TABLE Inscripcion (
    InscripcionID INT PRIMARY KEY IDENTITY(1,1),
    EstudianteID INT NOT NULL,
    CursoID INT NOT NULL,
    FechaInscripcion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID),
    UNIQUE (EstudianteID, CursoID) -- Evita inscripciones duplicadas
);

-- NVARCHAR:
-- Para guardar nombres internacionales como "李小龙" o "أحمد". cubre practicamente todos los sistemas de escritura

-- VARCHAR:
-- Adecuado para datos en inglés o idiomas que usan caracteres latinos.

TRUNCATE TABLE Inscripciones;
TRUNCATE TABLE Cursos;
TRUNCATE TABLE Estudiantes;
TRUNCATE TABLE Profesores;

DROP TABLE Inscripciones;
DROP TABLE Cursos;
DROP TABLE Estudiantes;
DROP TABLE Profesores;

-- Cambiar el nombre de una tabla
EXEC sp_rename 'Inscripcion', 'Inscripciones';

-- Cambiar el nombre de una columna en una tabla
EXEC sp_rename 'Estudiantes.Apeliido', 'Apellido', 'COLUMN';

-- DML

INSERT INTO Estudiantes (Nombre, Apellido, Correo, FechaNacimiento)
VALUES 
('Juan', 'Pérez', 'juan.perez@example.com', '2000-05-15'),
('Ana', 'Gómez', 'ana.gomez@example.com', '1998-08-22'),
('Luis', 'Martínez', 'luis.martinez@example.com', '1999-11-03');

INSERT INTO Profesores (Nombre, Apellido, Especialidad, Correo)
VALUES 
('María', 'López', 'Matemáticas', 'maria.lopez@example.com'),
('Carlos', 'Ramírez', 'Ciencias', 'carlos.ramirez@example.com');

INSERT INTO Cursos (NombreCurso, Descripcion, Creditos, ProfesorID)
VALUES 
('Ingeniería de Software', 'Curso introductorio a ingeniería de software', 4, 1),
('Bases de Datos', 'Curso avanzado de bases de datos relacionales', 3, 1);

INSERT INTO Cursos (NombreCurso, Descripcion, Creditos, ProfesorID)
VALUES 
('Bases de Datos II', 'Curso introductorio a ingeniería de software', 4, 2);

INSERT INTO Cursos (NombreCurso, Descripcion, Creditos, ProfesorID)
VALUES 
('Bases de Datos IV', 'Curso introductorio a ingeniería de software', 4, 2);

INSERT INTO Inscripciones (EstudianteID, CursoID)
VALUES 
(1, 1),
(2, 1),
(3, 2);

INSERT INTO Inscripciones (EstudianteID, CursoID)
VALUES (1, 2);

SELECT * FROM Cursos;
SELECT * FROM Estudiantes;
SELECT * FROM Inscripciones;
SELECT * FROM Profesores;