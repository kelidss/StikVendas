import 'package:flutter/material.dart';
import 'package:stik_vendas/main.dart';

void main() {
  runApp(const MyApp());
}

class Pedido {
  String cliente;
  DateTime dataPedido;
  String tipoDocumento;
  // Outros campos necessários

  Pedido({
    required this.cliente,
    required this.dataPedido,
    required this.tipoDocumento,
    // Inicialize outros campos aqui
  });
}

// Classe da página que exibe a lista de pedidos
class ListaPedidosPage extends StatelessWidget {
  final List<Pedido> pedidos;

  const ListaPedidosPage({Key? key, required this.pedidos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pedidos'),
      ),
      body: ListView.builder(
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          var pedido = pedidos[index];
          return ListTile(
            title: Text(pedido.cliente),
            subtitle: Text('Data do Pedido: ${pedido.dataPedido}'),
            // Adicione outros campos do pedido conforme necessário
          );
        },
      ),
    );
  }
}

// Classe que mantém a lista de pedidos e adiciona novos pedidos
class PedidoController {
  List<Pedido> pedidos = [];

  void adicionarPedido(Pedido pedido) {
    pedidos.add(pedido);
  }
}
