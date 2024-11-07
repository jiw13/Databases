SHOW GRANTS;

-- COSAS QUE NO PUEDE
DROP DATABASE practabd1;
DROP TABLE practabd1.cursos;
-- COSAS QUE SI PUEDE
INSERT INTO practabd1.cursos VALUE (33334,"Curso AGBD","Informatica",2023);
SELECT * FROM practabd1.cursos
WHERE cursoID = 33333;