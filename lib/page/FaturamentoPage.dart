import 'package:flutter/material.dart';

class FaturamentoPage extends StatefulWidget {
  const FaturamentoPage({super.key});

  @override
  State<FaturamentoPage> createState() => _FaturamentoPageState();
}

class _FaturamentoPageState extends State<FaturamentoPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Faturamento'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
      );
}