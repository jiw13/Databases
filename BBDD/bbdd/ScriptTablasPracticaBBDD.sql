CREATE SCHEMA practicabbdd 
DEFAULT CHARACTER SET utf8
COLLATE utf8_spanish2_ci;


CREATE TABLE practicabbdd.Provincia(
nombre VARCHAR(12) NOT NULL,
PRIMARY KEY (nombre)
);

CREATE TABLE practicabbdd.Municipio(
nombre_M VARCHAR(50) NOT NULL,
nombre_P VARCHAR(12),
PRIMARY KEY (nombre_M),
CONSTRAINT FOREIGN KEY (nombre_P)
REFERENCES Provincia(nombre)
ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE practicabbdd.Calle(
nombre VARCHAR(30) NOT NULL,
nombre_municipio VARCHAR(50) NOT NULL,
PRIMARY KEY (nombre,nombre_municipio),

CONSTRAINT FOREIGN KEY (nombre_municipio)
REFERENCES Municipio(nombre_M)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE practicabbdd.Direccion(
numero SMALLINT NOT NULL,
piso SMALLINT  NOT NULL,
letra CHAR NOT NULL,
portal SMALLINT NOT NULL,
nombre_calle VARCHAR(30) NOT NULL,

PRIMARY KEY (numero,piso,letra,portal,nombre_calle),

CONSTRAINT FOREIGN KEY (nombre_calle)
REFERENCES Calle(nombre)
ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE practicabbdd.Usuario_generico(
id INTEGER  NOT NULL AUTO_INCREMENT,
nombre VARCHAR(25),
apellidos VARCHAR (30),
numero SMALLINT,
piso SMALLINT  ,
letra CHAR,
portal SMALLINT,
PRIMARY KEY (id),

CONSTRAINT FOREIGN KEY (numero,piso,letra,portal)
REFERENCES Direccion(numero,piso,letra,portal)
ON DELETE NO ACTION ON UPDATE CASCADE


);
CREATE TABLE practicabbdd.Centro_De_Clasificacion (
nombreCDC VARCHAR(25),
codCDC INTEGER NOT NULL,
capacidad_paquetes INTEGER,
capacidad_cartas INTEGER, #Clave de municipio como foranea
nomMun VARCHAR(50),

PRIMARY KEY (codCDC),
CONSTRAINT FOREIGN KEY (nomMun)
REFERENCES Municipio(nombre_M)    #Si se borra municipio, se borra todos los centros de clasificacion
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE practicabbdd.Oficina(
codO INTEGER  NOT NULL AUTO_INCREMENT,
codCDC INTEGER,
nomMun VARCHAR(50),
numero SMALLINT,
piso SMALLINT,
letra CHAR,
portal SMALLINT,
nombre_calle VARCHAR(250),

PRIMARY KEY (codO),

CONSTRAINT FOREIGN KEY (codCDC)
REFERENCES Centro_De_Clasificacion(codCDC)
ON DELETE NO ACTION ON UPDATE CASCADE,  #Si se borrase el CDC asignado aqui, todas esas oficinas 

CONSTRAINT FOREIGN KEY (nomMun)
REFERENCES Municipio(nombre_M)    #Si se borra municipio, se borra todos las Oficinas
ON DELETE CASCADE ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY(numero,piso,letra,portal,nombre_calle)
REFERENCES Direccion(numero,piso,letra,portal,nombre_calle)
ON DELETE NO ACTION ON UPDATE CASCADE
);



CREATE TABLE practicabbdd.Coche( 
matricula VARCHAR(8) NOT NULL,
capacidad INTEGER,
codO INTEGER,

PRIMARY KEY (matricula),
CONSTRAINT FOREIGN KEY (codO) #La clave de oficina pasa a coches
REFERENCES Oficina(codO)    #si se borra una oficina no se borran sus coches
ON DELETE NO ACTION ON UPDATE CASCADE  
 );



CREATE TABLE practicabbdd.Cartero(
dni VARCHAR(9) NOT NULL,
apellidos VARCHAR(40),
nombre VARCHAR(35),
PRIMARY KEY (dni)
);


CREATE TABLE practicabbdd.Turno (
horario VARCHAR (12)  NOT NULL ,
jornada INTEGER  NOT NULL,


PRIMARY KEY (horario,jornada)

);


CREATE TABLE practicabbdd.Trabaja(
fecha_comienzo DATE,
codO INTEGER NOT NULL,                    #clave de Oficina
dni_cartero VARCHAR(9),                    #dni de Cartero
horario VARCHAR (12),             
jornada INTEGER,

PRIMARY KEY (codO,dni_cartero,horario,jornada),

CONSTRAINT FOREIGN KEY (codO)
REFERENCES Oficina(codO)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_cartero)
REFERENCES Cartero(dni)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (horario,jornada) #Hay que meterlos juntos ya que forman parte de la clave
REFERENCES Turno(horario,jornada)
ON DELETE NO ACTION ON UPDATE CASCADE
);


CREATE TABLE practicabbdd.Ruta(
id INTEGER NOT NULL AUTO_INCREMENT,
PRIMARY KEY (id)
);
CREATE TABLE practicabbdd.Reparto (
id INTEGER  NOT NULL ,
fecha_creacion DATE,
matricula VARCHAR(9) NOT NULL,
id_ruta INTEGER NOT NULL,
dni_cartero VARCHAR(9) NOT NULL,

PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (matricula)
REFERENCES Coche(matricula)
ON DELETE NO ACTION ON UPDATE CASCADE, #Si se borrase un coche, no se borra los repartos realizados por ese coche
                                      #Pero si que se actualiza de cara a futuro que no esta disponible.
CONSTRAINT FOREIGN KEY (id_ruta)
REFERENCES Ruta(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_cartero)
REFERENCES Cartero(dni)
ON DELETE NO ACTION ON UPDATE CASCADE

);
CREATE TABLE practicabbdd.Carta(
id VARCHAR(12) NOT NULL,
formato VARCHAR(3) ,
id_envia INTEGER,
id_recibe INTEGER,
repartoId INTEGER,
dni_cartero VARCHAR(9),
PRIMARY KEY (id),

CONSTRAINT FOREIGN KEY (repartoId)
REFERENCES Reparto(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (id_envia)
REFERENCES Usuario_generico(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (id_recibe)
REFERENCES Usuario_generico(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_cartero)
REFERENCES Cartero(dni)
ON DELETE NO ACTION ON UPDATE CASCADE

);

CREATE TABLE practicabbdd.Segmento_calle(
num_segmento INTEGER NOT NULL,
num_inicio INTEGER,
num_final INTEGER,
nombre_calle VARCHAR(50),

PRIMARY KEY (num_segmento),
CONSTRAINT FOREIGN KEY(nombre_calle)
REFERENCES Calle(nombre)
ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE practicabbdd.Area_envio(
id VARCHAR(50) NOT NULL,
codO INTEGER,
PRIMARY KEY (id),

CONSTRAINT FOREIGN KEY (codO)
REFERENCES Oficina(CodO)
ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE practicabbdd.Area_envio_incluye_Segmento_calle(
id_area_envio VARCHAR(50) NOT NULL,
num_segmento_calle INTEGER NOT NULL,

PRIMARY KEY (id_area_envio, num_segmento_calle),

CONSTRAINT FOREIGN KEY (id_area_envio)
REFERENCES Area_envio(id)
ON DELETE NO ACTION ON UPDATE CASCADE,


CONSTRAINT FOREIGN KEY (num_segmento_calle)
REFERENCES Segmento_calle(num_segmento)
ON DELETE NO ACTION ON UPDATE CASCADE


);


CREATE TABLE practicabbdd.Puede_repartir(
id_areaEnvio VARCHAR(50) NOT NULL,
dni_cartero VARCHAR(9) NOT NULL,

PRIMARY KEY (id_areaEnvio, dni_cartero),

CONSTRAINT FOREIGN KEY (id_areaEnvio)
REFERENCES Area_envio(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_cartero)
REFERENCES Cartero(dni)
ON DELETE NO ACTION ON UPDATE CASCADE

);


CREATE TABLE practicabbdd.Incluye_Area(
id_es_incluida  VARCHAR(50) ,
id_incluye     VARCHAR(50) ,

CONSTRAINT FOREIGN KEY (id_es_incluida)
REFERENCES Area_envio(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (id_incluye)
REFERENCES Area_envio(id)
ON DELETE NO ACTION ON UPDATE CASCADE

);

CREATE TABLE practicabbdd.Usuario_identificado(
dni VARCHAR(9) NOT NULL,
nombre VARCHAR(25),
apellidos VARCHAR (30),
mail VARCHAR (50),
dni_user_autorizado VARCHAR(9),

PRIMARY KEY (dni), 

CONSTRAINT FOREIGN KEY (dni_user_autorizado)                #Relacion reflexiva
REFERENCES Usuario_identificado(dni)
ON DELETE NO ACTION ON UPDATE CASCADE

);

CREATE TABLE practicabbdd.Recogida(
id INTEGER NOT NULL AUTO_INCREMENT,
Fecha_Recogida DATETIME,
numero SMALLINT NOT NULL,
piso SMALLINT NOT NULL,
letra CHAR NOT NULL,
portal SMALLINT NOT NULL,
dni_cartero VARCHAR (9),
dni_usuario_identificado VARCHAR(9),

PRIMARY KEY (id),


CONSTRAINT FOREIGN KEY (numero,piso,letra,portal)
REFERENCES Direccion(numero,piso,letra,portal)
ON DELETE NO ACTION ON UPDATE CASCADE,


CONSTRAINT FOREIGN KEY (dni_cartero)
REFERENCES Cartero(dni)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_usuario_identificado)
REFERENCES Usuario_identificado(dni)
ON DELETE NO ACTION ON UPDATE CASCADE
);




CREATE TABLE practicabbdd.Carta_certificada(
id VARCHAR(12) NOT NULL,
nivel_urgencia VARCHAR(5), 
dni_envia VARCHAR(9),
dni_recibe VARCHAR(9),
dni_cartero VARCHAR(9), 
id_reparto INTEGER,

PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (id_reparto)
REFERENCES Reparto(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_recibe)
REFERENCES Usuario_identificado(dni)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_envia)
REFERENCES Usuario_identificado(dni)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_cartero)
REFERENCES Cartero(dni)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (id_reparto)
REFERENCES Reparto(id)
ON DELETE NO ACTION ON UPDATE CASCADE

);


CREATE TABLE practicabbdd.Paquete(
id VARCHAR(12) NOT NULL ,
dimension VARCHAR(9),                  #Maxima dimension posible 9999x9999 cm
peso FLOAT,
id_envia INTEGER,
id_recibe INTEGER,
id_recogida INTEGER,
id_reparto INTEGER,	
dni_cartero VARCHAR(9),

PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (id_reparto)
REFERENCES Reparto(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (id_recogida)
REFERENCES Recogida(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (id_envia)
REFERENCES Usuario_generico(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (id_recibe)
REFERENCES Usuario_generico(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_cartero)
REFERENCES Cartero(dni)
ON DELETE NO ACTION ON UPDATE CASCADE

);

CREATE TABLE practicabbdd.Entrega_Certificada_CC_Usuario (  #Relacion que crea tabla
hora TIME ,
fecha DATE ,
id_CC VARCHAR(12) NOT NULL,
dni_usuario VARCHAR(9) NOT NULL,

PRIMARY KEY(id_CC,dni_usuario),

CONSTRAINT FOREIGN KEY (id_CC)
REFERENCES Carta_certificada(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_usuario)
REFERENCES Usuario_identificado(dni)
ON DELETE NO ACTION ON UPDATE CASCADE
);



CREATE TABLE practicabbdd.Entrega_Certificada_Usuario_Cartero (  #Relacion que crea tabla
hora TIME,
fecha DATE,
dni_cartero VARCHAR(9) NOT NULL,
dni_usuario_identificado VARCHAR(9) NOT NULL,

PRIMARY KEY(dni_cartero,dni_usuario_identificado),

CONSTRAINT FOREIGN KEY (dni_cartero)
REFERENCES Cartero(dni)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_usuario_identificado)
REFERENCES Usuario_identificado(dni)
ON DELETE NO ACTION ON UPDATE CASCADE
);


CREATE TABLE practicabbdd.Segmento_calle_incluye_Ruta(
num_orden INTEGER  NOT NULL AUTO_INCREMENT,
id_ruta INTEGER,
num_segmento INTEGER,

CONSTRAINT FOREIGN KEY (num_segmento)
REFERENCES Segmento_calle(num_segmento)
ON DELETE NO ACTION ON UPDATE CASCADE,

PRIMARY KEY(num_orden,id_ruta,num_segmento),
CONSTRAINT FOREIGN KEY (id_ruta)
REFERENCES Ruta(id)
ON DELETE NO ACTION ON UPDATE CASCADE
);