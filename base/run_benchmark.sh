#!/bin/bash

# Clona el repositorio con los benchmarks
git clone https://github.com/TU_USUARIO/actividad.git /benchmark

# Entra al directorio clonado
cd /benchmark/lenguajes

# Recorre cada carpeta de lenguaje
for lang in */ ; do
    lang_clean=${lang%/}  # Elimina la barra al final del nombre
    echo "Ejecutando benchmark en $lang_clean"

    # Construye la imagen del lenguaje
    docker build -t benchmark-$lang_clean $lang_clean

    # Ejecuta el contenedor y guarda el resultado en resultado.txt
    docker run --rm -v "/benchmark/lenguajes/$lang_clean:/benchmark/lenguajes/$lang_clean" benchmark-$lang_clean
done
 
