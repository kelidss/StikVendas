import 'package:flutter/material.dart';
import 'package:stik_vendas/page/HomePage.dart';
//import 'package:provider/provider.dart';
import 'package:stik_vendas/page/LoginPage.dart';

void main() {
  runApp(
      //   ChangeNotifierProvider(
      //     create: (context) => UserData(),
      // child: const
      const MyApp()
      //  )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stik Vendas',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
    );
  }
}
