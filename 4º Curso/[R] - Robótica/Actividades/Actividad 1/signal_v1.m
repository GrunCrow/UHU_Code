function salida = signal_v1(t, periodo, delay,amplitud)
%
salida=amplitud * sin((2*pi/periodo)*(t-delay));

salida(t<delay) = 0;
salida(t>delay+periodo) = 0;
end

