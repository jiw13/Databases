SELECT trabajos.codC, trabajos.codP FROM trabajos INNER JOIN conductores ON trabajos.codC = conductores.codC
WHERE conductores.nombre = 'Juan Pérez';

SELECT MAX(precioHora) FROM maquinas;


#Cuenta el numero de ocurrencias dentro de cada grupo del group by
#El where se ejecuta antes que el group by, por lo que filtra antes de agrupar

SELECT COUNT(*), codM
FROM trabajos
GROUP BY codM;

SELECT surname,mediaVelCarrera(surname) 
  FROM results INNER JOIN races ON results.raceId = races.raceId
               INNER JOIN drivers ON results.driverId = drivers.driverId
  WHERE races.year = 2009;


CREATE TABLE formula1.Tabla_media(
driverId INTEGER,
media FLOAT,

CONSTRAINT FOREIGN KEY (driverId)
REFERENCES drivers(driverId)
ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE formula1.drivers
ADD años_en_activo INTEGER;

#Ejercicio 9
CREATE TABLE formula1.crashses(
driverId INTEGER,
crashId INTEGER NOT NULL AUTO_INCREMENT,
descripcion VARCHAR(250),

PRIMARY KEY(crashId),

CONSTRAINT FOREIGN KEY(driverId)
REFERENCES drivers(driverId)
ON DELETE NO ACTION ON UPDATE CASCADE
);









