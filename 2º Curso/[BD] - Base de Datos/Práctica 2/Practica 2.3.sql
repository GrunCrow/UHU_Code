/*EI 20. Obtener el nombre de los profesores y los números de sus despachos de aquellos profesores que no
comparten despacho*/
(SELECT P.DESPACHO /*Listado de despachos de los profesores responsables de cada asignatura*/
FROM EI.PROFESOR P INNER JOIN EI.ASIGNATURA A ON P.NPR=A.PROF);

SELECT * /*Muestra despachos en los que los profesores no son responsables*/
FROM EI.PROFESOR P
WHERE P.DESPACHO NOT IN
(SELECT P.DESPACHO
FROM EI.PROFESOR P INNER JOIN EI.ASIGNATURA A ON P.NPR=A.PROF);
/*No devuelve nada porque en algunos despachos hay +1 profesor*/

SELECT *
FROM EI.PROFESOR P
WHERE NOT EXISTS /*Comprueba que por cada profesor  su codigo no este dentro de los codigos de profesores responsables de asignaturas*/
(SELECT * FROM EI.ASIGNATURA A WHERE P.NPR=A.PROF);

/*EI 19. Listado de los alumnos que se han matriculado de alguna asignatura en el año 2000 o 2002 , y de
ninguna asignatura en el año 2001*/
SELECT *
FROM EI.MATRICULA M
WHERE (año=2000 OR año=2002); /*CONDICION 1 -> DEBE SER TRUE*/

SELECT *
FROM EI.MATRICULA M
WHERE (año=2001); /*CONDICION 2 -> DEBE SER FALSE*/

SELECT A.NOMBRE
FROM EI.ALUMNO A
WHERE EXISTS
            (SELECT *
            FROM EI.MATRICULA M
            WHERE (año=2000 OR año=2002) AND A.NAL=M.ALUM) /*Muestra alumnos matriculados en el 2000 o 2002*/
    AND NOT EXISTS
            (SELECT *
            FROM EI.MATRICULA M
            WHERE (año=2001) AND A.NAL=M.ALUM);
            
/*EI 20. Obtener el nombre de los profesores y los números de sus despachos de aquellos profesores que no
comparten despacho*/

SELECT P1.NOMBRE, P1.DESPACHO
FROM EI.PROFESOR P1 /*Pide esto pero de los despachos no compartidos, vamos a realizar la condición:*/
WHERE P1.DESPACHO NOT IN /*Buscaremos que el despacho no esté en la lista*/
                        (SELECT DESPACHO
                        FROM EI.PROFESOR P2 /*Seleccionamos todos los despachos que existen*/
                        WHERE P2.NPR<>P1.NPR); /*Seleccionamos los despachos en los que no coincida los de p2 con p2*/
 
 SELECT P1.NOMBRE, P1.DESPACHO
FROM EI.PROFESOR P1 /*Pide esto pero de los despachos no compartidos, vamos a realizar la condición:*/
WHERE NOT EXISTS /*Buscaremos que el despacho no esté en la lista*/
                        (SELECT DESPACHO
                        FROM EI.PROFESOR P2 /*Seleccionamos todos los despachos que existen*/
                        WHERE P2.NPR<>P1.NPR AND P2.DESPACHO=P1.DESPACHO); /*Seleccionamos los despachos en los que no coincida los de p2 con p2*/
    
 /*17. Utilizando consultas correlacionadas, mostrar el nombre de los abonados que han llamado el día ‘16/10/06’*/
 SELECT CL.NOMBRE, TE.NUMERO
 FROM MF.CLIENTE CL /*Obtenemos nombres de clientes*/
 INNER JOIN MF.TELEFONO TE ON CL.DNI=TE.CLIENTE /*Lo unimos con su numero corres`pmdoente y dni de cliente*/
 WHERE EXISTS (SELECT *
                FROM MF.LLAMADA L 
                WHERE TO_CHAR(L.FECHA_HORA, 'dd/mm/yy') ='16/10/06' AND L.TF_ORIGEN=TE.NUMERO);
        
/*MF 18. Utilizando consultas correlacionadas, obtener el nombre de los abonados que han realizado llamadas de
menos de 1 minuto y medio*/                
SELECT CL.NOMBRE, TE.NUMERO
FROM MF.CLIENTE CL /*Obtenemos nombres de clientes*/
INNER JOIN MF.TELEFONO TE ON CL.DNI=TE.CLIENTE /*Lo unimos con su numero corres`pmdoente y dni de cliente*/
WHERE EXISTS (SELECT *
                FROM MF.LLAMADA L 
                WHERE DURACION<90 AND L.TF_ORIGEN=TE.NUMERO);
                
/*MF 19. Utilizando consultas correlacionadas, obtener el nombre de los abonados de la compañía ‘Kietostar’ que
no hicieron ninguna llamada el mes de septiembre*/
SELECT *
FROM (MF.CLIENTE CL
INNER JOIN MF.TELEFONO TE ON CL.DNI=TE.CLIENTE INNER JOIN MF.COMPAÑIA CO ON TE.COMPAÑIA=CO.CIF)
WHERE CO.NOMBRE='Kietostar' /*Tenemos los abonados en kietostar*/
    AND NOT EXISTS
            (SELECT *
            FROM MF.LLAMADA L
            WHERE EXTRACT(month from L.FECHA_HORA) = '9' AND L.TF_ORIGEN=TE.NUMERO);
            
/*MF 20. Utilizando consultas correlacionadas, mostrar todos los datos de los telefonos que hayan llamado al
número 654234234 pero no al 666789789*/

SELECT *
FROM MF.TELEFONO TE
/*INNER JOIN MF.LLAMADA L ON te.numero=L.TF_ORIGEN*/
WHERE EXISTS (SELECT *
                FROM MF.LLAMADA L2
                WHERE L2.TF_DESTINO=654234234 AND L2.TF_ORIGEN=TE.NUMERO)
    AND NOT EXISTS (SELECT *
                FROM MF.LLAMADA L3
                WHERE L3.TF_DESTINO=666789789 AND L3.TF_ORIGEN=TE.NUMERO);
                
/*MF 21. Utilizando consultas correlacionadas, obtener el nombre y número de teléfono de los clientes de la
compañía Kietostar que no han hecho llamadas a otros teléfonos de la misma compañía*/
SELECT CL.NOMBRE, T.NUMERO
FROM (MF.CLIENTE CL INNER JOIN MF.TELEFONO T ON CL.DNI=T.CLIENTE) INNER JOIN MF.COMPAÑIA CO ON TE.COMPAÑIA =CO.CIF
WHERE CO.NOMBRE='Kierostar' 
    AND NOT EXISTS(SELECT *
                    FROM (MF.LLAMADA L INNER JOIN MF.TELEFONO TE ON L.TF_DESTINO=TE.NUMERO
                    WHERE CO.NOMBRE='Kietostar' AND L.TF_ORIGEN=T.NUMERO))
WHERE TE.TF_ORIGEN
    AND EXISTS (SELECT *
                FROM MF.LLAMADA L2 INNER JOIN  MF.COMPAÑIA CO2
                WHERE L2.TF_ORIGEN=TE.NUMERO AND TE.COMPAÑIA=CO2.CIF)
    AND NOT EXISTS (SELECT *
                FROM MF.LLAMADA L3
                WHERE L3.TF_DESTINO=666789789 AND L3.TF_ORIGEN=TE.NUMERO)
                        