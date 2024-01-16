import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
import 'package:stik_vendas/page/HomePage.dart';
import 'package:stik_vendas/page/LoginPage.dart';

class FeedsPage extends StatefulWidget {
  final String username;
  const FeedsPage({Key? key, required this.username}) : super(key: key);
  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  int currentIndex = 2;
  //List<String> emailTexts = [];

  // @override
  // void initState() {
  //  super.initState();
  //  fetchData();
  //}

  /* Future<void> fetchData() async {
    final response = await http.get('http:/736-004-658/fetch_emails' as Uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        emailTexts = List<String>.from(jsonData['emails']);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
*/
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
          const SizedBox(height: 30),
          CarouselSlider(
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                height: 200.0,
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
                    style: TextStyle(color: Colors.black),
                  )),
                  width: 300,
                ),
              ]
              /* items: emailTexts.map((text) {
              return Container(
                color: Color.fromARGB(255, 180, 180, 180),
                child: Center(child: Text(text)),
                width: 300,
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: emailTexts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(emailTexts[index]),
                );
              },
            ),*/
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
        index: 2,
        onTap: (index) async {
          setState(() {
            currentIndex = index;
          });
          await Future.delayed(Duration(seconds: 1));

          if (currentIndex == 0) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (currentIndex == 1) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          } else if (currentIndex == 2) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => FeedsPage(username: widget.username)));
          }
        },
      ),
    );
  }
}
