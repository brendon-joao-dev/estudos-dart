// O - Faça um programa que leia três valores inteiros e diferentes e mostre-os em ordem decrescente.

// Importação de módulos:
import "dart:io";

void main() {
  System sistema = System(
    algoritmo: () {
      Entrada entrada = Entrada();
      int a = 0;
      int b = 0;
      int c = 0;
      List<int> decrescente = [];

      a = entrada.entrarInt(
        mensagemEntrada: "Entre com o valor de A: ",
        mensagemInvalida: "Por favor entre com um número inteiro!",
      );

      b = entrada.entrarInt(
        mensagemEntrada: "Entre com o valor de B: ",
        mensagemInvalida: "Por favor entre com um número inteiro!",
      );

      c = entrada.entrarInt(
        mensagemEntrada: "Entre com o valor de C: ",
        mensagemInvalida: "Por favor entre com um número inteiro!",
      );

      FiltroModificador filtro = FiltroModificador(a: a, b: b, c: c);

      decrescente = filtro.ordenarDecrescente();

      print("A, B e C em ordem decrescente:");
      decrescente.forEach((elemento) => stdout.write("$elemento, "));
      print("");
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
// - Métodos: entrarInt()
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
}

// Classe FiltroModificador:
// - Atributos: int a, int b, int c
// - Métodos: ordenarDecrescente()
class FiltroModificador {
  int a;
  int b;
  int c;

  FiltroModificador({this.a = 0, this.b = 0, this.c = 0});

  List<int> ordenarDecrescente() {
    List<int> numeros = [a, b, c];
    numeros.sort();
    numeros = numeros.reversed.toList();
    return numeros;
  }
}
