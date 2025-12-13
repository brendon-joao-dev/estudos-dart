// I - Faça um programa que receba um valor em reais, depois calcule quantos euros,
// dólares e wons dariam para comprar com esse valor.

// Importação de módulos:
import "dart:io";

void main() {
  System sistema = System(
    algoritmo: () {
      Entrada entrada = Entrada();
      double reais = 0;
      double euros = 0;
      double dolares = 0;
      double wons = 0;

      reais = entrada.entrarDouble(
        mensagemEntrada: "Entre com um valor em reais: ",
        mensagemInvalida: "Por favor entre com um valor númerico!",
        positivo: true,
      );

      Moeda conversor = Moeda(valorReais: reais);

      euros = conversor.converterEuros();

      dolares = conversor.converterDolares();

      wons = conversor.converterWons();

      print("O valor em reais $reais corresponde à: ");
      print("Dólares: $dolares");
      print("Euros: $euros");
      print("Wons: $wons");
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

// Classe Moedas:
// - Atributos: double valorReais
// - Métodos: converterEuros(), converterWons(), converterDolares()
class Moeda {
  double valorReais;

  Moeda({this.valorReais = 0});

  double converterEuros() => valorReais * 0.16;

  double converterWons() => valorReais * 270.45;

  double converterDolares() => valorReais * 0.18;
}
