// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:stik_vendas/Views/BottomNavigation.dart';
import 'package:stik_vendas/Views/bottomNavigationFeeds.dart';

class CarteiraClientePage extends StatefulWidget {
  const CarteiraClientePage({Key? key}) : super(key: key);

  @override
  State<CarteiraClientePage> createState() => _CarteiraClientePageState();
}

class _CarteiraClientePageState extends State<CarteiraClientePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Cliente> _filteredData = [];
  List<Cliente> _data = [
    Cliente(
        nome: 'Cliente A',
        limiteCredito: 1000,
        saldoLimite: 500,
        inadimplencia: true),
    Cliente(
        nome: 'Cliente B',
        limiteCredito: 2000,
        saldoLimite: 1500,
        inadimplencia: false),
    Cliente(
        nome: 'Cliente C',
        limiteCredito: 3000,
        saldoLimite: 2000,
        inadimplencia: true),
    Cliente(
        nome: 'Cliente D',
        limiteCredito: 4000,
        saldoLimite: 2500,
        inadimplencia: false),
    Cliente(
        nome: 'Cliente E',
        limiteCredito: 5000,
        saldoLimite: 3000,
        inadimplencia: true),
  ];

  @override
  void initState() {
    super.initState();
    _filteredData.addAll(_data);
  }

  void _filterData(String searchTerm) {
    setState(() {
      _filteredData = _data
          .where((cliente) =>
              cliente.nome.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Clientes',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFD52B1E),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterData,
                decoration: const InputDecoration(
                  labelText: 'Procurar...',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredData.length,
                itemBuilder: (context, index) {
                  final cliente = _filteredData[index];
                  return ListTile(
                    title: Text(cliente.nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Limite de Crédito: ${cliente.limiteCredito}'),
                        Text('Saldo do Limite: ${cliente.saldoLimite}'),
                        Text(
                            'Inadimplência: ${cliente.inadimplencia ? 'Sim' : 'Não'}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      );
}

class Cliente {
  final String nome;
  final double limiteCredito;
  final double saldoLimite;
  final bool inadimplencia;

  Cliente({
    required this.nome,
    required this.limiteCredito,
    required this.saldoLimite,
    required this.inadimplencia,
  });
}
