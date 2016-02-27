-- EL SIGUIENTE CODIGO SQL ESTA IMPLEMENTADO EN MYSQL 


-- Autores:
-- Luis Manrique Cardona,  1327951
-- Alejandro Mejia, 1330785
-- Jeison Cardona, 1325562


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE TABLE IF NOT EXISTS bus (
  placa varchar(15) NOT NULL,
  tipo varchar(60) NOT NULL,
  id_ruta int(11) NOT NULL,
  numero_pasajeros int(11) DEFAULT NULL,
  PRIMARY KEY (placa) 
); 

--
-- Distribución de turnos
-- El turno es un numero entero 
-- 0: lun-viernes 4am-12pm
-- 1: lun-viernes 12pm-7pm 
-- 2: lun-viernes 7pm-1am
-- 3: sab-dom-festivos 4am-12pm
-- 4: sab-dom-festivos 12pm-7pm 
-- 5: sab-dom-festivos 7pm-1am

CREATE TABLE IF NOT EXISTS bus_empleado (
  placa_bus varchar(15) NOT NULL,
  id_empleado varchar(50) NOT NULL DEFAULT 0,
  turno int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (placa_bus,id_empleado,turno) 
);


CREATE TABLE empleado (
  id_empleado varchar(50) NOT NULL,
  nombres varchar(60) NOT NULL,
  apellidos varchar(100) NOT NULL,
  fecha_nacimiento date NOT NULL,
  direccion varchar(100),
  telefono varchar(15),
  correo_electronico varchar(100),
  cargo varchar(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_empleado)
) ;



CREATE TABLE IF NOT EXISTS estacion (
  id_estacion int(20) NOT NULL AUTO_INCREMENT,
  nombre varchar(60) NOT NULL,
  direccion varchar(100) NOT NULL,
  id_empleado_a_cargo varchar(50),
  PRIMARY KEY (id_estacion),
  UNIQUE KEY nombre_unique (nombre)
) AUTO_INCREMENT=100000 ;


CREATE TABLE IF NOT EXISTS pasajero (
  id_pasajero varchar(11) NOT NULL,
  id_tarjeta int(11) NOT NULL,
  nombres varchar(60) NOT NULL,
  apellidos varchar(60) NOT NULL,
  fecha_nacimiento date NOT NULL,
  direccion varchar(100),
  telefono varchar(15),
  correo_electronico varchar(100),
  PRIMARY KEY (id_pasajero),
  UNIQUE KEY id_tarjeta_unique (id_tarjeta)
) ;


CREATE TABLE IF NOT EXISTS reclamo (
  id_tiquete int(20) NOT NULL AUTO_INCREMENT,
  fecha TIMESTAMP NOT NULL,
  motivo varchar(30) NOT NULL,
  descripcion text NOT NULL,
  estado int(11) DEFAULT 0,
  id_pasajero_interpone varchar(60) NOT NULL,
  id_empleado_anota varchar(60) NOT NULL,
  id_empleado_resuelve varchar(60) NULL,
  id_estacion_interpone int(20) NOT NULL,
  PRIMARY KEY (id_tiquete)
) AUTO_INCREMENT=1000 ;

 CREATE TABLE IF NOT EXISTS medida_reclamo (
  id_reclamo int(20) NOT NULL,
  descripcion VARCHAR(60),
  estado int(20),
  hora_fecha_registro TIMESTAMP,
  PRIMARY KEY (id_reclamo,hora_fecha_registro)
);



CREATE TABLE IF NOT EXISTS ruta (
  id_ruta int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(60) NOT NULL,
  descripcion text NOT NULL,
  PRIMARY KEY (id_ruta),
  UNIQUE KEY nombre_unique (nombre)
) AUTO_INCREMENT=100 ;


-- Registra las rutas -- que pasan por una estacion  dada

CREATE TABLE IF NOT EXISTS ruta_estacion (
  id_ruta int(11) NOT NULL,
  id_estacion int(11) NOT NULL,
  PRIMARY KEY (id_ruta,id_estacion)
  );


-- El estado es un número entero
--  0: activa
-- 1: bloqueada 

CREATE TABLE IF NOT EXISTS tarjeta (
  id_tarjeta int(50) NOT NULL AUTO_INCREMENT,
  estado int(11) DEFAULT 0,
  saldo int(11) DEFAULT 0,
  id_estacion_venta int(11) NOT NULL,
  fecha_venta date NOT NULL,
   PRIMARY KEY (id_tarjeta)
 ) AUTO_INCREMENT=1000;


-- Registra la estacion en que es usada una --tarjeta

CREATE TABLE IF NOT EXISTS reg_uso_tarjeta (
id_ruta int(11) NOT NULL,
id_tarjeta int(11) NOT NULL,
fecha TIMESTAMP NOT NULL,  
 PRIMARY KEY (id_ruta, id_tarjeta,fecha)
);

CREATE TABLE IF NOT EXISTS cargos (
    id_cargo VARCHAR(40) NOT NULL,
    cargo VARCHAR(40) NOT NULL,
    PRIMARY KEY(id_cargo)
);

ALTER TABLE empleado
  ADD CONSTRAINT empleado_cargofk FOREIGN KEY (cargo) REFERENCES cargos (id_cargo);

ALTER TABLE bus
  ADD CONSTRAINT bus_ibfk_1 FOREIGN KEY (id_ruta) REFERENCES ruta (id_ruta);


ALTER TABLE pasajero
 ADD CONSTRAINT pasajero_ibfk_1 FOREIGN KEY (id_tarjeta) REFERENCES tarjeta (id_tarjeta);


ALTER TABLE bus_empleado
  ADD CONSTRAINT bus_empleado_ibfk_1 FOREIGN KEY (placa_bus) REFERENCES bus (placa),
  ADD CONSTRAINT bus_empleado_ibfk_2 FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado);


ALTER TABLE estacion
  ADD CONSTRAINT estacion_ibfk_1 FOREIGN KEY (id_empleado_a_cargo) REFERENCES empleado (id_empleado);


ALTER TABLE reclamo
  ADD CONSTRAINT reclamo_ibfk_1 FOREIGN KEY (id_pasajero_interpone) REFERENCES pasajero (id_pasajero),
  ADD CONSTRAINT reclamo_ibfk_2 FOREIGN KEY (id_empleado_anota) REFERENCES empleado (id_empleado),
  ADD CONSTRAINT reclamo_ibfk_3 FOREIGN KEY (id_empleado_resuelve) REFERENCES empleado (id_empleado),
  ADD CONSTRAINT reclamo_ibfk_4 FOREIGN KEY (id_estacion_interpone) REFERENCES estacion (id_estacion);


ALTER TABLE reg_uso_tarjeta
  ADD CONSTRAINT reg_uso_tarjeta_ibfk_1 FOREIGN KEY (id_ruta) REFERENCES ruta (id_ruta), 
  ADD CONSTRAINT reg_uso_tarjeta_ibfk_2 FOREIGN KEY (id_tarjeta)
REFERENCES tarjeta (id_tarjeta);



ALTER TABLE ruta_estacion
  ADD CONSTRAINT ruta_estacion_ibfk_1 FOREIGN KEY (id_ruta) REFERENCES ruta (id_ruta),
  ADD CONSTRAINT ruta_estacion_ibfk_2 FOREIGN KEY (id_estacion) REFERENCES estacion (id_estacion);


ALTER TABLE tarjeta
  ADD CONSTRAINT tarjeta_ibfk_1 FOREIGN KEY (id_estacion_venta) REFERENCES estacion (id_estacion);

ALTER TABLE medida_reclamo
  ADD CONSTRAINT medida_reclamo_idfk_1 FOREIGN KEY (id_reclamo) REFERENCES reclamo (id_tiquete);

INSERT INTO cargos VALUES ('0','Gerente');
INSERT INTO cargos VALUES ('1','Director');
INSERT INTO cargos VALUES ('2','Auxiliar');

INSERT INTO empleado VALUES ('95212452','Carlos Andres','Ramirez Ortega','1970-10-14','Cr 100 Cl 41 - 35','3354158','carlos.andres@proyecto.com','0','123456789');
INSERT INTO empleado VALUES ('15312814','Juliana','Sanchez Oliveros','1980-11-25','Cr 70 Cl 23 - 15','5624587','juliana@proyecto.com','1','123456789');
INSERT INTO empleado VALUES ('85745852','Oscar','Kingston Marin','1977-03-22','Cr 1 Cl 21 - 30','6985742','oscar@proyecto.com','1','123456789');
INSERT INTO empleado VALUES ('66958524','Marta','Coloto Cabezas','1950-01-26','Cr 100 Cl 33 - 35','2458478','marta@proyecto.com','1','123456789');
INSERT INTO empleado VALUES ('88758212','Pedro','Pimientos Pallares','1990-07-11','Cr 44 Cl 11 - 35','3596824','pedro@proyecto.com','2','123456789');
INSERT INTO empleado VALUES ('45632152','Hugo','Perez Aston','1985-05-20','Cr 7 Cl 11 - 56','4587425','hugo@proyecto.com','2','123456789');
INSERT INTO empleado VALUES ('77584214','Dilan Jose','Marroquin Barco','1994-07-27','Cr 66 Cl 81 - 23','2356245','dilan.jose@proyecto.com','2','123456789');
INSERT INTO empleado VALUES ('96541253','Sofia','Santos Correa','1985-02-25','Cr 55 Cl 56 - 65','4476337', 'sofia@proyecto.com','2','123456789');
INSERT INTO empleado VALUES ('56895412','Eliana','Blum Mora','1974-01-28','Cr 24 CL 78-99','3738509','eliana@proyecto.com','2','123456789');

INSERT INTO estacion VALUES (100001, 'Chiminangos', 		'Cra. 1 #54a-62', 		'88758212');
INSERT INTO estacion VALUES (100002, 'Flora industrial', 	'Esquina Calle 56, Cra. 1', 	'45632152');
INSERT INTO estacion VALUES (100003, 'Popular', 		'Cra. 1 #43-44', 		'77584214');
INSERT INTO estacion VALUES (100004, 'Manzanares', 		'Cra. 1 #38a-39', 		'96541253');
INSERT INTO estacion VALUES (100005, 'Fatima', 			'Esquina Calle 31, Cra. 1', 	'56895412');

INSERT INTO tarjeta VALUES (1001,0,0,100001,'2015-04-01');
INSERT INTO tarjeta VALUES (1002,0,0,100001,'2015-04-25');
INSERT INTO tarjeta VALUES (1003,0,0,100001,'2015-03-15');
INSERT INTO tarjeta VALUES (1004,0,0,100002,'2015-05-26');
INSERT INTO tarjeta VALUES (1005,0,0,100002,'2015-06-25');
INSERT INTO tarjeta VALUES (1006,0,0,100002,'2015-07-02');
INSERT INTO tarjeta VALUES (1007,0,0,100003,'2015-07-22');
INSERT INTO tarjeta VALUES (1008,0,0,100003,'2015-07-24');
INSERT INTO tarjeta VALUES (1009,0,0,100003,'2015-08-03');
INSERT INTO tarjeta VALUES (1010,0,0,100003,'2015-08-15');

INSERT INTO pasajero VALUES (1130665425,1001,'Laura','Ospina Castro','1978-05-14','Cra. 1i # 45-26','4475869','laura@gmail.com');
INSERT INTO pasajero VALUES (1130652365,1002,'Sonia','Ampudia Mendez','1991-02-15','Cra. 6 # 01-52','3741589','sonia@hotmail.com');
INSERT INTO pasajero VALUES (1002152656,1003,'Alberto','Yusti Cano','1986-01-23','Cra. 10 # 21-06','8874525','alberto@gmail.com');

INSERT INTO ruta VALUES ('101','A14','INICIA:Chiminangos -> Finaliza:Manzanares');
INSERT INTO ruta VALUES ('102','A15','INICIA:Chiminangos -> Finaliza:Fatima');
INSERT INTO ruta VALUES ('103','T45','INICIA:Manzanares -> Finaliza:Fatima');
INSERT INTO ruta VALUES ('104','T51','INICIA:Fatima -> Finaliza:Chiminangos');
INSERT INTO ruta VALUES ('105','P13','INICIA:Chiminangos -> Finaliza:Flora industrial');

INSERT INTO bus VALUES ('BCK-2514','Complementario','101','40');
INSERT INTO bus VALUES ('BCK-3524','Complementario','101','40');
INSERT INTO bus VALUES ('BCK-2464','Complementario','101','40');
INSERT INTO bus VALUES ('BCK-5519','Complementario','102','40');
INSERT INTO bus VALUES ('BCK-7524','Complementario','102','40');
INSERT INTO bus VALUES ('BCK-5514','Complementario','102','40');
INSERT INTO bus VALUES ('BCK-3124','Articulado','103','150');
INSERT INTO bus VALUES ('BCK-7895','Articulado','103','150');
INSERT INTO bus VALUES ('BCK-8852','Articulado','103','130');
INSERT INTO bus VALUES ('BCK-1114','Articulado','104','130');
INSERT INTO bus VALUES ('BCK-7272','Articulado','104','150');
INSERT INTO bus VALUES ('BCK-9563','Articulado','104','150');
INSERT INTO bus VALUES ('BCK-1201','Padron','105','80');
INSERT INTO bus VALUES ('BCK-5509','Padron','105','80');
INSERT INTO bus VALUES ('BCK-1001','Padron','105','70');

INSERT INTO ruta_estacion VALUES('101','100001');
INSERT INTO ruta_estacion VALUES('101','100004');
INSERT INTO ruta_estacion VALUES('102','100001');
INSERT INTO ruta_estacion VALUES('102','100005');
INSERT INTO ruta_estacion VALUES('103','100004');
INSERT INTO ruta_estacion VALUES('103','100005');
INSERT INTO ruta_estacion VALUES('104','100005');
INSERT INTO ruta_estacion VALUES('104','100001');
INSERT INTO ruta_estacion VALUES('105','100001');
INSERT INTO ruta_estacion VALUES('105','100002');



