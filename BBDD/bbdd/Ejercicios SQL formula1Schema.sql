
#Consulta 26
SELECT surname, forename FROM drivers 
WHERE driverId IN (SELECT driverId 
                   FROM results NATURAL JOIN races
				   WHERE year BETWEEN 1990 AND 2000
                   GROUP BY driverId
                   HAVING SUM(points)>=ALL (SELECT SUM (points)
											FROM results NATURAL JOIN races
											WHERE year between 1990 AND 2000
                                            GROUP BY driverId));
                                            
#Consulta 26 sin poder usar ALL
SELECT surname,forename FROM drivers 
WHERE driverId IN (SELECT driverId 
                   FROM results NATURAL JOIN races
				   WHERE year BETWEEN 1990 AND 2000
                   GROUP BY driverId
                   HAVING SUM(points) = (SELECT MAX(SUM (points))
											FROM results NATURAL JOIN races
											WHERE year between 1990 AND 2000
                                            GROUP BY driverId));
                                            
                                            
#Consulta 26 ajustada al enunciado                                            
#SELECT surname, forename, SUM(points)
#FROM results NATURAL JOIn races JOIN drivers ON results.driverId = drivers.driverId






#Consulta 27, no especificamos la carrera

SELECT DISTINCT surname, forename, races.name, races.year FROM drivers INNER JOIN results ON drivers.driverId = results.driverId
                                                              INNER JOIN races ON races.raceId = results.raceId
                                                              
WHERE results.positionOrder = 1 AND driverId NOT IN (SELECT driverId FROM qualifying 
									            	 WHERE qualifying.position <= 10);
                                                     
#Consulta 27 
                                                     
SELECT DISTINCT surname, forename, races.name, races.year FROM drivers INNER JOIN results ON drivers.driverId = results.driverId
                                                              INNER JOIN races ON races.raceId = results.raceId
                                                              INNER JOIN qualifying ON races.raceId = qualifying.raceId
WHERE results.positionOrder = 1 AND qualifying.position > 10;

#Consulta 28
#Se tiene que hacer para recuperar el valor de sum pitstops.stop, para recuperar los datos de esto, se le pone un alias
#Al poner toda la consulta en el from, se pasa como tabla, para ello es necesario el alias para recuperar sus datos
SELECT forename,surname, maxpit.total
FROM(							
SELECT driverId, SUM(pitstops.stop) AS total FROM pitstops INNER JOIN races ON pitstops.raceId = races.raceId
														   INNER JOIN drivers ON drivers.driverId = pitstops.driverId
WHERE races.year = 2013
GROUP BY driverId, raceId
HAVING SUM(pitstops.stop) = (SELECT results.driverId, MAX(SUM(pitstops.stop)) FROM pitstops INNER JOIN races ON pitstops.raceId = races.raceId
																			
WHERE races.year = 2013
GROUP BY driverId, raceId))maxpit INNER JOIN drivers ON maxpit.driverId = driver.driverId;

#30 DIVISION

SELECT * FROM constructors INNER JOIN qualifying ON qualifying.constructorId = constructors.constructorId
WHERE qualifying.raceId AND NOT EXISTS (SELECT * FROM races
                                     WHERE races.year = 2006 AND NOT EXISTS (SELECT * FROM qualifying
																			 WHERE qualifying.position <=10 AND
                                                                                   qualifying.raceId = races.raceId AND
                                                                                   qualifying.constructorId = constructor.constructorId));
                                                                                   
#22  

SELECT driverId, forename, surname,COUNT(*)  FROM drivers  INNER JOIN results ON drivers.driverId = results.driverId
                                        INNER JOIN status on status.statusId = results.statusId
WHERE status.status = 'Accident'
GROUP BY driverId
HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM drivers  INNER JOIN results ON drivers.driverId = results.driverId
                                        INNER JOIN status on status.statusId = results.statusId
                                        WHERE status.status = 'Accident'
                                        GROUP BY driverId );




									