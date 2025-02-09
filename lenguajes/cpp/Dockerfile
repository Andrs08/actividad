# Usa la imagen base de Debian
FROM debian:latest

# Instala GCC, Make y Boost
RUN apt-get update && apt-get install -y \
    g++ \
    make \
    libboost-all-dev

# Crea el directorio de trabajo
WORKDIR /app

# Copia el código fuente al contenedor
COPY main.cpp /main.cpp

RUN g++ -o /main /main.cpp

# Ejecuta el código
CMD ["sh", "-c", "/main"]






 
