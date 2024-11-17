--Muestra el nombre del profesor y la suma de los créditos de los cursos que imparte.
SELECT 
    P.Nombre + ' ' + P.Apellido AS Profesor,
    SUM(C.Creditos) AS TotalCreditos
FROM Profesores P
INNER JOIN Cursos C ON P.ProfesorID = C.ProfesorID
GROUP BY P.Nombre, P.Apellido;

--Muestra el nombre del curso y el promedio de créditos, pero solo para cursos con más de 3 créditos.
SELECT 
    NombreCurso,
    AVG(Creditos) AS PromedioCreditos
FROM Cursos
GROUP BY NombreCurso
HAVING AVG(Creditos) > 3;

--Muestra el nombre del curso y la fecha más reciente en que alguien se inscribió.
SELECT 
    C.NombreCurso,
    MAX(I.FechaInscripcion) AS UltimaInscripcion
FROM Cursos C
LEFT JOIN Inscripciones I ON C.CursoID = I.CursoID
GROUP BY C.NombreCurso;

--Muestra el nombre del curso y la fecha de nacimiento más antigua entre los estudiantes inscritos.
SELECT 
    C.NombreCurso,
    MIN(E.FechaNacimiento) AS FechaNacimientoMasAntigua
FROM Cursos C
INNER JOIN Inscripciones I ON C.CursoID = I.CursoID
INNER JOIN Estudiantes E ON I.EstudianteID = E.EstudianteID
GROUP BY C.NombreCurso;

--Muestra el nombre del curso y cuántos estudiantes están inscritos en él.
SELECT 
    C.NombreCurso,
    COUNT(I.InscripcionID) AS TotalInscritos
FROM Cursos C
LEFT JOIN Inscripciones I ON C.CursoID = I.CursoID
GROUP BY C.NombreCurso;

--Combina varias funciones para generar un reporte completo:
SELECT 
    P.Nombre + ' ' + P.Apellido AS Profesor,
    COUNT(C.CursoID) AS TotalCursos,
    SUM(C.Creditos) AS TotalCreditos,
    AVG(C.Creditos) AS PromedioCreditos,
    MAX(C.Creditos) AS MaxCreditos,
    MIN(C.Creditos) AS MinCreditos
FROM Profesores P
LEFT JOIN Cursos C ON P.ProfesorID = C.ProfesorID
GROUP BY P.Nombre, P.Apellido;

--Reporte de los cursos con más de 1 inscrito
SELECT 
    C.NombreCurso,                         -- Nombre del curso
    COUNT(I.InscripcionID) AS TotalInscritos, -- Total de inscripciones
    MAX(I.FechaInscripcion) AS UltimaInscripcion, -- Fecha más reciente de inscripción
    AVG(C.Creditos) AS PromedioCreditos -- Promedio de créditos de los cursos seleccionados
FROM Cursos C
LEFT JOIN Inscripciones I ON C.CursoID = I.CursoID
GROUP BY C.NombreCurso
HAVING COUNT(I.InscripcionID) > 1; -- Filtra los cursos con más de 1 inscrito
