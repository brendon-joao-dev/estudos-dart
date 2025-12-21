// P - Faça um programa para calcular o IMC COMPLETO de uma pessoa.

// Importação de módulos:
import "dart:io";
import "dart:math";

void main() {
  System sistema = System(
    algoritmo: () {
      Entrada entrada = Entrada();
      double altura = 0;
      double peso = 0;
      double imc = 0;

      altura = entrada.entrarDouble(
        mensagemEntrada: "Entre com a altura da pessoa: ",
        mensagemInvalida: "Por favor entre com uma altura númerica positiva!",
        positivo: true,
      );

      peso = entrada.entrarDouble(
        mensagemEntrada: "Entre com o peso da pessoa: ",
        mensagemInvalida: "Por favor entre com um peso númerico positivo!",
        positivo: true,
      );

      Saude agenteSaude = Saude(altura: altura, peso: peso);

      imc = agenteSaude.calcularIMC();

      print("O índice de massa corporal (IMC)");
      print("de uma pessoa com altura ${altura}m");
      print("de peso ${peso}kg é $imc");
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

// Classe Saude:
// - Atributos: double altura, double peso
// - Métodos: calcularIMC()
class Saude {
  double altura;
  double peso;

  Saude({this.altura = 0, this.peso = 0});

  double calcularIMC() => peso / pow(altura, 2);
}
