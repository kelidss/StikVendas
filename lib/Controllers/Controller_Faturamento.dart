import 'dart:math';

import 'package:stik_vendas/Models/Model_Faturamento.dart';

class FaturamentoController {
  List<Faturamento> getFaturamentoData() {
    return List.generate(
      200,
      (index) => Faturamento(
        dataEmissao: '01/01/2024',
        descricao: 'Keliane dos Santos Soares',
        valor: Random().nextDouble() * 79,
      ),
    );
  }
}
