//! ```cargo
//! [dependencies]
//! num-bigint = "0.4"
//! num-traits = "0.2"
//! ```

use std::fs::File;
use std::io::Write;
use std::time::Instant;
use num_bigint::BigUint;
use num_traits::{Zero, One};

fn fibonacci_sum(n: usize) -> BigUint {
    let mut a = BigUint::zero();
    let mut b = BigUint::one();
    let mut sum = BigUint::zero();

    for _ in 0..n {
        sum += &a;
        let temp = a.clone(); // Usamos clone() para evitar mover `a`
        a = b.clone();        // Clonamos `b` para no moverlo
        b += temp;            // `b` sigue en su lugar y se modifica correctamente
    }

    sum
}

fn main() {
    let start = Instant::now();
    let resultado = fibonacci_sum(5000);
    let duration = start.elapsed();

    let tiempo_ms = duration.as_secs_f64() * 1000.0;

    // Guardar resultado en resultado.txt
    let mut file = File::create("resultado.txt").expect("No se pudo crear el archivo");
    writeln!(file, "Resultado: {}", resultado).expect("No se pudo escribir en el archivo");
    writeln!(file, "Tiempo: {:.2} ms", tiempo_ms).expect("No se pudo escribir en el archivo");

    // Imprimir resultado y tiempo en pantalla
    println!("Tiempo: {:.2} ms", tiempo_ms);
}

 
