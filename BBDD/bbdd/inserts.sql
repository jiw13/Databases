INSERT INTO practicabbdd.provincia (nombre)
       VALUES
       ("La Coruña"),
	   ("Lugo"),
       ("Orense"),
       ("Pontevedra"),
       ("Asturias"),
       ("Cantabria"),
       ("Vizcaya"),
       ("Guipuzcoa"),
       ("Vitoria"),
       ("Navarra"),
       ("Huesca"),
       ("Zaragoza"),
       ("Teruel"),
       ("Lérida"),
       ("Gerona"),
       ("Barcelona"),
       ("Tarragona"),
       ("Castellón"),
       ("Valencia"),
       ("Alicante"),
       ("Zamora"),
       ("León"),
       ("Palencia"),
       ("Salamanca"),
       ("Valladolid"),
       ("Ávila"),
       ("Burgos"),
       ("Segovia"),
       ("Soria"),
       ("Cáceres"),
       ("Badajoz"),
       ("Guadalajara"),
       ("Cuenca"),
       ("Toledo"),
       ("Ciudad Real"),
       ("Albacete"),
       ("Murcia"),
       ("Huelva"),
       ("Sevilla"),
       ("Cádiz"),
       ("Córdoba"),
       ("Málaga"),
       ("Jaén"),
       ("Granada"),
       ("Madrid"),
       ("Almería");
       
       
       INSERT INTO practicabbdd.municipio(nombre_M,nombre_P)
       VALUES
       ("Aranjuez","Madrid"),
       ("Alcorcón","Madrid"),
       ("Valdemoro","Madrid"),
       ("Alcobendas","Madrid"),
       ("Madrid","Madrid");
     
       
       INSERT INTO practicabbdd.Calle (nombre,nombre_municipio)
       VALUES
       ("Paseo de Perales","Madrid"),
       ("Paseo de Pintor Rosales","Madrid"),
       ("Paseo de Platanos","Madrid"),
       ("Paseo de Pontones","Madrid"),
       ("Paseo del Prado","Madrid"),
       ("Avenida Pablo Neruda","Madrid"),
       ("Calle Pio Baroja","Madrid"),
       ("Calle Postas","Madrid"),
       ("Avenida Plaza Toros","Madrid"),
       ("Paseo de los parques","Alcobendas"),
	   ("Paseo del 8 de Marzo","Alcobendas"),
	   ("Paseo de Fuentelucha","Alcobendas"),
	   ("Paseo de Valdelasfuentes","Alcobendas"),
       ("Plaza Concordia","Alcobendas"),
       ("Calle Alcala","Madrid")
       ;
       INSERT INTO practicabbdd.Calle (nombre,nombre_municipio)
       VALUES
       ("Calle Alcala","Madrid");
    

       #Preguntar Edgar
       INSERT INTO practicabbdd.direccion(numero,piso,letra,portal,nombre_calle)
       VALUES
       (1,1,'A',1,"Calle Postas"),
       (2,2,'B',2,"Calle Postas"),
       (3,3,'C',1,"Calle Postas"),
       (4,4,'D',1,"Calle Postas"),
       (5,5,'E',1,"Calle Postas"),
       (1,1,'A',1,"Calle Pio Baroja"),
       (2,2,'B',1,"Calle Pio Baroja"),
       (3,3,'C',1,"Calle Pio Baroja")
       ;
       INSERT INTO practicabbdd.direccion(numero,piso,letra,portal,nombre_calle)
       VALUES
       (1,1,'A',1,'Paseo de Perales'),
       (3,3,'C',3,'Paseo del 8 de Marzo')
       ;
        INSERT INTO practicabbdd.direccion(numero,piso,letra,portal,nombre_calle)
       VALUES
       (1,1,'A',1,'Calle Alcala'),
       (3,3,'C',3,'Calle Alcala')
       ;

 
 
     INSERT INTO practicabbdd.Usuario_generico (nombre,apellidos,numero,piso,letra,portal)
     VALUES 
     ("Jose Angel","Garcia Ibañez",1,1,'A',1),
     ("Laura","De la Puente Fernandez",1,1,'A',1),
     ("Sandra","Garcia Ibañez",2,2,'B',1),
     ("Emilia","Ibañez Huete",2,2,'B',1);
     
     INSERT INTO practicabbdd.centro_de_clasificacion(nombreCDC,codCDC)
     VALUES
     ("CDC-Madrid_Norte",0),
     ("CDC-Alcobendas",1),
     ("CDC-Aranjuez",2),
     ("CDC-Madrid_Centro",3)
     ;
     
     INSERT INTO practicabbdd.oficina(codCDC,nomMun,numero,piso,letra,portal,nombre_calle)
     VALUES
     (2,"Aranjuez",1,1,'A',1,'Calle Pio Baroja'),
     (2,"Aranjuez",2,2,'B',1,'Calle Pio Baroja'),
     (1,"Alcobendas",5,5,'E',1,'Calle Postas'),
     (1,"Alcobendas",1,1,'A',1,'Paseo de Perales'),
     (1,"Alcobendas",3,3,'C',3,'Paseo del 8 de Marzo'),
      (1,"Madrid",3,3,'D',3,'Paseo de Perales'),
     (1,"Alcobendas",3,3,'C',3,'Paseo del 8 de Marzo')
     
     ;
     INSERT INTO practicabbdd.oficina(codCDC,nomMun,numero,piso,letra,portal,nombre_calle)
     VALUES (1,"Madrid",3,3,'C',3,'Calle Alcala'),
			(1,"Madrid",1,1,'A',1,'Calle Alcala');
     
     
     INSERT INTO practicabbdd.coche (matricula,capacidad,codO) VALUES ('1234ABC',100,1);
     INSERT INTO practicabbdd.coche (matricula,capacidad,codO) VALUES ('2234ABC',100,1);
	 INSERT INTO practicabbdd.coche (matricula,capacidad,codO) VALUES ('3234ABC',100,1);
     INSERT INTO practicabbdd.coche (matricula,capacidad,codO) VALUES ('4234ABC',100,2);
     INSERT INTO practicabbdd.coche (matricula,capacidad,codO) VALUES ('5234ABC',100,2);
     INSERT INTO practicabbdd.coche (matricula,capacidad,codO) VALUES ('6234ABC',100,2);
     
     
     INSERT INTO practicabbdd.cartero(dni,nombre,apellidos)
     VALUES
     ("14444444A","Manolo","El del Bombo"),
     ("11111111B","Perico","Palotes"),
     ("11111111C","Jose","Castillos"),
     ("33333333F","Felix","Rodríguez De la Fuente"),
     ("50564673R","Elvira","Ibañez Castillejo"),
     ("07213642Z","Sandra","Domínguez"),
     ("09348712D","Enrique-Vicente","Alcaide López"),
   
 ('12345678A','Garcia','Juan'),
 ('22345678A','Garcia','Juan'),
 ('32345678A','Garcia','Juan'),
 ('42345678A','Garcia','Juan'),
 ('52345678A','Garcia','Juan'),
 ('62345678A','Garcia','Juan'),
 ('22345678B','Garcia','Juan'),
 ('12345678B','Garcia','Juan'),
 ('12345678C','Garcia','Juan'),
 ('12345678D','Garcia','Juan'),
('12345678E','Garcia','Juan'),
 ('12345678F','Garcia','Juan'),
 ('32345678C','Garcia','Juan'),
 ('42345678D','Garcia','Juan'),
 ('52345678E','Garcia','Juan'),
 ('62345678F','Garcia','Juan');
     
     
     
     
     
     
     ;
     
     INSERT INTO practicabbdd.turno(jornada,horario)
     VALUES
     (8,"mañana"),
     (8,"tarde"),
     
     (12,"mañana"),
     (12,"tarde"),
     
     (16,"mañana"),
     (16,"tarde"),
     
     (24,"mañana"),
     (24,"tarde")
     
     ;
     
     INSERT INTO practicabbdd.trabaja(fecha_comienzo,codO,dni_cartero,jornada,horario) #No se introducir valores DATETIME
     VALUES 
     ("2022-10-30",1, "50564673R",8,"mañana"),
     ("2021-01-15",1,"12345678A",8,"tarde")
     ;
     /*
     ('21-11-22 7:00:00 AM' ,1, "12345678A","mañana",8),
     ('21-11-22 3:00:00 PM',2,"12345678A","tarde" ,8),
     ('14-11-22 5:00:00 AM',1,"11111111A","mañana",8),
     ('14-11-22 4:00:00 AM',2,"11111112A","mañana",8),
     ('11-11-22 2:00:00 PM',1,"11111112A","tarde",8)
     ;
     */
     
     INSERT INTO practicabbdd.ruta()
     VALUES ();
     INSERT INTO practicabbdd.ruta()
     VALUES ();
     
     
     
     INSERT INTO practicabbdd.reparto (id,fecha_creacion,matricula,id_ruta,dni_cartero) 
     VALUES 
      (1,str_to_date('2022-10-05', '%Y-%m-%d'),'1234ABC',1,'12345678A'),
      (2,str_to_date('2022-10-10', '%Y-%m-%d'),'1234ABC',1,'12345678B'),
      (3,str_to_date('2022-10-18', '%Y-%m-%d'),'1234ABC',1,'12345678C'),
      (4,str_to_date('2022-10-30', '%Y-%m-%d'),'1234ABC',2,'12345678D'),
      (5,str_to_date('2022-11-09', '%Y-%m-%d'),'1234ABC',2,'12345678E'),
	  (6,str_to_date('2022-11-25', '%Y-%m-%d'),'1234ABC',2,'12345678F');
     
     INSERT INTO practicabbdd.carta(id,formato,id_envia,id_recibe,repartoId,dni_cartero)
     VALUES
     ("CT-000000000", "A4",1,3,1,"12345678A")
     ;
     
     INSERT INTO practicabbdd.segmento_calle(num_segmento,num_inicio,num_final,nombre_calle)
     VALUES
     (1,1,3,"Avenida Plaza Toros"),
     (2,4,5,"Avenida Plaza Toros"),
     (3,6,10,"Avenida Plaza Toros")
     ;
    
     
     INSERT INTO practicabbdd.area_envio(id,codO)
     VALUES
     ("AR-MAD-03",1),("PL-TOROS-01",2),("PL-TOROS-04",3)
	;
    INSERT INTO practicabbdd.area_envio(id,codO)
     VALUES
     ("PL-TOROS-02",3),("PL-TOROS-03",4)
	;
    
    INSERT INTO practicabbdd.area_envio_incluye_segmento_calle(id_area_envio,num_segmento_calle)
    VALUES
    ("PL-TOROS-01",1),("PL-TOROS-02",2),("PL-TOROS-03",3)
    ;
    INSERT INTO practicabbdd.puede_repartir(id_areaEnvio,dni_cartero)
    VALUES
    ("PL-TOROS-01","12345678A"),
    ("PL-TOROS-02","12345678A"),
    ("PL-TOROS-03","12345678B")
    ;
    
    
    INSERT INTO practicabbdd.incluye_Area(id_es_incluida,id_incluye) #opcional !?
    VALUES
    ("PL-TOROS-01","PL-TOROS-01")
    ;
    
    
    INSERT INTO practicabbdd.usuario_identificado(dni,nombre,apellidos,mail) #Pueden omitirse todos los atributos excepto dni por que pertenece a la clave
    VALUES
    ("00000000F","Kiliki","Fresco","meloinvento@meloinvento.com"),
    ("00000001F","Pitbul","Mr WorlWide","pitbul13@worldwide.es"), #Pitbull autoriza a Ibai pa recoger sus paquetes y movidas
    ("00000002F","Ibai","Llanos","Ibai@elputopresideespaña.com")
    ;
    INSERT INTO practicabbdd.recogida(Fecha_recogida,numero,piso,letra,portal,dni_cartero,dni_usuario_identificado)
    VALUES
    ("2022-11-20 12:05:00",1,1,"A",1,"07213642Z","00000000F"),
    ("2022-11-21 10:05:00",2,2,"B",1,"50564673R","00000001F"),
    ("2022-11-22 09:13:45",5,5,"E",1,"12345678A","00000002F")
    ;
    
 
    INSERT INTO practicabbdd.carta_certificada(id,nivel_urgencia,dni_envia,dni_recibe,dni_cartero,id_reparto)
    VALUES
    ("CC-000000000","medio","00000002F","00000000F","50564673R",1)
    ;
    
    INSERT INTO practicabbdd.paquete(id,dimension,peso,id_envia,id_recibe,id_recogida,id_reparto,dni_cartero)
    VALUES
    ("PQ-000000000","50x40",  1.05,1,2,1,1, "07213642Z"),
    ("PQ-000000001","25x10",  0.75,1,2,1,1, "09348712D"),
    ("PQ-000000002","35x25",  0.250,1,2,1,1,"09348712D"),
    ("PQ-000000003","150x440",4.5,1,2,1,1,  "12345678A")
    ;

    INSERT INTO practicabbdd.Entrega_Certificada_CC_Usuario(hora,fecha,id_CC,dni_usuario)
    VALUES
    ("09:13:44","2021-09-10","CC-000000000","00000000F")
    ;
    
    INSERT INTO practicabbdd.Entrega_Certificada_Usuario_Cartero(hora,fecha,dni_cartero,dni_usuario_identificado)
    VALUES
    ("09:13:44","2021-09-10","09348712D","00000000F")
    ;
    
    INSERT INTO practicabbdd.Segmento_calle_incluye_Ruta(id_ruta,num_segmento)
    VALUES
    (1,1),(2,2)
    ;
    #str_to_date('2022-11-25', '%Y-%m-%d')
    
    
    
    
    