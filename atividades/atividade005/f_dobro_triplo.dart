// F- Faça um programa que receba um número qualquer e calcule o dobro e o triplo desse número.

// Importação de módulos:
import "dart:io";

void main() {
  System sistema = System(
    algoritmo: () {
      Entrada entrada = Entrada();
      double numero = 0;
      List<double> dobroTriplo = [];

      numero = entrada.entrarDouble(
        mensagemEntrada: "Entre com um número: ",
        mensagemInvalida: "Por favor entre com um número!",
      );

      Calculadora calculadora = Calculadora(n1: numero);

      dobroTriplo = calculadora.dobrarTriplicar();

      print("O dobro de $numero é ${dobroTriplo[0]}");
      print("O triplo de $numero é ${dobroTriplo[1]}");
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
// - Atributos: int n1
// - Métodos: dobrarTriplicar()
class Calculadora {
  double n1;

  Calculadora({this.n1 = 0});

  List<double> dobrarTriplicar() {
    double dobro = n1 * 2;
    double triplo = n1 * 3;
    return [dobro, triplo];
  }
}
