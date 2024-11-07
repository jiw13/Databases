CREATE TABLE practicabbdd.Coche( 
matricula VARCHAR(8) UNIQUE NOT NULL,
capacidad INTEGER,

PRIMARY KEY (matricula),
CONSTRAINT FOREIGN KEY (codO) #La clave de oficina pasa a coches
REFERENCES Oficina(codO)    #si se borra una oficina no se borran sus coches
ON DELETE NO ACTION ON UPDATE CASCADE   );

CREATE TABLE practicabbdd.Provincia(
nombre VARCHAR(12) UNIQUE NOT NULL,
PRIMARY KEY (nombre)
);

CREATE TABLE practicabbdd.Municipio(
nombre_M VARCHAR(50) UNIQUE NOT NULL,
nombre_P VARCHAR(12),
PRIMARY KEY (nombre_M),
CONSTRAINT FOREIGN KEY (nombre_P)
REFERENCES Provincia(nombre)
ON DELETE NO ACTION ON UPDATE CASCADE
);


CREATE TABLE practicabbdd.Centro_De_Clasificacion (
nombreCDC VARCHAR(25),
codCDC INTEGER UNIQUE NOT NULL,
capacidad_paquetes INTEGER,
capacidad_cartas INTEGER, #Clave de municipio como foranea
PRIMARY KEY (codCDC),
CONSTRAINT FOREIGN KEY (nomMun)
REFERENCES Municipio(nombre)    #Si se borra municipio, se borra todos los centros de clasificacion
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE practicabbdd.Oficina(
codO INTEGER UNIQUE NOT NULL AUTO_INCREMENT,
numero INTEGER,
piso INTEGER,
letra CHAR,
portal INTEGER,
PRIMARY KEY (codO),

CONSTRAINT FOREIGN KEY (codCDC)
REFERENCES Centro_De_Clasificacion(codCDC)
ON DELETE NO ACTION ON UPDATE CASCADE,  #Preguntar a edgar

CONSTRAINT FOREIGN KEY (nomMun)
REFERENCES Municipio(nombre)    #Si se borra municipio, se borra todos las Oficinas
ON DELETE CASCADE ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY(numero,piso,letra,portal)
REFERENCES Direccion(numoer,piso,letra,portal)
ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE practicabbdd.Cartero(
dni VARCHAR(9) UNIQUE NOT NULL,
PRIMARY KEY (dni)
);


CREATE TABLE practicabbdd.Turno (
horario VARCHAR (6),
jornada INTEGER UNIQUE NOT NULL,
PRIMARY KEY (jornada,horario),
CONSTRAINT FOREIGN KEY (codO)
REFERENCES Oficina(codO)
ON DELETE NO ACTION ON UPDATE CASCADE
);


CREATE TABLE practicabbdd.Trabaja(
fecha_comienzo DATETIME,
codO INTEGER,                    #clave de Oficina
codC INTEGER,                    #clave de Cartero
horario VARCHAR (6),             #clave de Turno
jornada INTEGER,

CONSTRAINT FOREIGN KEY (codO)
REFERENCES Oficina(codO)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (codC)
REFERENCES Cartero(codC)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (horario)
REFERENCES Turno(horario)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY(jornada)
REFERENCES Turno(jornada)
ON DELETE NO ACTION ON UPDATE CASCADE

);


CREATE TABLE practicabbdd.Carta(
id INTEGER UNIQUE NOT NULL,
formato VARCHAR(12),
id_envia INTEGER,
id_recibe INTEGER,
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


CREATE TABLE Calle(
nombre VARCHAR(30) UNIQUE NOT NULL,
PRIMARY KEY (nombre),

CONSTRAINT FOREIGN KEY (nombre_municipio)
REFERENCES Municipio(nombre)
ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE Segmento_calle(
num_segmento INTEGER UNIQUE NOT NULL,
num_inicio INTEGER,
num_final INTEGER,

PRIMARY KEY (num_segmento),
CONSTRAINT FOREIGN KEY(nombre_calle)
REFERENCES Calle(nombre)
ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE Area_envio(
id INTEGER UNIQUE NOT NULL AUTO_INCREMENT,
PRIMARY KEY (id),

CONSTRAINT FOREIGN KEY (CodO)
REFERENCES Oficina(CodO)
ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Area_envio_incluye_Segmento_calle(
id_area_envio INTEGER,
num_segmento_calle INTEGER,

CONSTRAINT FOREIGN KEY (id_area_envio)
REFERENCES Area_envio(id)
ON DELETE NO ACTION ON UPDATE CASCADE,


CONSTRAINT FOREIGN KEY (num_segmento_calle)
REFERENCES Segmento_calle(num_segmento)
ON DELETE NO ACTION ON UPDATE CASCADE


);


CREATE TABLE Puede_repartir(
id_areaEnvio INTEGER,
dni_cartero VARCHAR(9),

CONSTRAINT FOREIGN KEY (id_areaEnvio)
REFERENCES Area_envio(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni)
REFERENCES Cartero(dni)
ON DELETE NO ACTION ON UPDATE CASCADE

);


CREATE TABLE Incluye_Area(
id_es_incluida INTEGER NOT NULL,
id_incluye     INTEGER NOT NULL,

CONSTRAINT FOREIGN KEY (id_es_incluida)
REFERENCES Area_envio(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (id_incluye)
REFERENCES Area_envio(id)
ON DELETE NO ACTION ON UPDATE CASCADE

);


CREATE TABLE practicabbdd.Direccion(
numero SMALLINT UNIQUE NOT NULL,
piso CHAR UNIQUE NOT NULL,
letra CHAR UNIQUE NOT NULL,
portal SMALLINT UNIQUE NOT NULL,
PRIMARY KEY (numero,piso,letra,portal),

CONSTRAINT FOREIGN KEY (nombre_calle)
REFERENCES Calle(nombre)
ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE Recogida(
id INTEGER UNIQUE NOT NULL AUTO_INCREMENT,
Fecha_Recogida DATETIME,
PRIMARY KEY (id),


CONSTRAINT FOREIGN KEY (numero,piso,letra,portal)
REFERENCES Direccion(numero,piso,letra,portal)
ON DELETE NO ACTION ON UPDATE CASCADE,


CONSTRAINT FOREIGN KEY (dni_cartero)
REFERENCES Cartero(dni)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_user_identif)
REFERENCES Usuario_identificado(dni)
ON DELETE NO ACTION ON UPDATE CASCADE
);




CREATE TABLE practicabbdd.Carta_certificada(
id VARCHAR(12) UNIQUE NOT NULL,
nivel_urgencia VARCHAR(5), 
dni_envia VARCHAR(9),
dni_recibe VARCHAR(9),

PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (repartoId)
REFERENCES Reparto(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_recibe)
REFERENCES Usuario_identificado(dni)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (dni_envia)
REFERENCES Usuario_identificado(dni)
ON DELETE NO ACTION ON UPDATE CASCADE

);


CREATE TABLE practicabbdd.Paquete(
id VARCHAR(12)  UNIQUE NOT NULL ,
dimension VARCHAR(9),                  #Maxima dimension posible 9999x9999 cm
peso INTEGER,
id_envia INTEGER,
id_recibe INTEGER,

PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (repartoId)
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


CREATE TABLE practicabbdd.Usuario_generico(
id INTEGER UNIQUE NOT NULL AUTO_INCREMENT,
nombre VARCHAR(25),
apellidos VARCHAR (30),
PRIMARY KEY (id),

CONSTRAINT FOREIGN KEY (num,piso,letra,portal)
REFERENCES Direccion(numero,piso,letra,portal)
ON DELETE CASCADE ON UPDATE CASCADE


);



CREATE TABLE practicabbdd.Usuario_identificado(
dni VARCHAR(9) UNIQUE NOT NULL,
nombre VARCHAR(25),
apellidos VARCHAR (30),
mail VARCHAR (50),
dni_user_autorizado VARCHAR(9),

PRIMARY KEY (dni), 

CONSTRAINT FOREIGN KEY (dni_user_autorizado)                #Relacion reflexiva
REFERENCES Usuario_identificado(dni)
ON DELETE NO ACTION ON UPDATE CASCADE

);





CREATE TABLE practicabbdd.Ruta(
id INTEGER UNIQUE NOT NULL AUTO_INCREMENT,
PRIMARY KEY (id)
);

CREATE TABLE Segmento_calle_incluye_Ruta(
num_orden INTEGER UNIQUE NOT NULL AUTO_INCREMENT,
id_ruta INTEGER,
num_segmento INTEGER,

CONSTRAINT FOREIGN KEY (id_recogida)
REFERENCES Ruta(id)
ON DELETE NO ACTION ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (id_user_gen)
REFERENCES Segmento_calle(num_segmento)
ON DELETE NO ACTION ON UPDATE CASCADE

);


CREATE TABLE practicabbdd.Reparto (
id INTEGER UNIQUE NOT NULL AUTO_INCREMENT,
fecha_creacion DATETIME,
matricula VARCHAR(9),
id_ruta INTEGER ,
dni_cartero VARCHAR(9),

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