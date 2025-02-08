import time

def fibonacci_sum(n):
    a, b = 0, 1
    suma = 0
    for _ in range(n):
        suma += a
        a, b = b, a + b
    return suma

inicio = time.time()
resultado = fibonacci_sum(5000)
fin = time.time()

# Guardar el resultado en resultado.txt
with open("resultado.txt", "w") as f:
    f.write(f"Resultado: {resultado}\n")
    f.write(f"Tiempo: {((fin - inicio) * 1000):.2f} ms\n")

# Imprimir el resultado y el tiempo en pantalla
print(f"Tiempo: {((fin - inicio) * 1000):.2f} ms")
 
