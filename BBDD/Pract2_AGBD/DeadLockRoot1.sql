-- DEADLOCK
SET autocommit = 0;
START TRANSACTION;

SELECT cursoID,area,edicion FROM practabd1.cursos
WHERE cursoID=10000;

UPDATE practabd1.personas
SET apellidos = 'Palotero'
WHERE personaID= 999990;


UPDATE practabd1.cursos
SET edicion = 2022
WHERE cursoID=10000;

COMMIT;
ROLLBACK;



-- LECTURA SUCIA
-- Cambiamos al nivel menos restrictivo Read Uncommited
-- Por defecto mysql tiene REPEATABLE READ
SET GLOBAL TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;
UPDATE practabd1.personas
SET dni = '50564673R', email= 'LECTURASUCIA@LECTURASUCIA'
WHERE personaID = 999990;

SELECT * FROM personas
WHERE dni='50564673R';

ROLLBACK;
COMMIT;



