import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stik_vendas/Controllers/Controller_Faturamento.dart';
import 'package:stik_vendas/Models/Model_Faturamento.dart';
import 'package:stik_vendas/Views/FeedsPage.dart';
import 'package:stik_vendas/Views/HomePage.dart';
import 'package:stik_vendas/Views/LoginPage.dart';

class FaturamentoPage extends StatefulWidget {
  const FaturamentoPage({Key? key}) : super(key: key);

  @override
  State<FaturamentoPage> createState() => _FaturamentoPageState();
}

class _FaturamentoPageState extends State<FaturamentoPage> {
  int currentIndex = 0;
  final FaturamentoController _controller = FaturamentoController();

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
            Container(
              padding: const EdgeInsets.all(8),
              child: PaginatedDataTable(
                headingRowHeight: 30,
                columnSpacing: 7,
                horizontalMargin: 8,
                columns: const [
                  DataColumn(
                      label: Text(
                    'Emissão',
                    // style: TextStyle(fontSize: 13),
                  )),
                  DataColumn(label: Text('Descrição')),
                  DataColumn(label: Text('Valor')),
                ],
                header: const TextField(
                  decoration: InputDecoration(
                    labelText: 'procurar...',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                source:
                    _FaturamentoDataSource(_controller.getFaturamentoData()),
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
