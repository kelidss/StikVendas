import 'package:flutter/material.dart';
import 'package:stik_vendas/page/PedidoPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: InkWell(
        onTap:() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PedidoPage()), // Substitua pelo nome real da tela de pedidos
            );
          },
        child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(5),
     ),
    child: const Text("Pedido", style: TextStyle(fontSize: 24),),
  ),
),
      );
}