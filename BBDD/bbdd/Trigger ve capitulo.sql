#TRIGGER QUE BORRA CAPITULOS DE CAPITULO

DELIMITER //
CREATE TRIGGER elim_capi AFTER DELETE ON Capitulo
FOR EACH ROW 
BEGIN 


DECLARE done INT DEFAULT FALSE;
DECLARE perfil, temporada,capitulo,serie,timestamp VARCHAR(250);


DECLARE cur1 CURSOR FOR SELECT perfil, temporada,capitulo,serie, timestamp FROM VE_CAPITULO
                                                        WHERE temporada     = OLD.temporada 
                                                               AND capitulo = OLD.capitulo
                                                               AND serie    = OLD.serie;



DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN cur1; -- Apertura
read_loop: LOOP
FETCH cur1 INTO perfil,temporada,capitulo,serie,timestamp; 

   DELETE FROM VE_CAPITULO (perfil, temporada,capitulo,serie,timestamp)

IF done THEN
LEAVE read_loop;
END IF;
END LOOP;
CLOSE cur1;



END
DELIMITER ;

