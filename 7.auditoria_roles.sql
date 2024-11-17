--Un rol en SQL Server es un conjunto de permisos que se asignan a un usuario. 
--Los roles se pueden usar para simplificar la gestión de permisos en una base de datos.
CREATE ROLE Rol_Profesor;
-- Otorgar permisos a un rol
GRANT SELECT, UPDATE ON Cursos TO Rol_Profesor;

-- Crear el login en el servidor de SQL Server
CREATE LOGIN ProfesorLogin WITH PASSWORD = 'ContraseñaSegura123';

-- Crear un usuario en la base de datos
CREATE USER Usuario_Profesor FOR LOGIN ProfesorLogin;

-- Asignar un rol al usuario
EXEC sp_addrolemember 'Rol_Profesor', 'Usuario_Profesor';

-- Eliminar un usuario
DROP USER Usuario_Profesor;

-- Otorgar permisos de SELECT a un usuario sobre una tabla específica
GRANT SELECT ON Cursos TO Usuario_Profesor;

-- Otorgar permisos de INSERT y UPDATE a un usuario
GRANT INSERT, UPDATE ON Estudiantes TO Usuario_Profesor;

-- Revocar permisos
REVOKE SELECT ON Cursos FROM Usuario_Profesor;

-- Denegar permisos
DENY DELETE ON Estudiantes TO Usuario_Profesor;


-- Crear una tabla de auditoría
CREATE TABLE AuditoriaEstudiantes (
    EstudianteID INT,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    Correo NVARCHAR(150),
    FechaAccion DATETIME,
    Accion NVARCHAR(10)
);

-- Crear un trigger para auditar INSERTS en la tabla de Estudiantes
CREATE TRIGGER AuditoriaInsertEstudiantes
ON Estudiantes
FOR INSERT
AS
BEGIN
    INSERT INTO AuditoriaEstudiantes (EstudianteID, Nombre, Apellido, Correo, FechaAccion, Accion)
    SELECT EstudianteID, Nombre, Apellido, Correo, GETDATE(), 'INSERT'
    FROM inserted;
END;
GO

-- Consultar la auditoría de estudiantes
SELECT * FROM AuditoriaEstudiantes;






