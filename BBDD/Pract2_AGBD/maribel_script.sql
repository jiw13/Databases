SHOW GRANTS;
-- COSAS QUE NO PUEDE HACER MARIBEL
 DROP DATABASE practabd1;
 DROP TABLE practabd1.cursos;
 CREATE USER user1;
 CREATE ROLE role1;
 
 GRANT SELECT ON *.* TO role1;
 GRANT role1 TO user1;
 
 INSERT INTO practabd1.personas VALUES (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0),
                                       (333333,'50564673A','Perico','Palotes','H','Calle la pulmonia','Madrid','Aranjuez',28300,'722000000',0);
 
 -- COSAS QUE SI PUEDE
 SELECT COUNT(*) FROM practabd1.matriculados_interesados
 WHERE matriculado = 1;
 SELECT COUNT(*) FROM practabd1.personas;
 -- PERSONAS QUE NO ESTAN MATRICULADAS Y ADEMAS ESTAN EN PARO
 SELECT practabd1.personas.personaID,practabd1.personas.dni,practabd1.personas.nombre,practabd1.personas.apellidos,practabd1.personas.enParo, practabd1.matriculados_interesados.matriculado
 FROM practabd1.personas INNER JOIN practabd1.matriculados_interesados 
                         ON practabd1.personas.personaID = practabd1.matriculados_interesados.personaID
 WHERE matriculado = 0 AND enParo = 1;
-- CUANTAS PERSONAS ESTAN EN PARO Y NO MATRICULADAS 
SELECT COUNT(*) 
FROM practabd1.personas INNER JOIN practabd1.matriculados_interesados 
                        ON practabd1.personas.personaID = practabd1.matriculados_interesados.personaID
WHERE matriculado = 0 AND enParo = 1;
 
 SELECT * FROM practabd1.cursos;
 
 SELECT * FROM practabd1.matriculados_interesados
WHERE personaID = 5;
 
 UPDATE practabd1.matriculados_interesados
 SET matriculado = 1, cursoID = 4
 WHERE personaID = 5;

SELECT * FROM practabd1.matriculados_interesados
WHERE personaID = 5;