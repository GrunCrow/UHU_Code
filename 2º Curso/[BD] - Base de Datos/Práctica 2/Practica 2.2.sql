/*MF 13. Se necesita conocer el nombre de los clientes que tienen teléfonos con tarifa “dúo” pero no “autónomos”.
Utiliza subconsultas para obtener la solución.*/

SELECT * FROM MF.CLIENTE;

SELECT * FROM MF.tarifa;

SELECT * FROM MF.telefono;

SELECT cliente FROM MF.TELEFONO
WHERE TARIFA = 'dúo';

SELECT cliente FROM MF.TELEFONO
WHERE TARIFA = 'autónomos';

SELECT NOMBRE FROM MF.CLIENTE
WHERE   DNI IN (SELECT CLIENTE 
                FROM MF.TELEFONO 
                WHERE TARIFA = 'dúo')
AND 
        DNI NOT IN (SELECT CLIENTE 
                FROM MF.TELEFONO 
                WHERE TARIFA = 'autónomos');
                
/*MF 14. Obtener mediante subconsultas los nombres de 
clientes y números de teléfono de aquellos que hicieron
llamadas a teléfonos de la compañía Petafón pero no Aotra*/
SELECT * FROM MF.CLIENTE;
SELECT * FROM MF.TELEFONOS;
SELECT * FROM MF.LLAMADA;
SELECT * FROM MF."COMPAÑIA";

SELECT DISTINCT LLAM.TF_ORIGEN FROM MF.LLAMADA LLAM
WHERE LLAM.TF_DESTINO IN(SELECT TEL.NUMERO
                                FROM MF.TELEFONO TEL INNER JOIN MF.COMPAÑIA CIA ON TEL.compañia=CIA.CIF
                                WHERE  CIA.NOMBRE='Petafón');
                                
SELECT DISTINCT LLAM.TF_ORIGEN FROM MF.LLAMADA LLAM
WHERE LLAM.TF_DESTINO IN(SELECT TEL.NUMERO
                                FROM MF.TELEFONO TEL INNER JOIN MF.COMPAÑIA CIA ON TEL.compañia=CIA.CIF
                                WHERE  CIA.NOMBRE NOT LIKE 'Aotra');
                                
SELECT CLTE.NOMBRE, TEL.NUMERO
    FROM MF.CLIENTE CLTE INNER JOIN MF.TELEFONO tEL ON CLTE.DNI = TEL.CLIENTE
    WHERE TEL.NUMERO IN(SELECT DISTINCT LLAM.TF_ORIGEN FROM MF.LLAMADA LLAM
WHERE LLAM.TF_DESTINO IN(SELECT TEL.NUMERO
                                FROM MF.TELEFONO TEL INNER JOIN MF.COMPAÑIA CIA ON TEL.compañia=CIA.CIF
                                WHERE  CIA.NOMBRE='Petafón')
AND TEL.NUMERO NOT IN(SELECT DISTINCT LLAM.TF_ORIGEN FROM MF.LLAMADA LLAM
WHERE LLAM.TF_DESTINO IN(SELECT TEL.NUMERO
                                FROM MF.TELEFONO TEL INNER JOIN MF.COMPAÑIA CIA ON TEL.compañia=CIA.CIF
                                WHERE  CIA.NOMBRE = 'Aotra')));

                                