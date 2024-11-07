#cd C:\Program Files\MySQL\MySQL Server 8.0\bin
#mysql -u root -p --local-infile=1;
#set global local_infile=1;
#use practabd1;

LOAD DATA 
LOCAL INFILE 'C:/Users/SitoPc/Desktop/Pract1ABD/Personas.csv' 
INTO TABLE personas 
CHARACTER SET latin1 
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n' 
(personaID,dni,nombre,apellidos,genero,direccion,localidad,provincia,codPostal,telefono,enParo,canal,@fechaProv,@emailProv)
 SET fechaNac = STR_TO_DATE(@fechaProv,'%d/%m/%Y'),
email = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(lower(@emailProv), 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u'), 'ñ', 'n');

LOAD DATA 
LOCAL INFILE 'C:/Users/SitoPc/Desktop/Pract1ABD/Cursos.csv' 
INTO TABLE cursos 
CHARACTER SET latin1 
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n';

LOAD DATA 
LOCAL INFILE 'C:/Users/SitoPc/Desktop/Pract1ABD/Matriculados_Interesados.csv' 
INTO TABLE matriculados_interesados 
CHARACTER SET latin1 
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n';