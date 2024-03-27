import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stik_vendas/Views/bottomNavigation.dart';

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
        bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}