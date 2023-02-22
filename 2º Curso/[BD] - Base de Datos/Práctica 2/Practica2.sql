SELECT idasig,nombre,esp
FROM ei.asignatura
WHERE cr�ditos>4.5 and curso=3;
/*Muestra los atributos se�alados en el select de la tabla asignatura WHERE creditos>4.5 y curso es el 3*/

SELECT *
FROM ei.profesor;
/*Muestra todos (*) los atributos de la tabla profesor*/

SELECT DISTINCT ant
FROM ei.profesor;
/*Muestra solo los tipos de ant que hay (sin duplicados)*/


/*Mostrar el nombre de los alumnos, el n�mero de hermanos y el descuento que le corresponde (el descuento es de 300 � por hermano),
ordenados de mayor a menor seg�n el descuento, y en caso de igualdad, ordenados alfab�ticamente por nombre */
SELECT * FROM ei.alumno;

SELECT A.nombre,A.nh,nh*300 as descuento
FROM ei.alumno A
ORDER BY descuento DESC, nombre ASC;


/*Obtener el dni y nombre de los alumnos nacidos entre 1970 y 1974, y cuya localidad de nacimiento sea Huelva o C�diz*/
SELECT *
FROM ei.alumno;

SELECT A.dni,A.nombre,A.fechanac, A.lugar /*PRIMERO COGEMOS FECHANAC Y LUGAR PORQ SINO NO PODEMOS HACER EL WHERE CON ESTOS ATRIBUTOS, AHORA LOS ELIMINAREMOS*/
FROM ei.alumno A
WHERE A.fechanac between '1/1/70' and '31/12/74' and A.lugar in ('Huelva','C�diz');


/*Obtener el nombre de todos los alumnos cuyo nombre empiece por la letra M y hayan nacido en una ciudad cuyo nombre tenga, al menos, 6 caracteres pero no comience por la letra P*/
SELECT * FROM ei.alumno;

SELECT A.dni,A.nombre,A.lugar
FROM ei.alumno A
WHERE A.nombre like 'M%'
  and A.lugar not like 'P%' and A.lugar like '______%';
  
  
/*Obtener un listado de los a�os de nacimiento de los alumnos, ordenados crecientemente*/
SELECT A.dni,A.nombre, extract(year from A.fechanac) as AnoNac
FROM ei.alumno A
ORDER BY AnoNac ASC;

SELECT DISTINCT extract(year from A.fechanac) as AnoNac
FROM ei.alumno A
ORDER BY AnoNac ASC;

/*Obtener el nombre de las compa��as cuya direcci�n web contenga la cadena �et� y acabe en �com�*/
SELECT * FROM mf."COMPA�IA";

SELECT C.nombre, C.web
FROM mf."COMPA�IA" C
WHERE C.web like '%com'
  and C.web like '%et%';
  
/*Obtener el nombre y direcci�n de los clientes nacidos en 1973 o 1985 y cuyo c�digo postal comience por 15,
ordenado ascendentemente por el nombre y, en caso de igualdad, descendentemente por la direcci�n*/
 SELECT * FROM mf.cliente;
 
 SELECT C.nombre,C.direccion,extract(year from C.f_nac) as FechaNac,C.cp
 FROM mf.cliente C
 WHERE extract(year from C.f_nac) in ('1973','1985')
  and C.cp like '15%'
ORDER BY c.nombre ASC, c.direccion DESC;


/*Obtener el tel�fono de destino de las llamadas realizadas desde el n�mero  �666010101�, en el a�o 2006*/
 SELECT * FROM mf.llamada; 
 
 SELECT C.tf_destino, C.tf_origen, extract(year from C.fecha_hora) as ano
 FROM mf.llamada C
 WHERE extract(year from C.fecha_hora)='2006' and C.tf_origen='666010101';
 
 
 /*Obtener los n�meros de tel�fono que han llamado alguna vez al �666010101�, entre las 10:00 y las 12:00*/
  SELECT * FROM mf.llamada; 
 
 SELECT C.tf_destino, C.tf_origen, C.fecha_hora
 FROM mf.llamada C
 WHERE extract (hour from C.fecha_hora) between '10' and '12'
  and C.tf_destino='666010101';
 