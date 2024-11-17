INSERT INTO Estudiantes (Nombre, Apellido, Correo, FechaNacimiento)
VALUES
('María', 'López', 'maria.lopez@example.com', '1999-06-12'),
('Luis', 'Ramírez', 'luis.ramirez@example.com', '2001-02-22'),
('Carlos', 'Hernández', 'carlos.hernandez@example.com', '2002-01-17');

SELECT * from Estudiantes;

INSERT INTO Profesores (Nombre, Apellido, Especialidad, Correo)
VALUES
('Laura', 'Martínez', 'Matemáticas', 'laura.martinez@example.com'),
('Pedro', 'García', 'Física', 'pedro.garcia@example.com'),
('Carolina', 'Ruiz', 'Programación', 'carolina.ruiz@example.com'),
('Andrés', 'Jiménez', 'Química', 'andres.jimenez@example.com'),
('Sofía', 'Castro', 'Sistemas', 'sofia.castro@example.com');

INSERT INTO Profesores (Nombre, Apellido, Especialidad, Correo)
VALUES
('Laura', 'Martínez', 'Matemáticas', 'laura.martinez@example.com'),
('Pedro', 'García', 'Física', 'pedro.garcia@example.com'),
('Carolina', 'Ruiz', 'Programación', 'carolina.ruiz@example.com'),
('Andrés', 'Jiménez', 'Química', 'andres.jimenez@example.com'),
('Sofía', 'Castro', 'Sistemas', 'sofia.castro@example.com');

select * from Profesores;

INSERT INTO Cursos (NombreCurso, Descripcion, Creditos, ProfesorID)
VALUES
('Cálculo', 'Curso introductorio a cálculo diferencial', 4, 1),
('Física Básica', 'Introducción a los principios físicos', 3, 2),
('Programación en Python', 'Conceptos básicos de programación en Python', 5, 3),
('Química General', 'Bases de química inorgánica', 4, 4),
('Redes y Conectividad', 'Fundamentos de redes de computadoras', 4, 5);

select * from Cursos;

INSERT INTO Inscripciones (EstudianteID, CursoID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(5, 5),
(1, 3),
(2, 4),
(3, 5),
(5, 2);


select * from Inscripciones;

--Buscar estudiantes cuyo nombre empieza con "J"
SELECT Nombre, Apellido, Correo
FROM Estudiantes
WHERE Nombre LIKE 'J%';

--Buscar profesores con correos que terminen en "example.com"
SELECT Nombre, Apellido, Correo
FROM Profesores
WHERE Correo LIKE '%@example.com';

--Buscar estudiantes cuyos apellidos tienen exactamente 5 letras
SELECT Nombre, Apellido
FROM Estudiantes
WHERE Apellido LIKE '_____'; -- Cinco guiones bajos indican cinco letras


--Buscar cursos que contienen la palabra "programación"
SELECT NombreCurso, Descripcion
FROM Cursos
WHERE NombreCurso LIKE '%programación%';

-- INNER JOIN
-- Obtiene los nombres de estudiantes y los cursos en los que están inscritos:
SELECT 
    E.Nombre + ' ' + E.Apellido AS Estudiante,
    C.NombreCurso AS Curso,
    C.Creditos
FROM Inscripciones I
INNER JOIN Estudiantes E ON I.EstudianteID = E.EstudianteID
INNER JOIN Cursos C ON I.CursoID = C.CursoID;

--LEFT JOIN
--Muestra todos los cursos, incluyendo aquellos que no tienen inscripciones:
SELECT 
    C.NombreCurso,
    E.Nombre + ' ' + E.Apellido AS Estudiante
FROM Cursos C
LEFT JOIN Inscripciones I ON C.CursoID = I.CursoID
LEFT JOIN Estudiantes E ON I.EstudianteID = E.EstudianteID;

--CROSS JOIN
--Genera combinaciones de todos los estudiantes con todos los cursos:
SELECT 
    E.Nombre + ' ' + E.Apellido AS Estudiante,
    C.NombreCurso
FROM Estudiantes E
CROSS JOIN Cursos C;

--UNION
--Lista todos los nombres de profesores y estudiantes como un único conjunto:
SELECT Nombre + ' ' + Apellido AS Nombre
FROM Estudiantes
UNION
SELECT Nombre + ' ' + Apellido AS Nombre
FROM Profesores;

--EXCEPT
--Muestra los estudiantes que no están inscritos en ningún curso:
SELECT E.Nombre + ' ' + E.Apellido AS Estudiante
FROM Estudiantes E
EXCEPT
SELECT E.Nombre + ' ' + E.Apellido AS Estudiante
FROM Inscripciones I
INNER JOIN Estudiantes E ON I.EstudianteID = E.EstudianteID;

--SUBCONSULTA
SELECT 
    NombreCurso,
    (SELECT COUNT(*) 
     FROM Inscripciones I 
     WHERE I.CursoID = C.CursoID) AS TotalInscripciones
FROM Cursos C;




