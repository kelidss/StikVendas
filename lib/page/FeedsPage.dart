import 'package:carousel_slider/carousel_slider.dart';
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
        backgroundColor: const Color(0xFF9E0000),
      ),
      body: Column(
        children: [
          CarouselSlider(
            //   FlutterCarousel(
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              height: 200.0,
              //  showIndicator: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: [
              Container(
                color: Color.fromARGB(255, 228, 131, 220),
                child: Center(
                    child: Text(
                  'Mensagem 1',
                )),
                width: 300,
              ),
              Container(
                color: Color.fromARGB(255, 105, 117, 226),
                child: Center(
                    child: Text(
                  'Mensagem 2',
                )),
                width: 300,
              ),
              Container(
                color: Color.fromARGB(255, 0, 160, 235),
                child: Center(
                    child: Text(
                  'Mensagem 3',
                  style: TextStyle(
                  color: Colors.black),
                )),
                width: 300,
              ),
          //   const CircularProgressIndicator()
            ],
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color(0xFF9E0000),
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.feed, color: Colors.white),
          Icon(Icons.exit_to_app, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
        ],
        onTap: (index) async {
          setState(() {
            currentIndex = index;
          });
          await Future.delayed(Duration(seconds: 1));
          if (currentIndex == 0) {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => FeedsPage()));
          }
          if (currentIndex == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          } else if (currentIndex == 2) {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
      ),
    );
  }
}
