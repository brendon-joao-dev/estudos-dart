// D - Faça um programa que receba e divida 2 números. A saída da divisão precisará ser formatada com 4 casas decimais.

// Importação de módulos:
import "dart:io";

void main() {
  System sistema = System(
    algoritmo: () {
      Entrada entrada = Entrada();
      double n1 = 0;
      double n2 = 0;
      double resultado = 0;

      n1 = entrada.entrarDouble(
        mensagemEntrada: "Entre com o 1º valor: ",
        mensagemInvalida: "Por favor entre com um número!",
      );

      n2 = entrada.entrarDouble(
        mensagemEntrada: "Entre com o 2º valor: ",
        mensagemInvalida: "Por favor entre com um número!",
      );

      Calculadora calculadora = Calculadora(n1: n1, n2: n2);

      resultado = calculadora.dividir();

      print("A divisão de $n1 por $n2 é ${resultado.toStringAsFixed(4)}");
      print("");
    },
  );

  sistema.rodarPrograma();
}

// Classe System:
// - Atributos: bool rodando
// - Métodos: rodarPrograma(), continuarPrograma()
class System {
  // Atributos:
  bool rodando; // Define se o programa deve rodar ou não chamar rodarPrograma()
  Function algoritmo; // Função que deve ser executada a cada ciclo do programa

  // Construtor:
  System({required this.algoritmo, this.rodando = false});

  // Método que executa a função algoritmo() de acordo com a flag rodando
  void rodarPrograma() {
    this.rodando = true;
    while (rodando) {
      algoritmo();
      continuarPrograma();
    }
    this.rodando = false;
  }

  // Método que pergunta ao usuário se quer continuar o programa, retornando true ou false
  void continuarPrograma() {
    String continuar = "";
    while (true) {
      stdout.write("Deseja repetir o programa? (s/n): ");
      continuar = stdin.readLineSync()!.toLowerCase().trim();
      print("");

      if (continuar == "s") {
        rodando = true;
        break;
      } else if (continuar == "n") {
        rodando = false;
        break;
      } else {
        print("Por favor digite 's' para sim ou 'n' para não!\n");
        continue;
      }
    }
  }
}

// Classe Entrada:
// - Métodos: entrarDouble()
class Entrada {
  double entrarDouble({
    String mensagemEntrada = "Entre com um valor: ",
    String mensagemInvalida = "Por favor entre com algum valor!",
    bool positivo = false,
  }) {
    while (true) {
      stdout.write(mensagemEntrada);
      String entrada = stdin.readLineSync() ?? "";
      print("");

      if (positivo) {
        if (double.tryParse(entrada) != null &&
            !double.parse(entrada).isNegative) {
          return double.parse(entrada);
        } else {
          print(mensagemInvalida);
          print("");
          continue;
        }
      } else {
        if (double.tryParse(entrada) != null) {
          return double.parse(entrada);
        } else {
          print(mensagemInvalida);
          print("");
          continue;
        }
      }
    }
  }
}

// Classe Calculadora:
// - Atributos: double n1, double n2
// - Métodos: dividir()
class Calculadora {
  double n1;
  double n2;

  Calculadora({this.n1 = 0, this.n2 = 0});

  double dividir() {
    if (n2 == 0) {
      n2 = 1;
    }

    double divisao = n1 / n2;
    return divisao;
  }
}
