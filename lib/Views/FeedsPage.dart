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
      body: Column(
        children: [
          const SizedBox(height: 30),
          CarouselSlider(
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              height: 200.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 168, 168, 168),
                  borderRadius: BorderRadius.circular(13),
                ),
                width: 300,
                child: const Center(
                  child: Text('Mensagem 1'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 168, 168, 168),
                  borderRadius: BorderRadius.circular(13),
                ),
                width: 300,
                child: const Center(
                  child: Text('Mensagem 2'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 168, 168, 168),
                  borderRadius: BorderRadius.circular(13),
                ),
                width: 300,
                child: const Center(
                  child: Text(
                    'Mensagem 3',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
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
                DtPedidoController.clear();
                DtEntregaController.clear();
                ClienteController.clear();
                FreteController.clear();
                ObservacaoController.clear();
                UndController.clear();
                QtdController.clear();
                OcClienteController.clear();
                VrBaseController.clear();
                PrEfetivoController.clear();
                VrBrutoController.clear();
                
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => FeedsPage()));
          }
        },
      ),
    );
  }
}