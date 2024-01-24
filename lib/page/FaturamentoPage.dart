import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Faturamento',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF9E0000),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
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
                ))
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
