CREATE PROCEDURE ObtenerInscripcionesPorEstudiante
    @NombreEstudiante NVARCHAR(100) -- Parámetro para filtrar por nombre del estudiante
AS
BEGIN
    SET NOCOUNT ON; -- Mejora el rendimiento al evitar mensajes innecesarios sobre filas afectadas.

    SELECT 
        I.InscripcionID,
        E.Nombre + ' ' + E.Apellido AS Estudiante,
        C.NombreCurso AS Curso,
        I.FechaInscripcion
    FROM Inscripciones I
    INNER JOIN Estudiantes E ON I.EstudianteID = E.EstudianteID
    INNER JOIN Cursos C ON I.CursoID = C.CursoID
    WHERE E.Nombre LIKE '%' + @NombreEstudiante + '%'; -- Filtro por nombre del estudiante
END;
GO


EXEC ObtenerInscripcionesPorEstudiante @NombreEstudiante = 'Ana';