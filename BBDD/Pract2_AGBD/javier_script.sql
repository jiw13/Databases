SELECT * FROM personas;
SHOW GRANTS;

CREATE ROLE secretario;
CREATE ROLE comercial;

GRANT SELECT ON practabd1.* TO secretario;   -- ver toda la bbdd
GRANT INSERT ON practabd1.cursos TO secretario;  -- introducir nuevos cursos
GRANT UPDATE ON practabd1.matriculados_interesados TO secretario; -- matricular nuevos alumnos

GRANT SELECT ON practabd1.* TO comercial;
GRANT INSERT, UPDATE ON practabd1.personas TO comercial;
GRANT UPDATE ON practabd1.matriculados_interesados TO comercial;


CREATE USER paco;        -- comercial
CREATE USER santiago;    -- comercial
CREATE USER maribel;     -- secretarios
CREATE USER miriam;      -- secretarios

GRANT secretario TO miriam,maribel;
GRANT comercial TO paco,santiago;

SET DEFAULT ROLE secretario TO maribel;
SET DEFAULT ROLE secretario TO miriam;
SET DEFAULT ROLE comercial TO paco;
SET DEFAULT ROLE comercial TO santiago;
