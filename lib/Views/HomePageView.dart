import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stik_vendas/Controllers/PedidoController.dart';
import 'package:stik_vendas/Models/LoginModel.dart';
import 'package:stik_vendas/Views/CarteiraDeClientesView.dart';
import 'package:stik_vendas/Views/EstoquePageView.dart';
import 'package:stik_vendas/Views/FaturamentoPageView.dart';
import 'package:stik_vendas/Views/FeedsPageView.dart';
import 'package:stik_vendas/Views/LoginPageView.dart';
import 'package:stik_vendas/Views/PedidoPageView.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.nomeUsuario}) : super(key: key);

  final String? nomeUsuario;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFD52B1E),
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
              padding: const EdgeInsets.all(16),
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  _buildMenuButton(
                    icon: Icons.shopping_cart,
                    label: 'Pedido',
                    onPressed: () {
                      _navigateToPage(const PedidoPage());
                    },
                  ),
                  _buildMenuButton(
                    icon: Icons.work,
                    label: 'Estoque',
                    onPressed: () {
                      _navigateToPage(const EstoquePage());
                    },
                  ),
                  _buildMenuButton(
                    icon: Icons.monetization_on,
                    label: 'Faturamento',
                    onPressed: () {
                      _navigateToPage(const FaturamentoPage());
                    },
                  ),
                  _buildMenuButton(
                    icon: Icons.wallet,
                    label: 'Cliente',
                    onPressed: () {
                      _navigateToPage(CarteiraClientePage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color(0xFFD52B1E),
        animationDuration: const Duration(milliseconds: 300),
        // index: currentIndex,
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.exit_to_app, color: Colors.white),
          Icon(Icons.feed, color: Colors.white),
        ],
        onTap: (index) async {
          //  if (index == currentIndex) return;
          setState(() {
            currentIndex = index;
          });
          await Future.delayed(const Duration(seconds: 1));
          if (currentIndex == 1) {
            _showExitConfirmationDialog();
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

  Widget _buildMenuButton(
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFD52B1E),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void _showExitConfirmationDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: 'Confirmação',
      desc: 'Tem certeza que deseja sair?',
      btnCancelText: 'Não',
      btnOkText: 'Sim',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        _clearControllers();
        _navigateToLoginPage();
      },
    ).show();
  }

  void _clearControllers() {
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
  }

  void _navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
