CREATE VIEW VistaCursosProfesores
AS
SELECT 
    C.NombreCurso,
    P.Nombre + ' ' + P.Apellido AS Profesor,
    P.Especialidad
FROM Cursos C
INNER JOIN Profesores P ON C.ProfesorID = P.ProfesorID;
GO

SELECT * FROM VistaCursosProfesores;