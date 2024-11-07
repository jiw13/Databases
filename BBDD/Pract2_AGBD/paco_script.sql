SHOW GRANTS;
SELECT * FROM practabd1.cursos;

-- Sentencias que no puede
DROP DATABASE practabd1;
DROP TABLE practabd1.cursos;
INSERT INTO practabd1.cursos VALUE (1002,"CursoNulo","Ninguna",2033);


-- Sentencias que si puede
SELECT dni,personaID, nombre,apellidos FROM practabd1.personas WHERE enParo = 1 AND genero = 'M'
ORDER BY personaID
LIMIT 10;

UPDATE practabd1.personas
SET nombre = 'María Antonia'
WHERE personaID = 5;
