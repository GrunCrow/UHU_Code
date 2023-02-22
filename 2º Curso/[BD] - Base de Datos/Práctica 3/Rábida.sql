CREATE OR REPLACE TRIGGER nueva_llamada
    BEFORE INSERT ON llamada
    FOR EACH ROW

DECLARE
    v_llamadas_orig integer; --Controla el numero de llamadas que realiza el tf origen
    v_llamadas_dest integer; -- Controla el numero de llamadas que realiza el tf_destino

BEGIN
    SELECT COUNT(*) INTO v_llamadas_orig
        FROM llamada
            WHERE (tf_origen = :new.tf_origen and fecha_hora = :new.fecha_hora) or --Cuando el tf origen esta realizando una llamada
               (tf_destino = :new.tf_origen and fecha_hora = :new.fecha_hora);     -- Cuando el tf origen esta recibiendo una llamada
               
    IF v_llamadas_orig > 0 then
        RAISE_APPLICATION_ERROR(-20001,'El telefono origen ' || :new.tf_origen || ' está realizando o recibiendo una llamada a las ' || :new.fecha_hora);
    END IF;
    
    SELECT COUNT(*) INTO v_llamadas_dest FROM llamada
        WHERE (tf_origen = :new.tf_destino and fecha_hora = :new.fecha_hora) or
            (tf_destino = :new.tf_destino and fecha_hora = :new.fecha_hora);
    
    IF v_llamadas_dest > 0 then
        RAISE_APPLICATION_ERROR(-200001,'El telefono destino ' || :new.tf_destino || ' está realizando o recibiendo una llamada a las' || :new.fecha_hora);
    END IF;
END;