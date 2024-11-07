SELECT * FROM practabd1.personas;
SELECT COUNT(*) FROM practabd1.personas
WHERE fechaNac IS NULL;

SELECT nombre,dni FROM practabd1.personas
WHERE nombre="María";

SELECT edicion FROM practabd1.cursos
WHERE edicion<2008;

SELECT * FROM practabd1.cursos;
SELECT * FROM practabd1.matriculados_interesados;