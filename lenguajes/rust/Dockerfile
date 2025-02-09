# Usa la imagen oficial de Rust
FROM rust:latest

# Instala las herramientas necesarias
RUN apt-get update && apt-get install -y libgmp-dev && cargo install rust-script

# Copia el código fuente
COPY main.rs /main.rs

# Define el directorio de trabajo
WORKDIR /app

# Ejecuta el código en Rust con `rust-script`
CMD ["sh", "-c", "rust-script /main.rs && cp resultado.txt /app/"]


 
