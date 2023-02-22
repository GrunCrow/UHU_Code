drop table LLAMADA;
drop table TELEFONO;
drop table CLIENTE;
drop table TARIFA;
drop table COMPAÑIA;


create table COMPAÑIA (
	cif	char(9),
	nombre	varchar(20) NOT NULL,
	web	varchar(30),
	CONSTRAINT ciaClave PRIMARY KEY (cif),
	CONSTRAINT ciaUnica UNIQUE(nombre));

create table TARIFA (
	tarifa		char(10),
	compañia	char(9),
	descripcion	varchar(50),
	coste		number(3, 2) NOT NULL,
	CONSTRAINT tarifaClave PRIMARY KEY (tarifa, compañia),
	CONSTRAINT tarifaAjena FOREIGN KEY (compañia) REFERENCES COMPAÑIA(cif) ON DELETE CASCADE,
	CONSTRAINT tarifaCoste CHECK (coste <= 1.50 AND coste >= 0.05));

create table CLIENTE (
	dni		char(9),
	nombre		varchar(50) NOT NULL,
	f_nac		date,
	direccion	varchar(100),
	cp		char(6),
	ciudad		varchar(50),
	provincia	varchar(50),
	CONSTRAINT clienteClave PRIMARY KEY (dni));

create table TELEFONO (
	numero		char(9),
	f_contrato	date,
	tipo		char(1),
	puntos		number(6, 0),
	compañia	char(9) NOT NULL,
	tarifa		char(10) NOT NULL,
	cliente		char(9),
	CONSTRAINT tfClave PRIMARY KEY (numero),
	CONSTRAINT tfTarifaAjena FOREIGN KEY (tarifa, compañia) REFERENCES TARIFA,
	CONSTRAINT tfCompañiaAjena FOREIGN KEY (compañia) REFERENCES COMPAÑIA(cif),
	CONSTRAINT tfClientejena FOREIGN KEY (cliente) REFERENCES CLIENTE(dni),
	CONSTRAINT tfTipo CHECK (tipo IN ('T', 'C')));

create table LLAMADA (
	tf_origen	char(9),
	tf_destino	char(9),
	fecha_hora	timestamp,
	duracion	number(5, 0) NOT NULL,
	CONSTRAINT llamadaClave PRIMARY KEY (tf_origen, fecha_hora),
	CONSTRAINT llamadaTfOAjena FOREIGN KEY (tf_origen) REFERENCES TELEFONO(numero),
	CONSTRAINT llamadaTfDAjena FOREIGN KEY (tf_destino) REFERENCES TELEFONO(numero),
	CONSTRAINT LlamadaDestUnica UNIQUE(tf_destino, fecha_hora),
	CONSTRAINT llamadaTfDistintos CHECK (tf_origen <> tf_destino));

commit;



insert into COMPAÑIA values ('A00000001','Kietostar','http://wwww.kietostar.com');
insert into COMPAÑIA values ('B00000002','Aotra','http://wwww.aotra.com');
insert into COMPAÑIA values ('C00000003','Petafón','http://wwww.petafon.com');


insert into TARIFA values ('joven', 'A00000001','menores de 25 años', 0.25);
insert into TARIFA values ('dúo', 'A00000001','la pareja también está en la compañía', 0.20);
insert into TARIFA values ('familiar', 'A00000001','4 miembros de la familia en la compañía', 0.15);
insert into TARIFA values ('autónomos', 'B00000002','trabajador autónomo', 0.18);
insert into TARIFA values ('dúo', 'B00000002','la pareja también está en la compañía', 0.15);
insert into TARIFA values ('autónomos', 'C00000003','trabajador autónomo', 0.23);
insert into TARIFA values ('empresa', 'C00000003','todos los empleados están en la compañía', 0.19);

insert into CLIENTE values ('35000001P', 'Ramón Martínez Sabina', '12/02/69', 'C/ Melancolía nº 7', '23400', 'Úbeda', 'Jaén');
insert into CLIENTE values ('42000002C', 'José García Márquez', '19/04/87', 'Avda. de Macondo nº 82', '11900', 'San Román', 'Cádiz');
insert into CLIENTE values ('59000003T', 'Ricardo Reyes Neruda', '10/01/73', 'Carretera de Isla Negra Km. 20', '15704', 'Santiago de Compostela', 'La Coruña');
insert into CLIENTE values ('17000004W', 'Antonio Hierro Santander', '15/03/85', 'Avda. Ciudad de Barcelona', '28015', 'Madrid', 'Madrid');
insert into CLIENTE values ('56000002M', 'Juan Jiménez Platero', '23/12/81', 'C/ Ribera nº 2', '21800', 'Moguer', 'Huelva');
insert into CLIENTE values ('67000002A', 'María Machado Ruiz', '26/07/75', 'C/ Campos de Castilla nº 12', '41004', 'Sevilla', 'Sevilla');
insert into CLIENTE values ('12000002Q', 'Jesús Ríos Lorca', '19/09/90', 'Camino de Bernarda Alba nº 36', '18340', 'Fuente Vaqueros', 'Granada');
insert into CLIENTE values ('89000002Z', 'Rita Martínez de Castro', '15/07/85', 'C/ Sar nº 84', '15900', 'Padrón', 'La Coruña');

insert into TELEFONO values ('654123321', '14/09/2003', 'C', 12750, 'A00000001', 'dúo', '35000001P');
insert into TELEFONO values ('666010101', '09/10/2005', 'T', 1040, 'C00000003', 'empresa', '35000001P');
insert into TELEFONO values ('654789789', '30/05/2006', 'C', 24590, 'A00000001', 'familiar', '42000002C');
insert into TELEFONO values ('678111222', '02/02/2002', 'T', 1010, 'B00000002', 'dúo', '59000003T');
insert into TELEFONO values ('654234234', '31/10/2006', 'T', 250, 'A00000001', 'joven', '17000004W');
insert into TELEFONO values ('666789789', '20/05/1999', 'C', 45250, 'C00000003', 'autónomos', '67000002A');
insert into TELEFONO values ('654012012', '10/03/2005', 'T', 1500, 'A00000001', 'joven', '12000002Q');
insert into TELEFONO values ('678234234', '30/08/2006', 'C', 15700, 'B00000002', 'autónomos', '89000002Z');
insert into TELEFONO values ('654345345', '10/09/2006', 'C', 170, 'A00000001', 'dúo', '89000002Z');
insert into TELEFONO values ('666456456', '19/07/98', 'C', 56280, 'C00000003', 'empresa', '56000002M');


insert into LLAMADA values ('654123321', '654345345', '26/09/06 23:05:55', 921);
insert into LLAMADA values ('654123321', '654345345', '16/10/06 18:45:35', 785);
insert into LLAMADA values ('654123321', '654345345', '16/10/06 19:07:10', 38);
insert into LLAMADA values ('654123321', '654345345', '18/10/06 09:35:50', 1053);
insert into LLAMADA values ('654123321', '654345345', '21/10/06 21:05:13', 257);
insert into LLAMADA values ('666010101', '666456456', '27/10/06 11:11:33', 435);
insert into LLAMADA values ('666010101', '654234234', '01/11/06 10:35:00', 124);
insert into LLAMADA values ('666010101', '666789789', '05/09/06 17:09:01', 210);
insert into LLAMADA values ('654789789', '654012012', '01/10/06 13:55:30', 75);
insert into LLAMADA values ('654789789', '666456456', '05/10/06 17:05:03', 430);
insert into LLAMADA values ('654789789', '678111222', '08/10/06 10:55:15', 1345);
insert into LLAMADA values ('678111222', '654789789', '07/10/06 19:25:51', 553);
insert into LLAMADA values ('678111222', '654234234', '03/11/06 17:45:31', 321);
insert into LLAMADA values ('678111222', '678234234', '12/09/06 11:52:19', 634);
insert into LLAMADA values ('678111222', '678234234', '23/09/06 19:17:44', 101);
insert into LLAMADA values ('666789789', '666010101', '11/09/06 10:19:03', 45);
insert into LLAMADA values ('666789789', '666456456', '15/09/06 14:12:44', 409);
insert into LLAMADA values ('666789789', '666456456', '15/09/06 18:13:24', 105);
insert into LLAMADA values ('654012012', '678234234', '13/09/06 10:32:07', 312);
insert into LLAMADA values ('654012012', '678111222', '01/09/06 21:08:59', 93);
insert into LLAMADA values ('654012012', '666010101', '21/09/06 11:12:13', 501);
insert into LLAMADA values ('678234234', '666010101', '30/09/06 08:49:55', 413);
insert into LLAMADA values ('678234234', '654123321', '01/10/06 13:12:11', 2045);
insert into LLAMADA values ('678234234', '654789789', '01/10/06 19:01:07', 703);
insert into LLAMADA values ('678234234', '666789789', '12/10/06 10:21:02', 827);
insert into LLAMADA values ('654345345', '654012012', '01/11/06 12:01:02', 311);
insert into LLAMADA values ('654345345', '654012012', '03/11/06 10:43:57', 207);
insert into LLAMADA values ('654345345', '654234234', '03/11/06 17:31:09', 421);
insert into LLAMADA values ('654345345', '654123321', '16/10/06 19:07:10', 38);
insert into LLAMADA values ('654345345', '654123321', '21/10/06 21:05:13', 257);


commit;
