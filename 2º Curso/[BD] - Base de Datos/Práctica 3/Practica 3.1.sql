set serveroutput on;

create or replace
procedure hola (nombre varchar) is
begin
    dbms_output.put_line('Hola ' || nombre);
end;

call hola('Pepe');

create or replace
function facturacion(p_tf_origen mf.llamada.tf_origen%type, a�o integer) return float is
-- declaraciones locales
importe number(10,2);
facturacionBaja exception;

begin
-- sentencias de la funcion
select sum(ll.duracion/60*ta.coste) into importe
from mf.telefono t inner join mf.tarifa ta using(tarifa, compa�ia)
    inner join mf.llamada ll on ll.tf_origen=t.numero
    where extract(year from fecha_hora)=a�o and ll.tf_origen=p_tf_origen
group by ll.tf_origen;

if importe < 1 then raise facturacionBaja;
end if;

return importe;

exception
--tratamiento de excepciones
when facturacionBaja then
    dbms_output.put_line('Facturacion demasiado baja');
    return -1;
when NO_DATA_FOUND then
    dbms_output.put_line('El telefono no existe o no ha realizado llamadas ese a�o');
    return -1;
when others then
    dbms_output.put_line('Ha ocurrido un error');
    return -1;
end;

call dbms_output.put_line(facturacion('654123321',2006));

create or replace
procedure LlamadaFacturacion(a�o integer) is
    cursor c_telefonos (a�o integer) is
    select distinct tf_origen from mf.llamada
    where extract(year from fecha_hora) = a�o;
begin
dbms_output.put_line('N� telefono' || '     ' || 'Importe (en �)');
dbms_output.put_line('-------------------------------------------');
for r_telefono in c_telefonos(a�o) loop
    dbms_output.put_line(r_telefono.tf_origen || '     ' || facturacion(r_telefono.tf_origen, a�o));
end loop;
exception
when others then
    dbms_output.put_line('Ha ocurrido un error');
end;

execute llamadaFacturacion(2006);