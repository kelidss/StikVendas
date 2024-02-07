import 'dart:math';
import 'package:stik_vendas/Models/Model_Faturamento.dart';

class FaturamentoController {
  List<Faturamento> getFaturamentoData() {
    List<String> nomes = [
      'João Silva',
      'Maria Santos',
      'Pedro Oliveira',
      'Ana Costa',
      'Luiz Pereira',
      'Juliana Souza',
      'Carlos Oliveira',
      'Fernanda Santos',
      'Rafaela Lima',
      'André Almeida',
      'Camila Martins',
      'Diego Ferreira',
      'Paula Rocha',
      'Lucas Cardoso',
      'Mariana Castro',
      'Keliane Soares',
      'Keroly Soares',
      'Alexandre Junior',
      'Jacqueline Ferreira',
      'Alexandre Junior',
      'Tony Soares'
    ];

    return List.generate(
      200,
      (index) => Faturamento(
        dataEmissao: '01/01/2024',
        descricao: nomes[Random().nextInt(nomes.length)],
        valor: Random().nextDouble() * 79,
      ),
    );
  }
}
