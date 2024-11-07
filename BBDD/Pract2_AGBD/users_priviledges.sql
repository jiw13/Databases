SET GLOBAL activate_all_roles_on_login = ON;
CREATE ROLE gestor;
CREATE USER javier;

GRANT ROLE_ADMIN ON *.* TO gestor;
GRANT SELECT, UPDATE, INSERT ON practabd1.* TO gestor;
GRANT CREATE ROLE, CREATE USER, DROP ROLE ON *.* TO gestor WITH GRANT OPTION;
-- REVOKE SELECT, CREATE USER, CREATE ROLE, DROP ROLE ON *.* FROM javier

GRANT gestor TO javier;


SHOW GRANTS;
SHOW GRANTS FOR gestor;
SHOW GRANTS FOR javier;
SHOW GRANTS FOR maribel;
SHOW GRANTS FOR miriam;
SHOW GRANTS FOR paco;
SHOW GRANTS FOR santiago;

SHOW GRANTS FOR comercial;
SHOW GRANTS FOR secretario;

-- Cambio organizativo

REVOKE comercial FROM santiago;
REVOKE secretario FROM maribel;

GRANT SELECT ON practabd1.* TO santiago;
GRANT SELECT ON practabd1.* TO maribel;

SHOW GRANTS FOR santiago;
SHOW GRANTS FOR maribel;


-- Creacion de vistas y usuario suplente

CREATE VIEW info_clave_alumnos
AS SELECT personaID, nombre, apellidos, provincia, telefono, email FROM personas;

CREATE VIEW info_cursos_disp_2020
AS SELECT cursoID,nombre,area
   FROM cursos
   WHERE edicion = 2020;
-- para darle permisos a un usuario a cierta vista
-- GRANT SELECT ON database1.view1 TO 'someuser'@'somehost';

CREATE USER suplencia;
GRANT SELECT ON practabd1.info_clave_alumnos TO suplencia;
GRANT SELECT ON practabd1.info_cursos_disp_2020 TO suplencia;


-- El usuario suplente no puede insertar datos por lo que se le dan permisos para insertar pero solo en las vistas

GRANT INSERT ON practabd1.info_clave_alumnos_dni TO suplencia;
GRANT INSERT ON practabd1.info_cursos_disp_2020 TO suplencia;


DROP VIEW  practabd1.info_clave_alumnos_dni;
DROP VIEW  practabd1.info_cursos_disp_2020 ;

-- Se opta por otorgar permisos sobre dni al suplente
-- Se borra la vista original y se crea una nueva con este detalle
DROP VIEW  practabd1.info_clave_alumnos_dni;
CREATE VIEW practabd1.info_clave_alumnos_DNI AS
SELECT personaID,nombre,apellidos,dni,provincia,telefono,email FROM practabd1.personas;
GRANT SELECT,INSERT ON practabd1.info_clave_alumnos_dni TO suplencia;
