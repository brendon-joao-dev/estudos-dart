// L - Faça um algoritmo que leia dois valores inteiros A e B. Se os valores forem iguais deverá somar os dois, caso contrário multiplique A por B.
// Ao final de qualquer um dos cálculos deve-se atribuir o resultado para uma variável C e mostrar seu conteúdo na tela.

// Importação de módulos:
import "dart:io";

void main() {
  System sistema = System(
    algoritmo: () {
      Entrada entrada = Entrada();
      int a = 0;
      int b = 0;

      a = entrada.entrarInt(
        mensagemEntrada: "Entre com o valor de A: ",
        mensagemInvalida: "Por favor entre com um número inteiro!",
      );

      b = entrada.entrarInt(
        mensagemEntrada: "Entre com o valor de B: ",
        mensagemInvalida: "Por favor entre com um número inteiro!",
      );

      FiltroModificador filtro = FiltroModificador(a: a, b: b);

      filtro.verificarIguaisDiferentes();
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
// - Atributos: int a, int b
// - Métodos: verificarIguaisDiferentes()
class FiltroModificador {
  int a;
  int b;

  FiltroModificador({this.a = 0, this.b = 0});

  void verificarIguaisDiferentes() {
    if (a == b) {
      int c = a + b;
      print("A soma de $a e $b é $c");
    } else {
      int c = a * b;
      print("A multiplicação de $a e $b é $c");
    }
    print("");
  }
}
