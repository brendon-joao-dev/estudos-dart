// E - Faça um programa que recebe um número inteiro e mostre o sucessor e antecessor.

// Importação de módulos:
import "dart:io";

void main() {
  System sistema = System(
    algoritmo: () {
      Entrada entrada = Entrada();
      int numero = 0;
      List<int> antecessorSucessor = [];

      numero = entrada.entrarInt(
        mensagemEntrada: "Entre com um número inteiro: ",
        mensagemInvalida: "Por favor entre com um número inteiro!",
      );

      Calculadora calculadora = Calculadora(n1: numero);

      antecessorSucessor = calculadora.antecessorSucessor();

      print("O antecessor de $numero é ${antecessorSucessor[0]}");
      print("O sucessor de $numero é ${antecessorSucessor[1]}");
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

// Classe Calculadora:
// - Métodos: antecessorSucessor()
class Calculadora {
  int n1;

  Calculadora({this.n1 = 0});

  List<int> antecessorSucessor() {
    int antecessor = n1 - 1;
    int sucessor = n1 + 1;
    return [antecessor, sucessor];
  }
}
