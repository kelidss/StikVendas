import 'package:flutter/material.dart';
import 'package:stik_vendas/Views/BottomNavigation.dart';

class CarteiraClientePage extends StatefulWidget {
  const CarteiraClientePage({Key? key}) : super(key: key);

  @override
  State<CarteiraClientePage> createState() => _CarteiraClientePageState();
}

class _CarteiraClientePageState extends State<CarteiraClientePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Cliente> _filteredData = [];
  final List<Cliente> _data = [
    Cliente(
        nome: 'Keliane',
        limiteCredito: 1000,
        saldoLimite: 500,
        inadimplencia: true),
    Cliente(
        nome: 'Soares',
        limiteCredito: 2000,
        saldoLimite: 1500,
        inadimplencia: false),
    Cliente(
        nome: 'Ferreira',
        limiteCredito: 3000,
        saldoLimite: 2000,
        inadimplencia: true),
    Cliente(
        nome: 'Nascimento',
        limiteCredito: 4000,
        saldoLimite: 2500,
        inadimplencia: false),
    Cliente(
        nome: 'Morais',
        limiteCredito: 5000,
        saldoLimite: 3000,
        inadimplencia: true),
    Cliente(
        nome: 'Souza',
        limiteCredito: 6000,
        saldoLimite: 3500,
        inadimplencia: false),
    Cliente(
        nome: 'Silva',
        limiteCredito: 7000,
        saldoLimite: 4000,
        inadimplencia: true),
  ];

  @override
  void initState() {
    super.initState();
    _filteredData = List.from(_data);
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
                decoration: const InputDecoration(
                  labelText: 'Procurar...',
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: _filterData,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable(
                columnSpacing: 20.0,
                columns: const [
                  DataColumn(label: Text('Nome')),
                  DataColumn(label: Text('Crédito')),
                  DataColumn(label: Text('Saldo')),
                  DataColumn(
                      label: Text('Inadimplente', textAlign: TextAlign.center)),
                ],
                rows: _filteredData.map((cliente) {
                  return DataRow(
                    cells: [
                      DataCell(Text(cliente.nome)),
                      DataCell(Text('${cliente.limiteCredito}')),
                      DataCell(Text('${cliente.saldoLimite}')),
                      DataCell(Text(cliente.inadimplencia
                          ? 'R\$ ${cliente.limiteCredito - cliente.saldoLimite}'
                          : 'Não')),
                    ],
                  );
                }).toList(),
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
