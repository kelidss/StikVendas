import 'package:flutter/material.dart';
import 'package:stik_vendas/Views/EstoquePageView.dart';
import 'package:stik_vendas/Views/FaturamentoPageView.dart';
import 'package:stik_vendas/Views/FeedsPageView.dart';
import 'package:stik_vendas/Views/HomePageView.dart';
import 'package:stik_vendas/Views/LoginPageView.dart';

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
        '/': (context) => const LoginPage(),
        '/feeds': (context) => FeedsPage(),
        '/estoque': (context) => const EstoquePage(),
        '/faturamento': (context) => const FaturamentoPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
