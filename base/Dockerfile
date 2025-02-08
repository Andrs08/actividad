 # Usa la imagen oficial de Docker-in-Docker
FROM docker:dind  

# Instala herramientas necesarias
RUN apk add --no-cache git bash  

# Copia el script de ejecución dentro del contenedor
COPY run_benchmark.sh /run_benchmark.sh  

# Da permisos de ejecución al script
RUN chmod +x /run_benchmark.sh  

# Punto de entrada
ENTRYPOINT ["/run_benchmark.sh"]

