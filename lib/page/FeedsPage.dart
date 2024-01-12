import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stik_vendas/page/HomePage.dart';
import 'package:stik_vendas/page/LoginPage.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({Key? key});

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  int _activePage = 2;
  final List<Widget> children = [HomePage(), LoginPage(), FeedsPage()];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Feeds',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF9E0000),
        ),
         bottomNavigationBar:CurvedNavigationBar(
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
            _activePage = index;
          });
          await Future.delayed(Duration(seconds: 1));
            if (_activePage == 0) {
             Navigator.pop(context, MaterialPageRoute(builder: (context) => HomePage()));
             }
            else if (_activePage == 1) {
             Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            } else if (_activePage == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FeedsPage()));        
          }
        },
      ),
      );
}
