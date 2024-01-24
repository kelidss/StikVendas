import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stik_vendas/page/EstoquePage.dart';
import 'package:stik_vendas/page/FaturamentoPage.dart';
import 'package:stik_vendas/page/FeedsPage.dart';
import 'package:stik_vendas/page/LoginPage.dart';
import 'package:stik_vendas/page/PedidoPage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.nomeUsuario}) : super(key: key);

  final String? nomeUsuario;

  @override
  State<HomePage> createState() => HomePageState();
  final TextEditingController usuarioController = TextEditingController();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9E0000),
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Olá, ${UserData.nomeUsuario}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PedidoPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF9E0000),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Pedido',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EstoquePage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF9E0000),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.work,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Estoque',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FaturamentoPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF9E0000),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.monetization_on,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Text('Faturamento',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  // Adicione outros itens do GridView aqui
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 50,
                width: 300,
                decoration: const BoxDecoration(
                    // color: Colors.green,
                    ),
                child: const Center(
                  child: Text(
                    'Progresso da sua meta.',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CircularPercentIndicator(
                // Configurações do CircularPercentIndicator
                animation: true,
                radius: 100,
                lineWidth: 20,
                percent: 0.40,
                progressColor: Colors.green,
                // backgroundColor: Colors.amber,
                backgroundColor: Colors.grey,
                circularStrokeCap: CircularStrokeCap.round,
                center: const Text(
                  '40.0%',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
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
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ).show();
          } else if (currentIndex == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FeedsPage()),
            );
          }
        },
      ),
    );
  }
}
