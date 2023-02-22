/*MF 13. Se necesita conocer el nombre de los clientes que tienen tel�fonos con tarifa �d�o� pero no �aut�nomos�.
Utiliza subconsultas para obtener la soluci�n.*/

SELECT * FROM MF.CLIENTE;

SELECT * FROM MF.tarifa;

SELECT * FROM MF.telefono;

SELECT cliente FROM MF.TELEFONO
WHERE TARIFA = 'd�o';

SELECT cliente FROM MF.TELEFONO
WHERE TARIFA = 'aut�nomos';

SELECT NOMBRE FROM MF.CLIENTE
WHERE   DNI IN (SELECT CLIENTE 
                FROM MF.TELEFONO 
                WHERE TARIFA = 'd�o')
AND 
        DNI NOT IN (SELECT CLIENTE 
                FROM MF.TELEFONO 
                WHERE TARIFA = 'aut�nomos');
                
/*MF 14. Obtener mediante subconsultas los nombres de 
clientes y n�meros de tel�fono de aquellos que hicieron
llamadas a tel�fonos de la compa��a Petaf�n pero no Aotra*/
SELECT * FROM MF.CLIENTE;
SELECT * FROM MF.TELEFONOS;
SELECT * FROM MF.LLAMADA;
SELECT * FROM MF."COMPA�IA";

SELECT DISTINCT LLAM.TF_ORIGEN FROM MF.LLAMADA LLAM
WHERE LLAM.TF_DESTINO IN(SELECT TEL.NUMERO
                                FROM MF.TELEFONO TEL INNER JOIN MF.COMPA�IA CIA ON TEL.compa�ia=CIA.CIF
                                WHERE  CIA.NOMBRE='Petaf�n');
                                
SELECT DISTINCT LLAM.TF_ORIGEN FROM MF.LLAMADA LLAM
WHERE LLAM.TF_DESTINO IN(SELECT TEL.NUMERO
                                FROM MF.TELEFONO TEL INNER JOIN MF.COMPA�IA CIA ON TEL.compa�ia=CIA.CIF
                                WHERE  CIA.NOMBRE NOT LIKE 'Aotra');
                                
SELECT CLTE.NOMBRE, TEL.NUMERO
    FROM MF.CLIENTE CLTE INNER JOIN MF.TELEFONO tEL ON CLTE.DNI = TEL.CLIENTE
    WHERE TEL.NUMERO IN(SELECT DISTINCT LLAM.TF_ORIGEN FROM MF.LLAMADA LLAM
WHERE LLAM.TF_DESTINO IN(SELECT TEL.NUMERO
                                FROM MF.TELEFONO TEL INNER JOIN MF.COMPA�IA CIA ON TEL.compa�ia=CIA.CIF
                                WHERE  CIA.NOMBRE='Petaf�n')
AND TEL.NUMERO NOT IN(SELECT DISTINCT LLAM.TF_ORIGEN FROM MF.LLAMADA LLAM
WHERE LLAM.TF_DESTINO IN(SELECT TEL.NUMERO
                                FROM MF.TELEFONO TEL INNER JOIN MF.COMPA�IA CIA ON TEL.compa�ia=CIA.CIF
                                WHERE  CIA.NOMBRE = 'Aotra')));

                                