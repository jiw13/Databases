-- DEADLOCK

SET autocommit = 0;
START TRANSACTION;

SELECT personaID FROM practabd1.personas
WHERE personaID=10000;


UPDATE practabd1.cursos
SET edicion = 2023
WHERE cursoID=10000;

UPDATE practabd1.personas
SET apellidos = 'Garcia'
WHERE personaID= 999990;
                                
COMMIT;
ROLLBACK;

-- LECTURA SUCIA
-- Cambiamos al nivel menos restrictivo Read Uncommited
-- Por defecto mysql tiene REPEATABLE READ

SET GLOBAL TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT * FROM personas
WHERE dni='00000000R';

SELECT * FROM personas
WHERE personaID=999990;

SELECT * FROM personas
WHERE dni='50564673R';

SELECT * FROM personas
WHERE personaID=999990;
ROLLBACK;









