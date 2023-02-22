create or replace procedure llamadas_cia(nombre_cia compañia.nombre%type, fecha llamada.fecha_hora%type) is
    n_fechas integer;
    total_llamadas integer;
    n_llamadas_largas integer;
    porcentaje number(5,2);
    tot_llamadas_cia integer;
    
    no_existe_fecha exception;
    
    cursor c_telefono is
        select numero
            from compañia cia inner join telefono t on t.compañia = cia.cif
                where cia.nombre=nombre_cia;
                
    cursor c_llamada (tlf llamada.tf_origen%type) is
        select tf_destino, duracion
            from llamada ll
                where to_char(fecha_hora, 'dd/mm/yy') = fecha and
                tf_origen = tlf;
    
begin
    select count(*) into n_fechas from LLAMADA where to_char(fecha_hora, 'dd/mm/yy') = fecha; -- contamos cuantas llamadas hay con la fecha introducida
    
    if n_fechas = 0 then raise no_existe_fecha; --si numero llamadas = 0 no existen y raise la exception
    end if;
    
    dbms_output.put_line('-----------------------------------------');
    dbms_output.put_line('Tlf.  Origen  NUM_LL  NUM_LL_100  PORCENT%');
    dbms_output.put_line('-----------------------------------------');
    
    tot_llamadas_cia:=0;
    
    for r_telefono in c_telefono loop
    
        total_llamadas:=0;
        n_llamadas_largas:=0;
    
        for r_llamada in c_llamada(r_telefono.numero) loop
            total_llamadas := total_llamadas + 1;
            
            if (r_llamada.duracion>100) then 
                n_llamadas_largas := n_llamadas_largas+1;
            end if;
            
        end loop;
        
        tot_llamadas_cia := tot_llamadas_cia + total_llamadas;
    
        if n_llamadas_largas <> 0 then
            porcentaje := (n_llamadas_largas / total_llamadas) * 100;
        else
            porcentaje := 0;
        end if;
    
    
        dbms_output.put_line(r_telefono.numero || '         ' || total_llamadas || '            ' || n_llamadas_largas ||'            '|| porcentaje); 
    
    end loop;
    
    dbms_output.put_line('-----------------------------------------');    
    dbms_output.put_line( 'Numero de llamadas realizadas: ' || tot_llamadas_cia); 
    
    
exception
    when no_existe_fecha then
        dbms_output.put_line('No hay llamadas en fecha ' || fecha || ' en la BD');

end;

set serveroutput on;

execute llamadas_cia('Aotra','01/10/06');

execute llamadas_cia('Kietostar','16/10/06');


--DISPARADOR

CREATE OR REPLACE TRIGGER nueva_llamada
BEFORE INSERT ON llamada
FOR EACH ROW

DECLARE
    v_llamadas_orig integer;
    v_llamadas_dest integer;

BEGIN
    SELECT COUNT(*) INTO v_llamadas_orig
        FROM llamada
            WHERE (tf_origen = :new.tf_origen or fecha_hora = :new.fecha_hora) or
               (tf_destino = :new.tf_origen and fecha_hora = :new.fecha_hora);
               
    IF v_llamadas_orig > 0 then
        RAISE_APPLICATION_ERROR(-200001,'El telefono origen ' || :new.tf_origen || ' está realizando o recibiendo una llamada a las ' || fecha_hora);
    END IF;
    
    SELECT COUNT(*) INTO v_llamadas_dest FROM llamada
        WHERE (tf_origen = :new.tf_destino and fecha_hora = :new.fecha_hora) or
            (tf_destino = :new.tf_destino and fecha_hora = :new.fecha_hora);
    
    IF v_llamadas_dest > 0 then
        RAISE_APPLICATION_ERROR(-200001,'El telefono destino ' || :new.tf_destino || ' está realizando o recibiendo una llamada ' || fecha_hora);
    END IF;
END;
    



















/*create or replace
procedure llamadas_cia  (p_cia MF.COMPAÑIA.NOMBRE%TYPE, p_fecha DATE) is
    no_hay_llamadas exception;
    no_existe_fecha_llamada exception;
    
    cursor c_fecha_hora is 
        SELECT distinct fecha_hora from mf.llamada;
        where extract(year from fecha_hora) = p_fecha;

BEGIN
    SELECT COUNT(*) INTO existe_Fecha
    FROM LLAMADA
    WHERE TO_CHAR(FECHA_HORA, 'dd/mm/yy') = fecha;
    
    if existe_fecha = 0 then raise no_existe_fecha;
    end if;
    
    dbms_output.put_line('-----------------------------------------');
    dbms_output.put_line('Tlf.  Origen  NUM_LL  NUM_LL_100  PORCENT%');
    dbms_output.put_line('-----------------------------------------');
    
    num_Total := 0;

    for v_telefonos in c_telefonos_cia loop
        num_LL_100:=0;
        num_LL_Total:=0;
    
        for v_llamadas in c_llamadas_tf(v_telefonos.numero) loop
            if v_llamadas.duracion > 100 then
                num_LL_100 := num_LL_100+1;
            end if;
            
            num_LL_Total := num_LL_Total+1;
            num_Total := num_Total+1;
        end loop;
        
        if num_LL_100 <> 0 then
            porcentaje := (num_LL_100 / num_LL_Total) * 100;
        else
            porcentaje := 0;
        end if;
        
        dbms_output.put_line(v_telefonos.numero || '         ' || num_LL_Total ||
        '            ' || porcentaje); 
    
end;*/


set serveroutput on;

exec llamadas_cia('Aotra','01/10/06');