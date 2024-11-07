-- Operaciones de consulta e inserccion sobre el conjunto de datos A
SELECT nombre, apellidos FROM practabd1.info_clave_alumnos
ORDER BY provincia;

SELECT COUNT(*) FROM practabd1.info_clave_alumnos
WHERE provincia = 'Sevilla';

SELECT email FROM practabd1.info_clave_alumnos
WHERE provincia = 'Barcelona';

INSERT INTO practabd1.info_clave_alumnos VALUES (99999,'Perico','Palotes','Aranjueh','722000000','perico@pericazo.es');

-- Operaciones de consulta e inserccion sobre el conjunto de datos begin

SELECT * FROM practabd1.info_cursos_disp_2020
ORDER BY area ASC;

SELECT COUNT(*) FROM practabd1.info_cursos_disp_2020
WHERE area= 'Big Data';

SELECT nombre FROM practabd1.info_cursos_disp_2020
WHERE area= 'Realidad Virtual';

INSERT INTO practabd1.info_cursos_disp_2020 VALUES (99999,'CursoSuplente','AGBD');

-- No tiene permisos para insertar en vistas
-- Se le conceden desde root 

INSERT INTO practabd1.info_clave_alumnos_dni (personaID,nombre,apellidos,dni,provincia,telefono,email) 
VALUES (999990,'Perico','Palotes','00000000A','Aranjueh','722000000','perico@pericazo.es');

SELECT personaID,nombre,apellidos FROM practabd1.info_clave_alumnos_dni
WHERE dni='00000000A';

INSERT INTO practabd1.info_cursos_disp_20201 (cursoID,nombre,area)  
VALUES (9999,'CursoS','AGBD');

-- Sigue dando error ya que las vistas son dinamicas y los datos no se almacenan en la BD	

-- El error viene dado en que a la hora de insertar un dato en la vista, esta se comunica con la tabla maestra.
-- Por consiguiente, como usuario suplente, no ve que tiene un campo dni que es unico y no nulo, salta error ya que el SGBD detecta que falta un campo obligatorio que introducir.
-- Algunas de las soluciones serian:
-- 			1. Darle permisos a suplente para que vea este campo, lo cual, se incurre en un problema de confidencialidad
-- 			2. Poner un valor por defecto, esto tiene el problema de que, al ser valor unico, la segunda vez que suplente vaya a insertar, salta un error de integridad
-- 			3. Poner un valor autoincremental, de esta forma no se incurre en problemas de confidencialidad y tampoco de integridad.
-- 			4. La solucion 3. tiene un problema. A la hora de consultar datos por parte de los empleados sobre las tablas de las vistas, estariamos introduciendo datos sucios en la BD
-- Conclusión: Ninguna de las soluciones es buena. Hay que elegir entre la menos mala

-- Personalmente, voy a incurrir en un problema de confidencialidad poniendo confianza en el suplente contratado. Por ello, le voy a otorgar permisos de SELECT sobre el dato DNI desde root




