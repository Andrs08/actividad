# Usa la imagen oficial de Node.js
FROM node:latest

# Copia el código fuente al contenedor
COPY main.js /main.js

# Define el directorio de trabajo
WORKDIR /app

# Ejecuta el código en Node.js
CMD ["sh", "-c", "node /main.js && cp resultado.txt /app/"]
 
