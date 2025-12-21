// Q - Faça um programa para conversão de temperaturas (C => F  e F ⇒ C)

// Importação de módulos:
import "dart:io";

void main() {
  System sistema = System(
    algoritmo: () {
      Entrada entrada = Entrada();
      double temperatura = 0;
      int opcao = 0;
      double resultado = 0;

      temperatura = entrada.entrarDouble(
        mensagemEntrada: "Entre com uma temperatura(ºC ou ºF): ",
        mensagemInvalida: "Por favor entre com uma temperatura númerica!",
      );

      Fisica conversor = Fisica(temperatura: temperatura);

      while (true) {
        opcao = entrada.entrarInt(
          mensagemEntrada:
              "Entre com 1 para converter para ºC e 2 para converter para ºF: ",
          mensagemInvalida: "Por favor entre com um valor númerico!",
        );

        if (opcao == 1) {
          resultado = conversor.converterCelcius();
          print("A temperatura $temperaturaºF é $resultadoºC");
          break;
        } else if (opcao == 2) {
          conversor.converterFahnheit();
          print("A temperatura $temperaturaºC é $resultadoºF");
          break;
        } else {
          print("Por favor entre com uma opção válida!");
          print("");
          continue;
        }
      }

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
// - Métodos: entrarInt(), entrarDouble()
class Entrada {
  int entrarInt({
    String mensagemEntrada = "Entre com um valor: ",
    String mensagemInvalida = "Por favor entre com algum valor!",
    bool positivo = false,
  }) {
    while (true) {
      stdout.write(mensagemEntrada);
      String entrada = stdin.readLineSync() ?? "";
      print("");

      if (positivo) {
        if (int.tryParse(entrada) != null && !int.parse(entrada).isNegative) {
          return int.parse(entrada);
        } else {
          print(mensagemInvalida);
          print("");
          continue;
        }
      } else {
        if (int.tryParse(entrada) != null) {
          return int.parse(entrada);
        } else {
          print(mensagemInvalida);
          print("");
          continue;
        }
      }
    }
  }

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

// Classe Fisica:
// - Atributos: double temperatura
// - Métodos: converterCelcius(), converterFahnheit()
class Fisica {
  double temperatura;

  Fisica({this.temperatura = 0});

  double converterCelcius() => ((temperatura * 9) / 5) + 32;

  double converterFahnheit() => ((temperatura - 32) * 5) / 9;
}
