// Importação de módulos:
import "dart:io";
import "dart:math";

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
// - Métodos: entrarInt(), entrarDouble(), entrarString(), entrarDados()
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

  String entrarString({
    String mensagemEntrada = "Entre com um valor: ",
    String mensagemInvalida = "Por favor entre com algum valor!",
    bool positivo = false,
  }) {
    while (true) {
      stdout.write(mensagemEntrada);
      String entrada = stdin.readLineSync() ?? "";
      print("");

      if (!entrada.trim().isEmpty) {
        return entrada;
      } else {
        print(mensagemInvalida);
        print("");
        continue;
      }
    }
  }

  // Método com Generics para permitir entrada e validação de diferentes tipos de dados, retornando o valor inserido pelo usuário
  T entrarDados<T>({
    String mensagemEntrada = "Entre com um valor: ",
    String mensagemInvalida = "Por favor entre com algum valor!",
    bool positivo = false,
  }) {
    while (true) {
      stdout.write(mensagemEntrada);
      String entrada = stdin.readLineSync() ?? "";
      print("");

      if (T == String) {
        if (!entrada.trim().isEmpty) {
          return entrada as T;
        } else {
          print(mensagemInvalida);
          print("");
          continue;
        }
      }

      if (T == double) {
        if (positivo) {
          if (double.tryParse(entrada) != null &&
              !double.parse(entrada).isNegative) {
            return double.parse(entrada) as T;
          } else {
            print(mensagemInvalida);
            print("");
            continue;
          }
        } else {
          if (double.tryParse(entrada) != null) {
            return double.parse(entrada) as T;
          } else {
            print(mensagemInvalida);
            print("");
            continue;
          }
        }
      }

      if (T == int) {
        if (positivo) {
          if (int.tryParse(entrada) != null && !int.parse(entrada).isNegative) {
            return int.parse(entrada) as T;
          } else {
            print(mensagemInvalida);
            print("");
            continue;
          }
        } else {
          if (int.tryParse(entrada) != null) {
            return int.tryParse(entrada) as T;
          } else {
            print(mensagemInvalida);
            print("");
            continue;
          }
        }
      }
    }
  }
}

// Classe Calculadora:
// - Métodos: somar(), subtrair(), multiplicar(), dividir(), restoDivisao(), divisaoInteira(), media(), antecessorSucessor(), dobrarTriplicar(), tabuada()
class Calculadora {
  double n1;
  double n2;
  List<double> valores;

  Calculadora({this.n1 = 0, this.n2 = 0, required this.valores});

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

  double media() {
    double soma = valores.reduce((soma, n) => soma += n);
    double media = soma / valores.length;
    return media;
  }

  List<double> antecessorSucessor() {
    double antecessor = n1 - 1;
    double sucessor = n1 + 1;
    return [antecessor, sucessor];
  }

  List<double> dobrarTriplicar() {
    double dobro = n1 * 2;
    double triplo = n1 * 3;
    return [dobro, triplo];
  }

  void tabuada() {
    for (int i = 1; i <= 10; i++) {
      print("$n1 X $i = ${n1 * i}");
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

// Classe Datas:
// - Atributos: int ano
// - Métodos: calcularIdade()
class Datas {
  late int ano;
  late int anoAtual;

  Datas({int ano = 0, int anoAtual = 0}) {
    this.ano = 0;
    this.anoAtual = DateTime.now().year.toInt();
  }

  int calcularIdade() => anoAtual - ano;
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

// Classe ConversorMedidas:
// - Atributos: double medida
// - Métodos: converterParaCentimetros(), converterParaQuilometros()
class ConversorMedidas {
  double medida;

  ConversorMedidas({this.medida = 0});

  double converterParaCentimetros() => medida * 100;

  double converterParaQuilometros() => medida / 1000;
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

// Classe Fisica:
// - Atributos: double temperatura
// - Métodos: converterCelcius(), converterFahnheit()
class Fisica {
  double temperatura;

  Fisica({this.temperatura = 0});

  double converterCelcius() => ((temperatura * 9) / 5) + 32;

  double converterFahnheit() => ((temperatura - 32) * 5) / 9;
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

// Classe FiltroModificador:
// - Atributos: int a, int b, int c
// - Métodos: verificarIguaisDiferentes(), verificarPositivoNegativo(), verificarParImpar(), ordenarDecrescente()
class FiltroModificador {
  int a;
  int b;
  int c;

  FiltroModificador({this.a = 0, this.b = 0, this.c = 0});

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

  void verificarPositivoNegativo() {
    if (!a.isNegative) {
      int c = a * 2;
      print("O dobro de $a é $c");
    } else {
      int c = a * 3;
      print("O triplo de $a é $c");
    }
    print("");
  }

  void verificarParImpar() {
    if (a % 2 == 0) {
      int c = a + 5;
      print("$a + 5 = $c");
    } else {
      int c = a + 8;
      print("$a + 8 = $c");
    }
    print("");
  }

  List<int> ordenarDecrescente() {
    List<int> numeros = [a, b, c];
    numeros.sort();
    numeros = numeros.reversed.toList();
    return numeros;
  }
}

// Classe Verificador:
// - Atributos: int numero
// - Métodos: verificarPar(), verificarImpar()
class Verificador {
  int numero;

  Verificador({this.numero = 0});

  bool verificarPar() {
    if (numero % 2 == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool verificarImpar() {
    if (numero % 2 != 0) {
      return true;
    } else {
      return false;
    }
  }
}
