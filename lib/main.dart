import 'package:flutter/material.dart';
import 'package:stik_vendas/page/EstoquePage.dart';
import 'package:stik_vendas/page/FaturamentoPage.dart';
import 'package:stik_vendas/page/FeedsPage.dart';
import 'package:stik_vendas/page/HomePage.dart';
import 'package:stik_vendas/page/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stik Vendas',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/', // Rota inicial
      routes: {
        '/': (context) => LoginPage(), // Página inicial
        '/feeds': (context) => FeedsPage(),
        '/estoque': (context) => EstoquePage(),
        '/faturamento': (context) => FaturamentoPage(),
       // '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(), 
      },
    );
  }
}
