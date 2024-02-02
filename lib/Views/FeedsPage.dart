import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stik_vendas/Controllers/Controller_Pedido.dart';
import 'package:stik_vendas/Views/HomePage.dart';
import 'package:stik_vendas/Views/LoginPage.dart';

class FeedsPage extends StatefulWidget {
  final String? nomeUsuario;
  FeedsPage({Key? key, this.nomeUsuario}) : super(key: key);

  @override
  State<FeedsPage> createState() => FeedsPageState();
  final TextEditingController usuarioController = TextEditingController();
}

//late PageController _pageController;
//   @override
//   void initState() {
//   super.initState();
//  textEditingController = textEditingController;

// _pageController = PageController();
// }

class FeedsPageState extends State<FeedsPage> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feeds',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFD52B1E),
        //leading:
        // IconButton(
        //  icon: Icon(Icons.keyboard_backspace_sharp),
        // onPressed: () {
        //   Navigator.pop(context);
        // },
        //  ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataTable(
              columns: const [
                DataColumn(label: Text('Campo')),
                DataColumn(label: Text('Valor')),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(Text('DtPedido')),
                  DataCell(Text(DtPedidoController.text)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Cliente')),
                  DataCell(Text(ClienteController.text)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Artigo')),
                  DataCell(Text(ArtigoController.text)),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Detalhe do Artigo')),
                  DataCell(Text(DetArtigoController.text)),
                ]),
              ],
            ),
          ],
        ),
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
        index: 2,
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => FeedsPage()));
          }
        },
      ),
    );
  }
}
