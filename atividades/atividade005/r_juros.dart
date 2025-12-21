// R - Faça um programa para calcular juros.

// Importação de módulos:
import "dart:io";
import "dart:math";

void main() {
  System sistema = System(
    algoritmo: () {
      Entrada entrada = Entrada();
      double investimento = 0;
      double tempo = 0;
      double taxa = 0;

      investimento = entrada.entrarDouble(
        mensagemEntrada: "Entre com o valor do investimento inicial: ",
        mensagemInvalida: "Por favor entre com um valor númerico positivo!",
        positivo: true,
      );

      tempo = entrada.entrarDouble(
        mensagemEntrada:
            "Entre com o tempo que o dinheiro será investido (meses): ",
        mensagemInvalida: "Por favor entre com um valor númerico positivo!",
        positivo: true,
      );

      taxa = entrada.entrarDouble(
        mensagemEntrada: "Entre com a taxa de juros (%): ",
        mensagemInvalida: "Por favor entre com um valor númerico!",
      );

      Juros contador = Juros(
        investimento: investimento,
        taxa: taxa,
        tempo: tempo,
      );

      contador.calcularJurosSimples();

      print("Em regime de Juros Simples: ");
      print("Investimento inicial: ${contador.investimento}R\$");
      print("Tempo de investimento: ${contador.tempo} meses");
      print("Taxa de juros: ${contador.taxa}%");
      print("Montante final: ${contador.montante.toStringAsFixed(2)}R\$");
      print("");

      contador.calcularJurosCompostos();

      print("Em regime de Juros Compostos: ");
      print("Investimento inicial: ${contador.investimento}R\$");
      print("Tempo de investimento: ${contador.tempo} meses");
      print("Taxa de juros: ${contador.taxa}%");
      print("Montante final: ${contador.montante.toStringAsFixed(2)}R\$");
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

// Classe Juros:
// - Atributos: double montante, double investimento, double tempo, double taxa
// - Métodos: calcularJurosSimples(), calcularJurosCompostos()
class Juros {
  late double montante;
  double investimento;
  double tempo;
  double taxa;

  Juros({this.investimento = 0, this.tempo = 0, this.taxa = 0});

  void calcularJurosSimples() {
    this.montante = investimento + (investimento * (taxa / 100) * tempo);
  }

  void calcularJurosCompostos() {
    this.montante = investimento * pow((1 + (taxa / 100)), tempo);
  }
}
