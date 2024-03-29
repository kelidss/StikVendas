// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:stik_vendas/Views/bottomNavigation.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({Key? key}) : super(key: key);
  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> _data = [
    {'ID': 1, 'Title': 'Anne 09 mm Tipo B', 'quantidade estoque': 100},
    {'ID': 2, 'Title': 'Aurora 20 mm Em Disco', 'quantidade estoque': 150},
    {'ID': 3, 'Title': 'Bali 20 mm', 'quantidade estoque': 80},
    {'ID': 4, 'Title': 'Bali 25 mm L', 'quantidade estoque': 120},
    {'ID': 5, 'Title': 'Band 52 mm', 'quantidade estoque': 200},
    {'ID': 6, 'Title': 'Bela 13 mm Tipo B', 'quantidade estoque': 90},
    {'ID': 7, 'Title': 'Belty 25 mm', 'quantidade estoque': 170},
    {'ID': 8, 'Title': 'Belty 30 mm Tipo B', 'quantidade estoque': 130},
    {'ID': 9, 'Title': 'Beta 15 mm Tipo B', 'quantidade estoque': 110},
    {'ID': 10, 'Title': 'Blend 40 mm Tipo B', 'quantidade estoque': 85},
    {'ID': 11, 'Title': 'BLL 18 mm Tipo B', 'quantidade estoque': 95},
    {'ID': 12, 'Title': 'Cats 16 Tingido', 'quantidade estoque': 180},
    {'ID': 13, 'Title': 'Chll 05 Tingido', 'quantidade estoque': 105},
    {'ID': 14, 'Title': 'Chuly 14 mm Tipo B', 'quantidade estoque': 75},
    {'ID': 15, 'Title': 'Cintarela 230 mm Tipo B', 'quantidade estoque': 115},
    {'ID': 16, 'Title': 'Cintarela 250 mm Tipo B', 'quantidade estoque': 125},
    {'ID': 17, 'Title': 'Cintarela 270 mm  Tipo B', 'quantidade estoque': 135},
    {'ID': 18, 'Title': 'Cintarela 270 mm Tipo B', 'quantidade estoque': 145},
    {'ID': 19, 'Title': 'Cintarela 60 mm Tipo B', 'quantidade estoque': 165},
    {'ID': 20, 'Title': 'Cintra 22 mm Tipo B ENF', 'quantidade estoque': 195},
    {'ID': 21, 'Title': 'Cintra 38 Sublimado', 'quantidade estoque': 140},
    {'ID': 22, 'Title': 'Class 14 mm', 'quantidade estoque': 160},
    {'ID': 23, 'Title': 'Class 16 mm Tipo B', 'quantidade estoque': 175},
    {'ID': 24, 'Title': 'Cleide 4 30 mm Em Disco', 'quantidade estoque': 185},
    {'ID': 25, 'Title': 'Cleide 4 40 DT mm', 'quantidade estoque': 155},
    {'ID': 26, 'Title': 'Cleide 4 40 DT mm Tipo B', 'quantidade estoque': 150},
    {'ID': 27, 'Title': 'Cleide BP 4 35 DT mm', 'quantidade estoque': 125},
    {
      'ID': 28,
      'Title': 'Cleide BP 4 35 DT mm Tipo B',
      'quantidade estoque': 135
    },
    {'ID': 29, 'Title': 'Cleide BP 4 50 mm', 'quantidade estoque': 145},
    {'ID': 30, 'Title': 'Cleide EDG 35 mm', 'quantidade estoque': 190},
    {'ID': 31, 'Title': 'Cleide PP 35 mm', 'quantidade estoque': 200},
    {'ID': 32, 'Title': 'Cleide PP 35 mm Tipo B', 'quantidade estoque': 205},
    {'ID': 33, 'Title': 'Cris 16 (H) Tipo B', 'quantidade estoque': 195},
    {'ID': 34, 'Title': 'Dakar 16 mm', 'quantidade estoque': 185},
    {'ID': 35, 'Title': 'Dama 10 mm Tipo B', 'quantidade estoque': 175},
    {
      'ID': 36,
      'Title': 'Dayane 13 UP N BR mm Tipo B',
      'quantidade estoque': 165
    },
    {'ID': 37, 'Title': 'Dayane 17 UP mm Sublimado', 'quantidade estoque': 155},
    {
      'ID': 38,
      'Title': 'Dayane 17 UP mm Sublimado Tipo B',
      'quantidade estoque': 145
    }
  ];

  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData = List.from(_data);
  }

  void _filterData(String searchTerm) {
    searchTerm = searchTerm.toLowerCase();
    setState(() {
      _filteredData = _data
          .where(
            (item) =>
                item['Title'].toString().toLowerCase().contains(searchTerm),
          )
          .toList();
    });
  }

  bool _containsItems(String description) {
    final List<String> items = [];
    for (var item in items) {
      if (description.toLowerCase().contains(item.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Estoque',
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
              source: _EstoqueDataSource(_filteredData, _containsItems),
              showFirstLastButtons: true,
              columns: const [
                DataColumn(label: Text('COD')),
                DataColumn(
                    label: Text('Descrição', textAlign: TextAlign.center)),
                DataColumn(label: Text('Estoque')),
              ],
              header: TextField(
                onChanged: _filterData,
                decoration: const InputDecoration(
                  labelText: 'Procurar...',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      );
}

class _EstoqueDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _data;
  final Function(String) _containsItems;

  _EstoqueDataSource(this._data, this._containsItems);

  @override
  DataRow? getRow(int index) {
    final item = _data[index];
    final description = item['Title'].toString();
    return DataRow(
      cells: [
        DataCell(Text(item['ID'].toString())),
        DataCell(Text(description)),
        DataCell(Text(item['quantidade estoque'].toString())),
      ],
      selected: _containsItems(description),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
