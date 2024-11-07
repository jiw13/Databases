#Ejercicio Indices

SELECT ac.first_name, ac.last_name, COUNT(*) Total
FROM (SELECT fi.film_id, actor_id
FROM film fi INNER JOIN film_actor fiac ON fi.film_id = fiac.film_id) jo
INNER JOIN actor ac ON ac.actor_id=jo.actor_id
WHERE ac.first_name="Lonzo" AND ac.last_name="Bode"
GROUP BY ac.first_name, ac.last_name;

ALTER TABLE actor
ADD INDEX optimizar (first_name ASC, last_name ASC) VISIBLE;

      
ALTER TABLE actor
ADD INDEX optimizar2 (first_name ASC) VISIBLE;      

UPDATE film
SET length_minutes = length_minutes +1
WHERE length_minutes >= 100;      