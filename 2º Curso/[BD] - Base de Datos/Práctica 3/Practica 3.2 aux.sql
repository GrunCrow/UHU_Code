CREATE OR REPLACE TRIGGER NUEVA_LLAMADA
    BEFORE INSERT ON LLAMADA
    FOR EACH ROW
    declare
    v_llamadas_orig integer; --Controla el numero de llamadas que realiza el tf origen
    v_llamadas_dest integer; -- Controla el numero de llamadas que realiza el tf_destino
    
    BEGIN
    select count(*) into v_llamadas_orig from llamada
    where (tf_origen = :new.tf_origen and fecha_hora = :new.fecha_hora) or --Cuando el tf origen esta realizando una llamada
    (tf_destino = :new.tf_origen and fecha_hora = :new.fecha_hora);         -- Cuando el tf origen esta recibiendo una llamada
    
    if v_llamadas_orig > 0  then
    RAISE_APPLICATION_ERROR(-20001, 'El telefono origen ' || :new.tf_origen || ' esta realizando o recibiendo
    una llamada a las ' || :new.fecha_hora);
    end if;
    
    select count(*) into v_llamadas_dest from llamada
    where (tf_origen = :new.tf_destino and fecha_hora = :new.fecha_hora) or
    (tf_destino = :new.tf_destino and fecha_hora = :new.fecha_hora);
    
    if v_llamadas_dest > 0  then
    RAISE_APPLICATION_ERROR(-20001, 'El telefono destino ' || :new.tf_destino || ' esta realizando o recibiendo
    una llamada a las ' || :new.fecha_hora);
    end if;
    
    END;




















/*Comprobar que existen en la BD llamadas realizadas 
en la fecha que se pasa como parámetro. 
En caso contrario lanzar una excepción y mostrar el 
mensaje “No hay llamadas en la fecha <fecha> en la BD”. */

SELECT *
FROM MF.LLAMADA WHERE TO_CHAR(FECHA_HORA, 'dd/mm/yy') = year; /*comparamos con el dato del procedimiento*/

SELECT COUNT (*)
FROM MF.LLAMADA WHERE TO_CHAR(FECHA_HORA, 'dd/mm/yy') = year;

/*Para cada teléfono de la compañía que se pasa por 
parámetro, el procedimiento debe mostrar la siguiente 
información: número de teléfono, número total de llamadas 
realizadas en la fecha indicada, número de llamadas de 
duración mayor de 100 segundos realizadas en la fecha, 
porcentaje que suponen estas últimas respecto al total 
de las realizadas.*/

SELECT LL.TF_ORIGEN, LL.DURACION
FROM MF.LLAMADA LL
WHERE LL.DURACION>100
AND TO_CHAR(FECHA_HORA, 'dd/mm/yy') = '01/10/06';

/*Un resumen del número de llamadas realizadas por todos 
los teléfonos de la compañía indicada en la fecha 
pasada por parámetro.*/