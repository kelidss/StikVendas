// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stik_vendas/Controllers/FaturamentoController.dart';
import 'package:stik_vendas/Models/FaturamentoModel.dart';
import 'package:stik_vendas/Views/bottomNavigation.dart';

class FaturamentoPage extends StatefulWidget {
  const FaturamentoPage({Key? key}) : super(key: key);

  @override
  State<FaturamentoPage> createState() => _FaturamentoPageState();
}

class _FaturamentoPageState extends State<FaturamentoPage> {
  int currentIndex = 0;
  final FaturamentoController _controller = FaturamentoController();
  late List<Faturamento> _filteredData;

  @override
  void initState() {
    super.initState();
    _filteredData = _controller.getFaturamentoData();
  }

  void _filterData(String searchTerm) {
    setState(() {
      _filteredData = _controller
          .getFaturamentoData()
          .where((faturamento) => faturamento.descricao
              .toLowerCase()
              .contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Faturamento',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFD52B1E),
        ),
        body: ListView(
          children: [
            PaginatedDataTable(
              columns: const [
                DataColumn(label: Text('Emissão')),
                DataColumn(label: Text('Descrição')),
                DataColumn(label: Text('Valor')),
              ],
              header: TextField(
                onChanged: _filterData,
                decoration: const InputDecoration(
                  labelText: 'Procurar...',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              source: _FaturamentoDataSource(_filteredData),
              rowsPerPage: 10,
              columnSpacing: 30,
              showFirstLastButtons: true,
              horizontalMargin: 20,
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      );
}

class _FaturamentoDataSource extends DataTableSource {
  final List<Faturamento> _data;

  _FaturamentoDataSource(this._data);

  @override
  DataRow? getRow(int index) {
    final item = _data[index];
    final numberFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return DataRow(
      cells: [
        DataCell(Text(item.dataEmissao)),
        DataCell(Text(item.descricao)),
        DataCell(Text(numberFormat.format(item.valor))),
      ],
      selected: false,
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
