ALTER TABLE PractABD1.matriculados_interesados ADD CONSTRAINT FOREIGN KEY (personaID)
REFERENCES PractABD1.personas(personaID) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE PractABD1.matriculados_interesados ADD CONSTRAINT FOREIGN KEY (cursoID)
REFERENCES PractABD1.cursos(cursoID) ON UPDATE CASCADE ON DELETE NO ACTION;