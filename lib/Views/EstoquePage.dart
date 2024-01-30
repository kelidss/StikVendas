import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:stik_vendas/Views/HomePage.dart';
import 'package:stik_vendas/Views/LoginPage.dart';
import 'package:stik_vendas/Views/FeedsPage.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({Key? key}) : super(key: key);

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> _data = List.generate(
    200,
    (index) => {
      'ID': index,
      'Title': "Linha tal cor tal tecido tal $index",
      'quantidade estoque': Random().nextInt(100000),
    },
  );

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
          leading: IconButton(
            icon: const Icon(Icons.keyboard_backspace_sharp),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: [
            PaginatedDataTable(
              source: _EstoqueDataSource(_data),
              columns: const [
                DataColumn(label: Text('COD')),
                DataColumn(label: Text('Descrição')),
                DataColumn(label: Text('Estoque')),
              ],
              header: const TextField(
                decoration: InputDecoration(
                  labelText: 'Procurar...', suffixIcon: Icon(Icons.search),
                  //  hintText: ('teste')
                ),
              ),
              // Center(
              // child: Text(
              //   'Posição de estoque',
              // style: TextStyle(
              //  fontWeight: FontWeight.bold,
              //   color: Colors.black87,
              //    fontSize: 18,
              //   ),
              //  ),
              //   ),
              columnSpacing: 30,
              horizontalMargin: 10,
              rowsPerPage: 10,
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: const Color(0xFFD52B1E),
          animationDuration: const Duration(milliseconds: 300),
          items: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.exit_to_app, color: Colors.white),
            Icon(Icons.feed, color: Colors.white),
          ],
          onTap: (index) async {
            setState(() {
              currentIndex = index;
            });
            await Future.delayed(const Duration(seconds: 1));
            if (currentIndex == 1) {
              // ignore: use_build_context_synchronously
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.scale,
                title: 'Confirmação',
                desc: 'Tem certeza que deseja sair?',
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ).show();
            } else if (currentIndex == 0) {
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            } else if (currentIndex == 2) {
              // ignore: use_build_context_synchronously
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeedsPage()));
            }
          },
        ),
      );
}

class _EstoqueDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _data;

  _EstoqueDataSource(this._data);

  @override
  DataRow? getRow(int index) {
    final item = _data[index];
    return DataRow(
      cells: [
        DataCell(Text(item['ID'].toString())),
        DataCell(Text(item['Title'].toString())),
        DataCell(Text(item['quantidade estoque'].toString())),
      ],
      selected: false,
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0; // No rows are selected
}
