import 'dart:math';
import 'package:stik_vendas/Models/Model_Estoque.dart';

class EstoqueController {
  List<ItemEstoque> getEstoqueData() {
    return List.generate(
      200,
      (index) => ItemEstoque(
        id: index,
        title: "Linha tal cor tal tecido tal $index",
        quantidade: Random().nextInt(100000),
      ),
    );
  }
}
