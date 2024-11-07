DROP  DATABASE IF EXISTS PractABD1 ;
CREATE SCHEMA PractABD1;
SET CHAR SET latin1;


CREATE TABLE PractABD1.personas(
  personaID INTEGER,
  dni VARCHAR(9)  NOT NULL, # probar con char 9
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  genero CHAR,
  direccion VARCHAR(60),
  localidad VARCHAR(50),
  provincia VARCHAR(30),
  codPostal INTEGER,
  telefono VARCHAR(9),
  enParo BIT,
  canal TINYINT, #0-255, comprobar despues que el valor que se introduce es uno de los 4 valores validos
  fechaNac DATE,
  email VARCHAR(60)
)TABLESPACE = TBLS_personas;

CREATE TABLE PractABD1.cursos(
cursoID INTEGER NOT NULL,
nombre VARCHAR(15) NOT NULL,
area VARCHAR(30),
edicion YEAR NOT NULL

)TABLESPACE = TBLS_cursos;


CREATE TABLE PractABD1.matriculados_interesados(
personaID INTEGER NOT NULL,
cursoID INTEGER NOT NULL,
matriculado BIT,
comentarios VARCHAR(500)
)TABLESPACE = TBLS_matriculados_interesados;





