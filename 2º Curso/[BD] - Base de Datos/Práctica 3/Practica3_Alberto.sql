/*
 Dise�ar la funci�n facturacion(), la cual admite dos par�metros de entrada (un tel�fono y un a�o) y devuelve la facturaci�n total 
 de ese n�mero en ese a�o. La funci�n debe controlar 2 tipos de excepciones: 
 
     ? el tel�fono no existe o el tel�fono no ha realizado llamadas ese a�o.
     ? la facturaci�n del tel�fono es inferior a 1 euro

*/

set serveroutput on;

create or replace
function facturacion(p_tf_origen MF.LLAMADA.TF_ORIGEN%TYPE, a�o integer) return float is
    -- declaraciones locales
    importe number(10,2);
    facturacionBaja exception;
begin
    -- sentencias de la funcion
select sum(ll.duracion / 60 * ta.coste) into importe
from mf.telefono t inner join mf.tarifa ta using (tarifa, compa�ia) 
inner join mf.llamada ll on ll.tf_origen=t.numero
where extract (year from fecha_hora) = a�o and ll.tf_origen = p_tf_origen
group by ll.tf_origen;

if importe < 1 then raise facturacionBaja; end if;
return importe;
    
exception
    -- tratamiento de excepciones
when facturacionBaja then
    dbms_output.put_line('Facturacion baja');
    return -1;
when NO_DATA_FOUND then
    dbms_output.put_line('El telefono no existe o no ha realizado llamadas este a�o');
    return -1;
when others then
    dbms_output.put_line('Ha ocurrido un error');
    return -1;

end;

call dbms_output.put_line(facturacion('654123321', 2006)); --10, 18


/*Dise�ar el procedimiento LlamadaFacturacion(a�o), 
el cual, para cada tel�fono de la tabla LLAMADAS debe realizar 
una llamada a la funci�n facturaci�n y mostrar la
facturaci�n de dicho tel�fono en el a�o que se le pasa como par�metro
*/

set serveroutput on;
create or replace 
procedure LlamadaFacturacion(a�o integer) is
    cursor c_telefono (a�o integer) is SELECT distinct TF_ORIGEN
                            FROM MF.LLAMADA 
                            WHERE EXTRACT(YEAR FROM FECHA_HORA) = a�o;
begin

dbms_output.put_line ('N� tel�fono' || '   ' || 'Importe (en �)' );
dbms_output.put_line ('-----------------------------------------');
    
    FOR r_telefono IN c_telefono(a�o) LOOP
        dbms_output.put_line (r_telefono.tf_origen || '   ' || facturacion(r_telefono.tf_origen, a�o) );
    END LOOP;
    
exception
    when others then
    dbms_output.put_line('Ha habido un error');
end;

execute LLAMADAFACTURACION(2006);
/* 
N� tel�fono   Importe (en �)
-----------------------------------------
654012012   3,78
654123321   10,18
654345345   4,11
654789789   4,63
666010101   2,44
666789789   2,14
678111222   4,02
678234234   11,96
*/

-----------------------------------------

/* EJERCICIO 3
Crear un procedimiento que tenga como par�metros de entrada el nombre de una compa��a y una fecha. Dicho procedimiento debe realizar las siguientes operaciones:
    1. Comprobar que existen en la BD llamadas realizadas en la fecha que se pasa como par�metro. En caso contrario lanzar una excepci�n y mostrar el mensaje �No hay llamadas en la fecha <fecha> en la BD�.
    2. Para cada tel�fono de la compa��a que se pasa por par�metro, el procedimiento debe mostrar la siguiente informaci�n: n�mero de tel�fono, n�mero total de llamadas realizadas en la fecha indicada, n�mero de llamadas de duraci�n mayor de 100 segundos realizadas en la fecha, porcentaje que suponen estas �ltimas respecto al total de las realizadas.
    3. Un resumen del n�mero de llamadas realizadas por todos los tel�fonos de la
compa��a indicada en la fecha pasada por par�metro.
*/

SELECT COUNT(*)
FROM MF.LLAMADA WHERE TO_CHAR(FECHA_HORA, 'dd/mm/yy') = '01/10/16';

SELECT COUNT(*)
FROM MF.LLAMADA WHERE TO_CHAR(FECHA_HORA, 'dd/mm/yy') = '01/10/06';

set serveroutput on;
create or replace procedure llamadas_cia(p_cia COMPA�IA.NOMBRE%TYPE, p_fecha DATE) is
    no_existe_fecha exception;
    existe_fecha INTEGER;
    num_Total INTEGER;
    num_LL_100 INTEGER;
    num_LL_Total INTEGER;
    porcentaje number(5,2);
    cursor c_telefonos_cia is select numero from COMPA�IA C INNER JOIN
        TELEFONO T ON C.cif = T.compa�ia WHERE C.nombre = p_cia;
    cursor c_llamadas_tf (tlf LLAMADA.tf_origen%TYPE) is select tf_destino, duracion 
        from LLAMADA L where TO_CHAR(fecha_hora, 'dd/mm/yy')=p_fecha and tf_origen = tlf;
    
                            
begin
   SELECT count (*) into existe_fecha from LLAMADA where to_char(fecha_hora,'dd/mm/yy')=p_fecha;
    if (existe_fecha = 0)then raise no_existe_fecha; end if;
    
dbms_output.put_line('-------------------------------------------');
dbms_output.put_line(' Tlf. Origen  Num_LL  Num_LL_100  PORCENT%');
dbms_output.put_line('-------------------------------------------');

num_Total := 0;
for v_telefonos in c_telefonos_cia loop

    num_LL_100:=0; -- El contador se inicializa a 0 cada vez que aparece un nuevo telefono.
    num_LL_Total:=0;
    
    for v_llamadas in c_llamadas_tf(v_telefonos.numero) loop
    
        if v_llamadas.duracion > 100 then
            num_LL_100:= num_LL_100 + 1;
        end if;
        
        num_LL_Total := num_LL_Total + 1; -- Se incrementa para todas las llamdas
        num_Total := num_Total + 1;
        
    end loop;
    
    if num_LL_100 <> 0 then
        porcentaje := (num_LL_100 / num_LL_Total) * 100;
    else
        porcentaje := 0;
    end if;
    
    
dbms_output.put_line(v_telefonos.numero || '       ' || num_LL_Total || '          ' || num_LL_100 || '        ' || porcentaje || '%');   
end loop;

dbms_output.put_line('Numero Total de Llamadas: ' || num_Total);
    
        
exception
    when no_existe_fecha then
    dbms_output.put_line('No hay llamads en la fecha' || p_fecha || 'en la BD');
    
    when others then
    dbms_output.put_line('Ha habido un error');
end;

execute llamadas_cia('Aotra', '01/10/06');
execute llamadas_cia('Kietostar', '16/10/06');
---------------------

/* EJERCICIO 4
Crear un disparador que examine la inserci�n de nuevas llamadas 
y controle que, en la fecha y hora en la que se produce 
la nueva llamada, los tel�fonos origen y destino 
no est�n atendiendo ni realizando ninguna llamada iniciada en esa 
misma fecha y hora.
*/

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

insert into llamada values ('654345345', '678234234', '21/10/06 21:05:13', 123);

insert into llamada values ('654345345', '678234234', '12/09/06 11:52:19', 123);









