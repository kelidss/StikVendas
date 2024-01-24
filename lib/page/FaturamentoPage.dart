import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:intl/intl.dart';
import 'package:stik_vendas/page/FeedsPage.dart';
import 'package:stik_vendas/page/HomePage.dart';
import 'package:stik_vendas/page/LoginPage.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';

class FaturamentoPage extends StatefulWidget {
  const FaturamentoPage({super.key});

  @override
  State<FaturamentoPage> createState() => _FaturamentoPageState();
}

class _FaturamentoPageState extends State<FaturamentoPage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> _data = List.generate(
    200,
    (index) => {
      //'COD': index,
      'Data de Emissão': '01/01/2024',
      'Descrição': 'Keliane dos Santos Soares', // Nome inserido na Descrição
      // 'Quantidade': Random().nextInt(100000),
      'Valor': Random().nextDouble() * 79,
    },
  );

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
          backgroundColor: const Color(0xFF9E0000),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: PaginatedDataTable(
                headingRowHeight: 30,
                columnSpacing: 7,
                horizontalMargin: 8,
                //header: const Center(
                // child:
                // Text(
                // 'Faturamento Diário',
                //  style: TextStyle(
                //  fontWeight: FontWeight.bold,
                //  color: Colors.black87,
                //  fontSize: 18,
                // ),
                // ),
                //),
                columns: [
                  DataColumn(label: Text('Data de Emissão')),
                  //   DataColumn(label: Text('COD')),
                  DataColumn(label: Text('Descrição')),
                  // DataColumn(label: Text('Quantidade')),
                  DataColumn(label: Text('Valor')),
                ],
                source: _EstoqueDataSource(_data),
                rowsPerPage: 5,
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: DChartBarO(
                groupList: [
                  OrdinalGroup(id: '1', data: [
                    OrdinalData(domain: 'janeiro', measure: 2),
                    OrdinalData(domain: 'fev', measure: 6),
                    OrdinalData(domain: 'março', measure: 3),
                    OrdinalData(domain: 'abril', measure: 7),
                  ])
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: const Color(0xFF9E0000),
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
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ).show();
            } else if (currentIndex == 0) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            } else if (currentIndex == 2) {
              Navigator.pushReplacement(context,
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
    final numberFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return DataRow(
      cells: [
        DataCell(Text(item['Data de Emissão'].toString())),
        // DataCell(Text(item['COD'].toString())),
        DataCell(Text(item['Descrição'].toString())),
        //   DataCell(Text(item['Quantidade'].toString())),
        DataCell(Text(numberFormat.format(item['Valor']))),
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
