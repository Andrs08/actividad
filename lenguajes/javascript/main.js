const fs = require("fs");

// Función para calcular la suma de los primeros 5000 números de Fibonacci
function fibonacciSum(n) {
    let a = 0n, b = 1n, sum = 0n;
    for (let i = 0; i < n; i++) {
        sum += a;
        [a, b] = [b, a + b]; // Intercambio de valores
    }
    return sum;
}

// Medir tiempo de ejecución
const start = process.hrtime.bigint();
const resultado = fibonacciSum(5000);
const end = process.hrtime.bigint();

// Calcular tiempo en milisegundos
const tiempoMs = Number(end - start) / 1e6;

// Guardar resultado en resultado.txt
fs.writeFileSync("resultado.txt", `Resultado: ${resultado}\nTiempo: ${tiempoMs.toFixed(2)} ms\n`);

// Imprimir resultado y tiempo en pantalla
console.log(`Resultado: ${resultado}`);
console.log(`Tiempo: ${tiempoMs.toFixed(2)} ms`);
 
