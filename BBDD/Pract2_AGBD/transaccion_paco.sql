-- transaction en Paco -- PRGUNTAR A DANI
SET DELIMITER //
START TRANSACTION;
UPDATE practabd1.cursos 
SET nombre = 'Curso Big Data'
WHERE area = 'Big Data';
COMMIT;
SET DELIMITER ;

SELECT * FROM practabd1.cursos;