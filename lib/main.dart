
import 'package:flutter/material.dart';
//import 'package:stik_vendas/page/FeedsPage.dart';
//import 'package:stik_vendas/page/HomePage.dart';
import 'package:stik_vendas/page/LoginPage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stik Vendas',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const LoginPage()
        //,
        //  initialRoute: '',
       // routes: {
         // 'home': (context) => const HomePage(),
        //  'login': (context) => const LoginPage(),
       //   'feed': (context) => const FeedsPage(),
      //  }
       );
  }
}
