SHOW GRANTS;
-- cosas que no puede santi
SHOW GRANTS FOR gestor;
CREATE ROLE hacker_malicioso;
CREATE USER backdoor;
GRANT ALL ON *.* TO hacker_malicioso;
GRANT hacker_malicioso TO backdoor;

-- Cosas que si puede hacer

SELECT * FROM  practabd1.matriculados_interesados;
UPDATE practabd1.matriculados_interesados
SET matriculado = 1
WHERE personaID = 1 AND cursoID = 817;
