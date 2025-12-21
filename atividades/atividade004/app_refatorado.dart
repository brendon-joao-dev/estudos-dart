// Importação de bibliotecas:
import "dart:io";

// Estrutura de dados:
// - List: carrinho
//      - Map: informações do produto
//        - "nome": String - nome do produto
//        - "preco": double - preço unitário daquele produto
//        - "quantidade": int - quantidade daquele produto
//        - "subtotal": double - subtotal atual daquele produto
List<Map<String, dynamic>> carrinho = [];

void main() {
  while (true) {
    bool flag = true;
    exibirMenu();

    int opcao = entrada<int>(
      mensagemEntrada: "Digite o número da opção desejada: ",
      mensagemInvalida: "Por favor digite um valor válido como opção!",
      mensagemNegativo: "Por favor digite um valor válido como opção!",
      positivo: true,
    );
    decoracao();

    if (opcao == 0) {
      print("Obrigado por usar nosso sistem!");
      print("Saindo do sistema...");
      decoracao();
      break;
    } else if (opcao == 1) {
      print("Adição de produtos");
      decoracao();
      while (flag) {
        String nome = "";
        double preco = 0.0;
        int quantidade = 0;

        nome = entrada<String>(
          mensagemEntrada: "Digite o nome do produto: ",
          mensagemInvalida: "Por favor digite algo como nome do produto!",
        );

        preco = entrada<double>(
          mensagemEntrada: "Digite o preço do produto: ",
          mensagemInvalida: "Por favor digite um número decimal como preço!",
          mensagemNegativo:
              "Por favor digite um preço positivo diferente de zero!",
          positivo: true,
        );

        quantidade = entrada<int>(
          mensagemEntrada: "Digite a quantidade do produto: ",
          mensagemInvalida:
              "Por favor digite um número inteiro como quantidade!",
          mensagemNegativo:
              "Por favor digite uma quantidade positivo diferente de zero!",
          positivo: true,
        );

        cadastrarProduto(
          carrinho: carrinho,
          nome: nome,
          preco: preco,
          quantidade: quantidade,
        );

        flag = perguntaContinuar("Deseja adicionar outro produto? (s/n): ");
      }
    } else if (opcao == 2) {
      print("Visualização de produtos");
      print("");
      print("=" * 70);

      exibirCarrinho();
    } else if (opcao == 3) {
      print("Modificação de produtos");
      print("");
      print("=" * 70);

      while (flag) {
        int id = 0;
        String novoNome;
        double novoPreco;
        int novaQuantidade = 0;
        Map<String, dynamic> produtoAlterando;

        while (true) {
          exibirCarrinho();

          id = entrada<int>(
            mensagemEntrada: "Digite o ID do produto que quer alterar: ",
            mensagemInvalida: "Por favor digite um número inteiro como ID!",
            mensagemNegativo:
                "Por favor digite um ID positivo diferente de zero!",
            positivo: true,
          );

          if (id > carrinho.length + 1 && id != 0) {
            print("Por favor digite um ID dentro do intervalo dos produtos!");
            pressioneContinuar();
            decoracao();
          } else {
            break;
          }
        }

        produtoAlterando = carrinho.removeAt(id - 1);

        print(
          "ID: ${id} Produto: ${produtoAlterando["nome"]} Preço: ${produtoAlterando["preco"]} Quantidade: ${produtoAlterando["quantidade"]} Subtotal: ${produtoAlterando["subtotal"]}",
        );
        decoracao();

        novoNome = entrada<String>(
          mensagemEntrada:
              "Digite o novo nome do produto ${produtoAlterando["nome"]}: ",
          mensagemInvalida: "Por favor digite algo como nome do produto!",
        );

        novoPreco = entrada<double>(
          mensagemEntrada:
              "Digite o novo preço do produto ${produtoAlterando["nome"]}: ",
          mensagemInvalida: "Por favor digite um número decimal como preço!",
          mensagemNegativo:
              "Por favor digite um preço positivo diferente de zero!",
          positivo: true,
        );

        novaQuantidade = entrada<int>(
          mensagemEntrada:
              "Digite a nova quantidade do produto ${produtoAlterando["nome"]}: ",
          mensagemInvalida:
              "Por favor digite um número inteiro como quantidade!",
          mensagemNegativo:
              "Por favor digite uma quantidade positivo diferente de zero!",
          positivo: true,
        );

        modificarProduto(
          carrinho: carrinho,
          id: id,
          novoNome: novoNome,
          novoPreco: novoPreco,
          novaQuantidade: novaQuantidade,
        );

        flag = perguntaContinuar("Deseja modificar outro produto? (s/n): ");
      }
    } else if (opcao == 4) {
      print("Remoção de produtos");
      print("");
      print("=" * 70);

      while (flag) {
        int? id = 0;

        while (true) {
          exibirCarrinho();

          id = entrada<int>(
            mensagemEntrada: "Digite o ID do produto que quer remover: ",
            mensagemInvalida: "Por favor digite um número inteiro como ID!",
            mensagemNegativo:
                "Por favor digite um ID positivo diferente de zero!",
            positivo: true,
          );

          if (id > carrinho.length + 1 && id != 0) {
            print("Por favor digite um ID dentro do intervalo dos produtos!");
            pressioneContinuar();
            decoracao();
          } else {
            break;
          }
        }

        removerProduto(carrinho: carrinho, id: id);

        flag = perguntaContinuar("Deseja remover outro produto? (s/n): ");
      }
    } else if (opcao == 5) {
      print("Compra de produtos");
      print("");
      print("=" * 70);

      exibirCarrinho();

      Map<String, dynamic> resumo = resumirCarrinho(carrinho: carrinho);

      exibirResumoCarrinho(carrinho: carrinho, resumo: resumo);
    } else {
      print("Por favor digite um valor válido como opção!");
      pressioneContinuar();
      decoracao();
      continue;
    }
  }
}

void exibirMenu() {
  print("=" * 70);
  print("");
  print("Bem vindo ao carrinho da loja DartShop!");
  print("");
  print("=" * 70);
  print("");
  print("0 - Sair do sistema");
  print("1 - Adicionar produto");
  print("2 - Visualizar carrinho");
  print("3 - Modificar produtos");
  print("4 - Remover produtos");
  print("5 - Comprar produtos");
  print("");
}

void decoracao() {
  print("");
  print("=" * 70);
  print("");
}

void pressioneContinuar() {
  stdout.write("Pressione enter para continuar...");
  stdin.readLineSync();
  decoracao();
}

bool perguntaContinuar(mensagem) {
  String continuar = "";
  while (true) {
    stdout.write(mensagem);
    continuar = stdin.readLineSync()!.toLowerCase().trim();
    print("");

    if (continuar == "s") {
      return true;
    } else if (continuar == "n") {
      return false;
    } else {
      print("Por favor digite 's' para sim ou 'n' para não!\n");
      continue;
    }
  }
}

T entrada<T>({
  String mensagemEntrada = "Entre com um valor: ",
  String mensagemInvalida = "Por favor entre com algum valor!",
  String mensagemNegativo = "Por favor entre com um número positivo",
  bool positivo = false,
}) {
  print("=" * 70);
  print("");
  while (true) {
    stdout.write(mensagemEntrada);
    String entrada = stdin.readLineSync() ?? "";
    decoracao();

    if (T == String) {
      if (!entrada.trim().isEmpty) {
        return entrada as T;
      } else {
        print(mensagemInvalida);
        pressioneContinuar();
        continue;
      }
    }

    if (T == double) {
      if (positivo) {
        if (double.tryParse(entrada) != null &&
            !double.parse(entrada).isNegative) {
          return double.parse(entrada) as T;
        } else {
          print(mensagemNegativo);
          pressioneContinuar();
          continue;
        }
      } else {
        if (double.tryParse(entrada) != null) {
          return double.parse(entrada) as T;
        } else {
          print(mensagemInvalida);
          pressioneContinuar();
          continue;
        }
      }
    }

    if (T == int) {
      if (positivo) {
        if (int.tryParse(entrada) != null && !int.parse(entrada).isNegative) {
          return int.parse(entrada) as T;
        } else {
          print(mensagemNegativo);
          pressioneContinuar();
          continue;
        }
      } else {
        if (int.tryParse(entrada) != null) {
          return int.tryParse(entrada) as T;
        } else {
          print(mensagemInvalida);
          pressioneContinuar();
          continue;
        }
      }
    }
  }
}

bool cadastrarProduto({
  List<Map<String, dynamic>>? carrinho,
  String nome = "",
  double preco = 0.0,
  int quantidade = 0,
}) {
  carrinho = carrinho ?? [];

  // Verifica se o produto existe no carrinho:
  if (carrinho.where((produto) => produto["nome"] == nome).toList().length ==
      0) {
    double subtotal = preco * quantidade;

    Map<String, dynamic> produto = {
      "nome": nome,
      "preco": preco,
      "quantidade": quantidade,
      "subtotal": subtotal,
    };

    carrinho.add(produto);

    print("Produto $nome adicionado com sucesso!");
    decoracao();
    return true;
  } else {
    print("O produto já está no carrinho!");
    pressioneContinuar();
    return false;
  }
}

void exibirCarrinho({List<Map<String, dynamic>>? carrinho}) {
  carrinho = carrinho ?? [];

  if (carrinho.length != 0) {
    int i = 0;
    carrinho.forEach((produto) {
      print("");
      print(
        "ID: ${i + 1} Produto: ${produto["nome"]} Preço: ${produto["preco"]} Quantidade: ${produto["quantidade"]} Subtotal: ${produto["subtotal"]}",
      );
      print("");
      print("-" * 70);
      i++;
    });

    pressioneContinuar();
  } else {
    print("");
    print("Nenhum produto no carrinho!");
    pressioneContinuar();
  }
}

bool modificarProduto({
  List<Map<String, dynamic>>? carrinho,
  int id = 0,
  String? novoNome,
  double? novoPreco,
  int? novaQuantidade,
}) {
  carrinho = carrinho ?? [];

  if (carrinho.length != 0) {
    Map<String, dynamic> produtoAlterando = carrinho.removeAt(id - 1);

    novoNome = novoNome ?? produtoAlterando["nome"];

    novoPreco = novoPreco ?? produtoAlterando["preco"];

    novaQuantidade = novaQuantidade ?? produtoAlterando["quantidade"];

    produtoAlterando.update("nome", (nome) => novoNome);

    produtoAlterando.update("preco", (preco) => novoPreco);

    produtoAlterando.update("quantidade", (quantidade) => novaQuantidade);

    produtoAlterando.update(
      "subtotal",
      (subtotal) => produtoAlterando["preco"] * novaQuantidade,
    );

    carrinho.insert(id - 1, produtoAlterando);

    print("Produto alterado com sucesso!");
    decoracao();
    return true;
  } else {
    print("Por favor adicione produtos ao carrinho para poder modifica-los");
    print("");
    return false;
  }
}

bool removerProduto({List<Map<String, dynamic>>? carrinho, int id = 0}) {
  carrinho = carrinho ?? [];

  if (carrinho.length != 0) {
    List<Map<String, dynamic>> produtoRemovendo = carrinho.sublist(id - 1, id);

    print(
      "ID: ${id} Produto: ${produtoRemovendo[0]["nome"]} Preço: ${produtoRemovendo[0]["preco"]} Quantidade: ${produtoRemovendo[0]["quantidade"]} Subtotal: ${produtoRemovendo[0]["subtotal"]}",
    );
    decoracao();

    bool confirmacao = perguntaContinuar(
      "Deseja mesmo remover este produto? (s/n): ",
    );

    if (confirmacao) {
      carrinho.removeAt(id - 1);
      print("Produto ${produtoRemovendo[0]["nome"]} removido com sucesso!");
      print("");
      return true;
    } else {
      print("Nenhum produto removido!");
      print("");
      return false;
    }
  } else {
    print("Por favor adicione produtos ao carrinho para poder remove-los");
    print("");
    return false;
  }
}

Map<String, dynamic> resumirCarrinho({List<Map<String, dynamic>>? carrinho}) {
  carrinho = carrinho ?? [];
  int totalUnidades = 0;
  int totalItens = 0;
  double valorTotal = 0;
  double mediaPrecosSimples = 0;
  double mediaPrecosPonderada = 0;
  Map<String, dynamic> produtoMaisCaro = {};
  dynamic processamento;

  if (carrinho.length != 0) {
    // Total de unidades:
    // Filtra somente as quantidades de todos os produtos
    processamento = carrinho.map((produto) => produto["quantidade"]).toList();
    // Soma todas as quantidades em uma quantidade geral
    totalUnidades = processamento.reduce(
      (acumulador, quantidade) => acumulador += quantidade,
    );

    // Total de itens:
    // Cálcula o total de itens diferentes no carrinho (adiciona um pois a lista começa no índice 0)
    totalItens = carrinho.length;

    // Valor total:
    // Filtra somente os subtotais de todos os produtos
    processamento = carrinho.map((produto) => produto["subtotal"]).toList();
    // Soma todos os subtotais em um total geral
    valorTotal = processamento.reduce(
      (acumulador, subtotal) => acumulador += subtotal,
    );

    // Média simples:
    // Filtra somente os preços de todos os produtos
    processamento = carrinho.map((produto) => produto["preco"]).toList();
    // Soma todos os preços
    processamento = processamento.reduce(
      (acumulador, preco) => acumulador += preco,
    );
    mediaPrecosSimples = processamento / totalItens;

    // Média ponderada:
    // Cálcula a média dos preços com base na divisão do valor_total (soma dos subtotais) por total_unidades (número de unidades no carrinho)
    mediaPrecosPonderada = valorTotal / totalUnidades;

    // Produto mais caro:
    // Reduz carrinho a um elemento comparando o preço de um elemento com o próximo
    produtoMaisCaro = carrinho.reduce(
      (maior, atual) => (maior["preco"] >= atual["preco"]) ? maior : atual,
    );
  } else {
    print("");
    print("Nenhum produto no carrinho!");
    pressioneContinuar();
  }
  return {
    "total-unidades": totalUnidades,
    "total-itens": totalItens,
    "valor-total": valorTotal,
    "media-simples": mediaPrecosSimples,
    "media-ponderada": mediaPrecosPonderada,
    "produto-mais-caro": produtoMaisCaro,
  };
}

void exibirResumoCarrinho({
  List<Map<String, dynamic>>? carrinho,
  Map<String, dynamic>? resumo,
}) {
  carrinho = carrinho ?? [];
  resumo = resumo ?? {};

  if (carrinho.length != 0) {
    print("");
    print("Informações da compra:");
    print("");
    print("Número de unidades de produtos: ${resumo["total_unidades"]}");
    print("Número de produtos diferentes: ${resumo["total_itens"]}");
    print("Valor total: ${resumo["valor_total"]}");
    print("");
    print("Curiosidades: ");
    print("");
    print(
      "O produto mais caro é ${resumo["produto_mais_caro"]["nome"]} custando ${resumo["produto_mais_caro"]["preco"]} por unidade",
    );
    print(
      "A média dos preços dos produtos é: ${resumo["media_precos_simples"]}",
    );
    print(
      "A média dos subtotais dos produtos é: ${resumo["media_precos_ponderada"]}",
    );
    print("");

    pressioneContinuar();
  } else {
    print("");
    print("Nenhum produto no carrinho!");
    pressioneContinuar();
  }
}
