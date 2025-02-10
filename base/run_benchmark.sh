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
    output=$(docker run --rm -v "/actividad/lenguajes/$lang_clean:/benchmark/lenguajes/$lang_clean" benchmark-$lang_clean)

    # Extraer el resultado y el tiempo de la salida del contenedor
    resultado=$(echo "$output" | awk -F'Resultado: ' '{print $2}' | tr -d '\r')
    tiempo=$(echo "$output" | awk -F'Tiempo: ' '{print $2}' | tr -d '\r')

    # Verificar si el resultado está vacío, si es así, tomarlo de resultado.txt anterior
    if [[ -z "$resultado" ]]; then
        resultado=$(cat "/actividad/lenguajes/$lang_clean/resultado.txt" | grep "Resultado:" | cut -d ":" -f2-)
    fi

    # Guarda el resultado en el archivo de tiempos generales
    echo "$lang_clean: $tiempo" >> $RESULTS_FILE

    # Escribir en resultado.txt manteniendo el resultado y actualizando el tiempo
    echo "Resultado: $resultado" > "/actividad/lenguajes/$lang_clean/resultado.txt"
    echo "Tiempo: $tiempo" >> "/actividad/lenguajes/$lang_clean/resultado.txt"
done

# Mostrar los tiempos finales en pantalla
echo -e "\n==== Tiempos Finales ===="
cat $RESULTS_FILE
