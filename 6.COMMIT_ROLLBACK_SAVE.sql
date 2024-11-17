--Crear un índice en la columna NombreCurso
CREATE INDEX IDX_NombreCurso ON Cursos(NombreCurso);

--COMMIT: Confirma los cambios.
--ROLLBACK: Deshace los cambios.
--SAVEPOINT: Marca un punto intermedio en la transacción.

--Uso de COMMIT y ROLLBACK
BEGIN TRANSACTION;
INSERT INTO Estudiantes (Nombre, Apellido, Correo, FechaNacimiento)
VALUES ('Juan', 'Pérez', 'juan.perez@example2.com', '2000-01-01');
SELECT * FROM Estudiantes where Correo = 'juan.perez@example2.com';
-- Error detectado
ROLLBACK; -- Deshace el cambio

--Uso de SAVEPOINT
BEGIN TRANSACTION;

SAVE TRANSACTION Inicio;
INSERT INTO Estudiantes (Nombre, Apellido, Correo, FechaNacimiento)
VALUES ('Ana', 'López', 'ana.lopez2@example.com', '1999-02-15');

BEGIN TRANSACTION;
SAVE TRANSACTION PuntoIntermedio;
INSERT INTO Cursos (NombreCurso, Descripcion, Creditos, ProfesorID)
VALUES ('Logaritmos', 'Curso básico', 3, 1);

ROLLBACK TRANSACTION PuntoIntermedio; -- Deshace solo desde el segundo SAVEPOINT
COMMIT; -- Confirma los cambios restantes

delete from Estudiantes where EstudianteID = 15

SELECT * from cursos ;
SELECT * from Estudiantes;



