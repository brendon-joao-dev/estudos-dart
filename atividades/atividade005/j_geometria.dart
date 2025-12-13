// J - Faça um programa com entrada de dados para calcular a área de 4 objetos.

// Importação de módulos:
import "dart:io";
import "dart:math";

void main() {
  System sistema = System(
    algoritmo: () {
      Entrada entrada = Entrada();
      int escolha = 0;

      while (true) {
        print("1 - Quadrado");
        print("2 - Retângulo");
        print("3 - Triângulo");
        print("4 - Circulo");
        print("");

        escolha = entrada.entrarInt(
          mensagemEntrada: "Escolha uma opção: ",
          mensagemInvalida: "Por favor entre com um número inteiro!",
          positivo: true,
        );

        if (escolha == 1) {
          double lado = 0;
          double area = 0;

          lado = entrada.entrarDouble(
            mensagemEntrada: "Entre com a medida do lado do quadrado: ",
            mensagemInvalida:
                "Por favor entre com uma medida númerica e positiva!",
            positivo: true,
          );

          Geometria quadrado = Geometria(lado: lado);

          area = quadrado.areaQuadrado();

          print("A área do quadrado de lado $lado é $area");
          print("");
          break;
        } else if (escolha == 2) {
          double base = 0;
          double altura = 0;
          double area = 0;

          base = entrada.entrarDouble(
            mensagemEntrada: "Entre com a medida da base do retângulo: ",
            mensagemInvalida:
                "Por favor entre com uma base númerica e positiva!",
            positivo: true,
          );

          altura = entrada.entrarDouble(
            mensagemEntrada: "Entre com a medida da altura do retângulo: ",
            mensagemInvalida:
                "Por favor entre com uma altura númerica e positiva!",
            positivo: true,
          );

          Geometria retangulo = Geometria(base: base, altura: altura);

          area = retangulo.areaRetangulo();

          print("A área do retângulo de base $base e altura $altura é $area");
          print("");
          break;
        } else if (escolha == 3) {
          double base = 0;
          double altura = 0;
          double area = 0;

          base = entrada.entrarDouble(
            mensagemEntrada: "Entre com a medida da base do triângulo: ",
            mensagemInvalida:
                "Por favor entre com uma base númerica e positiva!",
            positivo: true,
          );

          altura = entrada.entrarDouble(
            mensagemEntrada: "Entre com a medida da altura do triângulo: ",
            mensagemInvalida:
                "Por favor entre com uma altura númerica e positiva!",
            positivo: true,
          );

          Geometria triangulo = Geometria(base: base, altura: altura);

          area = triangulo.areaTriangulo();

          print("A área do triângulo de base $base e altura $altura é $area");
          print("");
          break;
        } else if (escolha == 4) {
          double raio = 0;
          double area = 0;

          raio = entrada.entrarDouble(
            mensagemEntrada: "Entre com o raio do circulo: ",
            mensagemInvalida:
                "Por favor entre com um raio númerico e positivo!",
            positivo: true,
          );

          Geometria circulo = Geometria(raio: raio);

          area = circulo.areaCirculo();

          print("A área do circulo de raio $raio é $area");
          print("");
          break;
        } else {
          print("por favor escolha uma opção válida!");
          print("");
          continue;
        }
      }
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

// Classe Geometria:
// - Atributos: double lado, double base, double altura, double raio
// - Métodos: areaQuadrado(), areaRetangulo(), areaTriangulo(), areaCirculo()
class Geometria {
  double lado;
  double base;
  double altura;
  double raio;

  Geometria({this.lado = 0, this.base = 0, this.altura = 0, this.raio = 0});

  double areaQuadrado() {
    double area = pow(lado, 2).toDouble();
    return area;
  }

  double areaRetangulo() {
    double area = base * altura;
    return area;
  }

  double areaTriangulo() {
    double area = (base * altura) / 2;
    return area;
  }

  double areaCirculo() {
    double area = pi * pow(raio, 2).toDouble();
    return area;
  }
}
