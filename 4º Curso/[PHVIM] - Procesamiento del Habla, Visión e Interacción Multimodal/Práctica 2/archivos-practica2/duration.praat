# Praat script que toma como input un archivo de audio (.wav)
# y devuelve su longitud en segundos.

# Argumento: archivo de audio.
form Input parameters for sound length
  word file .wav
endform

# Los objetos 'long sound' no se levantan a memoria.
Open long sound file... 'file$'

# Calcula la duracion.
dur = Get duration

# La imprime y termina.
echo 'dur:4'

