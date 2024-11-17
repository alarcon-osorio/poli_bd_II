CREATE TRIGGER TriggerEvitarCursoDuplicado
ON Cursos
INSTEAD OF INSERT
AS
BEGIN
    -- Declarar variable para el nombre del curso insertado
    DECLARE @CursoNombre NVARCHAR(100);

    -- Obtener el nombre del curso insertado desde la tabla 'inserted'
    SELECT @CursoNombre = NombreCurso
    FROM inserted;

    -- Verificar si ya existe un curso con el mismo nombre
    IF EXISTS (SELECT 1 FROM Cursos WHERE NombreCurso = @CursoNombre)
    BEGIN
        -- Notificar al usuario que el nombre del curso ya existe
        RAISERROR ('Ya existe un curso con ese nombre. No se puede insertar un curso duplicado.', 16, 1);
    END
    ELSE
    BEGIN
        -- Si no existe, insertar el nuevo curso
        INSERT INTO Cursos (NombreCurso, Descripcion, Creditos, ProfesorID)
        SELECT NombreCurso, Descripcion, Creditos, ProfesorID
        FROM inserted;
    END
END;
GO

DROP TRIGGER TriggerEvitarCursoDuplicado;
