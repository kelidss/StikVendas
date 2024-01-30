import 'package:flutter/material.dart';
import 'package:stik_vendas/Views/EstoquePage.dart';
import 'package:stik_vendas/Views/FaturamentoPage.dart';
import 'package:stik_vendas/Views/FeedsPage.dart';
import 'package:stik_vendas/Views/HomePage.dart';
import 'package:stik_vendas/Views/LoginPage.dart';

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
        '/': (context) => const LoginPage(), // Página inicial
        '/feeds': (context) => FeedsPage(),
        '/estoque': (context) => const EstoquePage(),
        '/faturamento': (context) => const FaturamentoPage(),
        // '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
