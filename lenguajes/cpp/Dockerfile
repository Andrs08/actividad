# Primera etapa: Compilación
FROM golang:latest AS builder

# Crea el directorio de trabajo
WORKDIR /app

# Copia el código fuente al contenedor
COPY main.go .

# Inicializa un módulo de Go
RUN go mod init app && go mod tidy

# Compila el código y genera el ejecutable
RUN go build -o main main.go

# Segunda etapa: Contenedor mínimo para ejecutar el binario
FROM debian:latest

# Crea el directorio de trabajo
WORKDIR /app

# Copia el binario compilado desde la etapa anterior
COPY --from=builder /app/main /app/main

# Ejecuta el binario
CMD ["/app/main"]







 
