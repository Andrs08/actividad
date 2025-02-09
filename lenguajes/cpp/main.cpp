#include <iostream>
#include <fstream>
#include <chrono>
#include <vector>
#include <boost/multiprecision/cpp_int.hpp>

using namespace std;
using namespace boost::multiprecision;
using namespace std::chrono;

cpp_int fibonacciSum(int n) {
    vector<cpp_int> fib(n);
    fib[0] = 0;
    fib[1] = 1;
    cpp_int sum = fib[0] + fib[1];

    for (int i = 2; i < n; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
        sum += fib[i];
    }
    
    return sum;
}

int main() {
    auto start = high_resolution_clock::now();
    cpp_int resultado = fibonacciSum(5000);
    auto stop = high_resolution_clock::now();

    double tiempoMs = duration<double, milli>(stop - start).count();

    // Guardar resultado en resultado.txt
    ofstream file("resultado.txt");
    if (file.is_open()) {
        file << "Resultado: " << resultado << endl;
        file << "Tiempo: " << tiempoMs << " ms" << endl;
        file.close();
    }

    // Imprimir en pantalla
    cout << "Tiempo: " << tiempoMs << " ms" << endl;

    return 0;
}
