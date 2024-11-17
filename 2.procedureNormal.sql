--Un procedimiento almacenado es un conjunto de instrucciones SQL precompiladas que se almacenan 
--en la base de datos y se pueden ejecutar cuando se necesiten.

--Automatiza tareas repetitivas

--SP Sencillo
CREATE PROCEDURE ObtenerInscripciones
AS
BEGIN
    SELECT 
        I.InscripcionID,
        E.Nombre + ' ' + E.Apellido AS Estudiante,
        C.NombreCurso AS Curso,
        I.FechaInscripcion
    FROM Inscripciones I
    INNER JOIN Estudiantes E ON I.EstudianteID = E.EstudianteID
    INNER JOIN Cursos C ON I.CursoID = C.CursoID
    ORDER BY Estudiante ASC;
END;
GO

EXEC ObtenerInscripciones;