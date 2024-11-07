#Transacciones
SET AUTOCOMMIT = 0;
 START TRANSACTION ;
 INSERT INTO peliculas.film (title,description,release_date,language_id,original_language_id,length_minutes)
 VALUES ('Pulp Fiction','Pulp Fiction is a 1994 American crime film written and directed by Quentin Tarantino, who conceived it with Roger Avary.','1994-05-21','es','en',154);

SELECT * FROM peliculas.film
WHERE film.title LIKE ('Pulp %');
COMMIT;



START TRANSACTION;
DELETE FROM film WHERE film_id = 6006;
COMMIT;

