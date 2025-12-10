// A - Faça um programa que peça 2 valores. Calcule e imprima  a soma, o produto,
// a subtração, a divisão, o resto da divisão e a divisão inteira.

// Importação de módulos:
import "dart:io";

void main() {
  System sistema = System(
    algoritmo: () {
      Entrada entrada = Entrada();
      double n1 = entrada.entrarDouble(
        mensagemEntrada: "Entre com um número: ",
      );
      double n2 = entrada.entrarDouble(
        mensagemEntrada: "Entre com um número: ",
      );

      Calculadora calculadora = Calculadora(n1: n1, n2: n2);

      double soma = calculadora.somar();

      double subtracao = calculadora.subtrair();

      double multiplicacao = calculadora.multiplicar();

      double divisao = calculadora.dividir();

      double restoDivisao = calculadora.restoDivisao();

      double divisaoInteira = calculadora.divisaoInteira();

      print("${calculadora.n1} + ${calculadora.n2} = $soma");
      print("${calculadora.n1} - ${calculadora.n2} = $subtracao");
      print("${calculadora.n1} * ${calculadora.n2} = $multiplicacao");
      print("${calculadora.n1} / ${calculadora.n2} = $divisao");
      print("${calculadora.n1} % ${calculadora.n2} = $restoDivisao");
      print("${calculadora.n1} ~/ ${calculadora.n2} = $divisaoInteira");
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
// - Métodos: somar(), subtrair(), multiplicar(), dividir(), restoDivisao(), divisaoInteira()
class Calculadora {
  double n1;
  double n2;

  Calculadora({this.n1 = 0, this.n2 = 0});

  double somar() {
    double soma = n1 + n2;
    return soma;
  }

  double subtrair() {
    double subtracao = n1 - n2;
    return subtracao;
  }

  double multiplicar() {
    double multiplicacao = n1 * n2;
    return multiplicacao;
  }

  double dividir() {
    if (n2 == 0) {
      n2 = 1;
    }

    double divisao = n1 / n2;
    return divisao;
  }

  double restoDivisao() {
    if (n2 == 0) {
      n2 = 1;
    }

    double restoDivisao = n1 % n2;
    return restoDivisao;
  }

  double divisaoInteira() {
    if (n2 == 0) {
      n2 = 1;
    }

    double divisaoInteira = (n1 ~/ n2).toDouble();
    return divisaoInteira;
  }
}
