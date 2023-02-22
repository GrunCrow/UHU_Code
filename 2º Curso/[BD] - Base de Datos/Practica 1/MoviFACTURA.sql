CREATE TABLE compania (
  cif char(9),
  nombre varchar(20),
  web varchar(30),
  
  CONSTRAINT ciaClave PRIMARY KEY (cif)
);

CREATE TABLE tarifa (
  tarifa char(10),
  compania char(9),
  descripcion varchar(50),
  coste number(3,2),
  
  CONSTRAINT tarifaClave PRIMARY KEY (tarifa,compania),
  CONSTRAINT tarifaAjena FOREIGN KEY (compania)
      REFERENCES COMPANIA(cif) ON DELETE CASCADE 
);

CREATE TABLE cliente(
  dni char(9),
  nombre varchar(50),
  f_nac date,
  direccion varchar(100),
  cp char(6),
  ciudad varchar(50),
  provincia varchar(50),
  
  CONSTRAINT clienteClave PRIMARY KEY (dni)
);

DESC cliente;

CREATE TABLE TELEFONO(
  numero char(9),
  f_contrato date,
  tipo char(1),
  puntos number(6,0),
  compania char(9),
  tarifa char(10),
  cliente char(9),
  
  CONSTRAINT TfClave PRIMARY KEY (numero),
  CONSTRAINT TfTarifaAjena FOREIGN KEY (tarifa,compania)
    REFERENCES TARIFA,
  CONSTRAINT TfCompaniaAjena FOREIGN KEY (compania)
    REFERENCES COMPANIA(cif),
  CONSTRAINT TfClienteAjena FOREIGN KEY (cliente)
    REFERENCES CLIENTE(dni),
  CONSTRAINT TfTipo CHECK (tipo IN ('T','C'))
);

DESC telefono;

CREATE TABLE LLAMADA(
  tf_origen char(9),
  tf_destino char(9),
  fecha_hora timestamp,
  duracion number(5,0),
  
  CONSTRAINT LlamadaClave PRIMARY KEY (tf_origen,fecha_hora),
  CONSTRAINT LlamadaTfOrigenAjena FOREIGN KEY (tf_origen)
    REFERENCES TELEFONO(numero),
  CONSTRAINT LlamadaTfDestinoAjena FOREIGN KEY (tf_destino)
    REFERENCES TELEFONO(numero),
    
  CONSTRAINT LlamadaDestUnica UNIQUE(tf_destino,fecha_hora)
);

/*PARTE 2*/

DESC LLAMADA;
DESC COMPANIA;
  
ALTER TABLE COMPANIA ADD CONSTRAINT NOMBRE_UNICO UNIQUE(nombre);
ALTER TABLE LLAMADA ADD CONSTRAINT TF_DIFERENTES CHECK(tf_origen <> tf_destino);

SELECT constraint_name,constraint_type
FROM all_constraints
WHERE table_name='LLAMADA'; /*  COMPROBACION */

ALTER TABLE TARIFA ADD CONSTRAINT TARIFA_COSTE CHECK(coste<=1.50 and coste>=0.05);

SELECT constraint_name,constraint_type
FROM all_constraints
WHERE table_name='TARIFA'; /*  COMPROBACION */
/*SALE EN TARIFA COSTE UNA C = CHECK*/

DESC COMPANIA;
ALTER TABLE COMPANIA MODIFY nombre NOT NULL;
DESC COMPANIA;

DESC CLIENTE; /*Nombre sale sin restriccion*/
ALTER TABLE CLIENTE MODIFY nombre NOT NULL;
DESC CLIENTE; /*nombre sale con restriccion not null*/

ALTER TABLE TARIFA MODIFY coste NOT NULL;
ALTER TABLE TELEFONO MODIFY compania NOT NULL;
ALTER TABLE TELEFONO MODIFY tarifa NOT NULL;
ALTER TABLE LLAMADA MODIFY duracion NOT NULL;

INSERT INTO COMPANIA VALUES ('A00000001','Kierostar','http://www.kietostar.com');
INSERT INTO COMPANIA VALUES ('B00000002','Aotra','http://www.aotra.com');
SELECT * FROM COMPANIA;

/*INSERT INTO COMPANIA VALUES ('A00000001','Petafón','http://www.petafón.com'); IDENTIFICADOR PRIMARY KEY YA USADO*/
/*INSERT INTO COMPANIA VALUES ('C00000003','Aotra','‘http://www.aot.com'); NOMBRE DE COMPANIA YA USADO Y ES UNIQUE*/
/*INSERT INTO TARIFA VALUES ('joven','D00000004','menores de 21 años','0,20'); CLAVE PRINCIPAL NO ENCONRADA*/
INSERT INTO tarifa VALUES ('duo','B00000002','la pareja tambien está en la compania','0,18');
/*INSERT INTO tarifa VALUES ('amigos','B00000002','10 amigos estan tambien está en la compania','1,60'); COSTE DE LA TARIFA VIOLDA - SUPERA VALORES*/

/* Borrar la compañía cuyo CIF es B00000002. Comprobar si se han borrado todas sus tarifas 
*/
DELETE FROM COMPANIA
    WHERE CIF = 'B00000002';

SELECT * FROM COMPANIA;

/*SE HA REALIZADO, SE HA ELIMINADO AOTRA QUE TENIA ESE CIF*/

