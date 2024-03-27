// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:stik_vendas/Views/FeedsPageView.dart';
import 'package:stik_vendas/Views/HomePageView.dart';
import 'package:stik_vendas/Views/LoginPageView.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      animationCurve: Curves.easeInOut,
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
          _currentIndex = index;
        });
        await Future.delayed(const Duration(seconds: 1));
        if (_currentIndex == 1) {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.scale,
                  title: 'Confirmação',
                  desc: 'Tem certeza que deseja sair?',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  btnCancelText: 'Não',
                  btnOkText: 'Sim')
              .show();
        } else if (_currentIndex == 0) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else if (_currentIndex == 2) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FeedsPage()));
        }
      },
    );
  }
}
