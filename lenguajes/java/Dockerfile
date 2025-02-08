# Usa la imagen oficial de OpenJDK
FROM openjdk:11-jdk-slim

# Copia el código fuente al contenedor
COPY Main.java /Main.java

# Compila el código
RUN javac /Main.java

# Define el directorio de trabajo
WORKDIR /app

# Ejecuta el código en Java
CMD ["sh", "-c", "java -cp / Main"]

 
