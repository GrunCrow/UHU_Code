SELECT A.NOMBRE
FROM EI.ALUMNO A INNER JOIN EI.MATRICULA M ON A.nAL = M.alum
WHERE M.A�O = 2002 
GROUP BY A.NOMBRE
HAVING AVG(M.FEB_JUN) > 5; /*Act�a sobre cada grupo*/

/*E-29*/
SELECT A.NOMBRE, COUNT(*)
FROM EI.ASIGNATURA A INNER JOIN EI.MATRICULA M USING(IDASIG)
WHERE M.A�O = 2002
GROUP BY A.NOMBRE
HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM EI.MATRICULA WHERE A�O = 2002 GROUP BY IDASIG);

/*WHERE actua sobre la tabla original
  HAVING actua sobre el grupo/*
/*E-30*/

/*SELECT A.nombre, count(*)
FROM EI.ASIGNATURA A INNER JOIN EI.MATRICULA M USING (IDASIG)
WHERE M.A�O = 2002 AND M.FEB_JUN < 5
GROUP BY A.NOMBRE
HAVING COUNT(*) > 50;*/

SELECT A.nombre, count(*)
FROM EI.ASIGNATURA A INNER JOIN EI.MATRICULA M USING (IDASIG)
WHERE M.A�O = 2002 AND M.FEB_JUN < 5 AND IDASIG IN (SELECT M1.IDASIG
FROM EI.MATRICULA M1 WHERE M1.A�O = 2002 GROUP BY M1.IDASIG HAVING COUNT(*) > 50)
GROUP BY A.NOMBRE;

/*E31*/
SELECT NOMBRE
FROM EI.ALUMNO AL
WHERE NOT EXISTS (SELECT *
FROM EI.ASIGNATURA A INNER JOIN EI.PROFESOR p ON A.PROF = P.nPR
WHERE P.NOMBRE = 'Santiago Baroja L�pez'
AND NOT EXISTS (SELECT * FROM EI.MATRICULA M WHERE AL.NAL = M.ALUM AND A.IDASIG = M.IDASIG));

/*MF22*/
/*SELECT *
FROM MF.TELEFONO;

SELECT NOMBRE
FROM MF.COMPA�IA C INNER JOIN MF.TELEFONO T ON (C.CIF = T.COMPA�IA);
WHERE ; */

SELECT C.NOMBRE
FROM MF.LLAMADA ll INNER JOIN MF.TELEFONO T ON ll.TF_ORIGEN = T.NUMERO
INNER JOIN MF.COMPA�IA C ON T.COMPA�IA=C.CIF
WHERE TO_CHAR(ll.FECHA_HORA, 'DD/MM//YY') = '16/10/06'
GROUP BY C.NOMBRE
HAVING COUNT(*) >=ALL(SELECT COUNT (*) FROM MF.LLAMADA LL INNER JOIN MF.TELEFONO T ON TF_ORIGEN = T.NUMERO
WHERE TO_CHAR(LL.FECHA_HORA, 'DD/MM/YY') = '16/10/06' GROUP BY C.NOMBRE);
/*REVISAR*/

/*MF23*/
SELECT T.NUMERO, C.NOMBRE
FROM MF.CLIENTE C INNER JOIN MF.TELEFONO T ON T.CLIENTE = C.DNI
WHERE NOT EXISTS(SELECT * FROM MF.LLAMADA L1
WHERE L1.TF_ORIGEN = '654345345' AND TO_CHAR(L1.FECHA_HORA, 'MM/YY' ) = '10/06'
AND NOT EXISTS (SELECT * 
FROM MF.LLAMADA L2 
WHERE T.NUMERO = L2.TF_ORIGEN AND L2.TF_DESTINO = L1.TF_DESTINO AND L2.TF_ORIGEN <> '654345345'));


/*MF24*/
SELECT *
FROM MF.TELEFONO;

SELECT C.NOMBRE AS CLIENTE, CO.NOMBRE AS COMPA�IA, SUM(L.DURACION / 60 * TA.COSTE) AS COSTETOTAL
FROM (MF.CLIENTE C INNER JOIN MF.TELEFONO T ON C.DNI = T.CLIENTE)
INNER JOIN MF.TARIFA TA ON TA.TARIFA=T.TARIFA AND TA.COMPA�IA = T.COMPA�IA
INNER JOIN MF.COMPA�IA CO ON CO.CIF = TA.COMPA�IA
INNER JOIN MF.LLAMADA L ON L.TF_ORIGEN = T.NUMERO
GROUP BY C.NOMBRE, CO.NOMBRE
ORDER BY C.NOMBRE DESC, CO.NOMBRE ASC;

/*MF25*/


SELECT C.NOMBRE AS CLIENTE, SUM(L.DURACION) AS DURACION
FROM (MF.LLAMADA L INNER JOIN MF.TELEFONO T ON L.TF_ORIGEN = T.NUMERO )
INNER JOIN MF.CLIENTE C ON T.CLIENTE = C.DNI
WHERE L.TF_DESTINO IN (SELECT TE.NUMERO 
FROM MF.TELEFONO TE INNER JOIN MF.CLIENTE CL ON TE.CLIENTE = CL.DNI WHERE CL.PROVINCIA = 'Ja�n')
AND L.TF_ORIGEN IN (SELECT TE.NUMERO 
FROM MF.TELEFONO TE INNER JOIN MF.CLIENTE CL ON TE.CLIENTE = CL.DNI WHERE CL.PROVINCIA = 'La Coru�a')
Group by c.nombre;

/*MF26*/

SELECT C.NOMBRE, COUNT (*) 
FROM MF.LLAMADA L INNER JOIN MF.TELEFONO T ON L.TF_ORIGEN = T.NUMERO INNER JOIN
MF.CLIENTE C ON C.DNI = T.CLIENTE
GROUP BY C.NOMBRE
HAVING COUNT(*) > 5;


/*MF 27*/

SELECT C.NOMBRE, AVG(TA.COSTE) AS MEDIA
FROM MF.CLIENTE C INNER JOIN MF.TELEFONO T ON C.DNI = T.CLIENTE
INNER JOIN MF.TARIFA TA USING (TARIFA, COMPA�IA)
GROUP BY C.NOMBRE
HAVING AVG(TA.COSTE) >= ALL(SELECT AVG(COSTE) FROM MF.TARIFA);


/*MF28*/
Select CL.NOMBRE
FROM MF.LLAMADA L INNER JOIN MF.TELEFONO T ON L.TF_ORIGEN = T.NUMERO
INNER JOIN MF.TARIFA TA USING(TARIFA,COMPA�IA)
INNER JOIN MF.CLIENTE CL ON T.CLIENTE = CL.DNI
WHERE L.TF_DESTINO IN (SELECT T.NUMERO FROM MF.TELEFONO T INNER JOIN MF.COMPA�IA C ON T.COMPA�IA = C.CIF
WHERE C.NOMBRE = 'Kietostar')
GROUP BY CL.NOMBRE
HAVING SUM(L.DURACION / 60 * TA.COSTE) < 100;


