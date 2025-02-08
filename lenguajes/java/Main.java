import java.io.FileWriter;
import java.io.IOException;
import java.math.BigInteger;

public class Main {
    public static void main(String[] args) {
        long start = System.nanoTime();
        BigInteger resultado = fibonacciSum(5000);
        long end = System.nanoTime();

        double tiempoMs = (end - start) / 1_000_000.0;

        // Guardar resultado en resultado.txt
        try (FileWriter writer = new FileWriter("resultado.txt")) {
            writer.write("Resultado: " + resultado + "\n");
            writer.write("Tiempo: " + String.format("%.2f", tiempoMs) + " ms\n");
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Imprimir resultado y tiempo en pantalla
        System.out.printf("Tiempo: %.2f ms%n", tiempoMs);
    }

    public static BigInteger fibonacciSum(int n) {
        BigInteger a = BigInteger.ZERO, b = BigInteger.ONE, sum = BigInteger.ZERO;
        for (int i = 0; i < n; i++) {
            sum = sum.add(a);
            BigInteger temp = a;
            a = b;
            b = temp.add(b);
        }
        return sum;
    }
}

 
