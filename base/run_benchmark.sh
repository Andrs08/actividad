#!/bin/bash

# Clona el repositorio con los benchmarks
git clone https://github.com/Andrs08/actividad.git /benchmark

# Entra al directorio clonado
cd /benchmark/lenguajes

# Archivo temporal para almacenar los tiempos
RESULTS_FILE="/benchmark/resultados/tiempos.txt"
mkdir -p /benchmark/resultados
echo "" > $RESULTS_FILE  # Limpia el archivo antes de comenzar

# Recorre cada carpeta de lenguaje
for lang in */ ; do
    lang_clean=${lang%/}  # Elimina la barra al final del nombre
    echo "Ejecutando benchmark en $lang_clean"

    # Construye la imagen del lenguaje
    docker build -t benchmark-$lang_clean $lang_clean

    # Asegurar que la carpeta existe en el host
    mkdir -p "/actividad/lenguajes/$lang_clean"

    # Ejecuta el contenedor con un volumen montado para persistir los resultados
    tiempo=$(docker run --rm -v "/actividad/lenguajes/$lang_clean:/benchmark/lenguajes/$lang_clean" benchmark-$lang_clean | sed -n 's/.*Tiempo: \([0-9.]* ms\)/\1/p')

    # Guarda el resultado en el archivo de tiempos global
    echo "$lang_clean: $tiempo" >> $RESULTS_FILE

    # Escribe el tiempo en resultado.txt dentro de la carpeta del lenguaje
    echo "$lang_clean: $tiempo" > "/actividad/lenguajes/$lang_clean/resultado.txt"
done

# Mostrar los tiempos finales en pantalla
echo -e "\n==== Tiempos Finales ===="
cat $RESULTS_FILE
