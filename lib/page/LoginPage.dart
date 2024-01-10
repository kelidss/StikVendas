import 'package:flutter/material.dart';
import 'package:stik_vendas/page/HomePage.dart';
//import 'package:stik_vendas/page/PedidoPage.dart';
//import 'package:stik_vendas/page/PedidoPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();
  String _bemvindo = '';

  void _mostraBemVindo() {
    setState(() {
      if (_usuarioController.text.isNotEmpty || _senhaController.text.isNotEmpty) {
        _bemvindo = 'Bem vindo ${_usuarioController.text}';
      } else {
        _bemvindo = "Vazio!";
      }
    });
  }

  void _limparCampo() {
    setState(() {
      _usuarioController.clear();
      _senhaController.clear();
      _bemvindo = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Image.asset(
              'assets/Logo_Stik_App.png',
              width: 130,
              height: 120,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Bem vindo!',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usuarioController,
                    decoration: InputDecoration(
                      hintText: 'Usuário',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _senhaController,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            nomeUsuario: _usuarioController.text,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      child: Card(
                        color: Color(0xFF9E0000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: _limparCampo,
                    child: Container(
                      width: 150,
                      child: Card(
                        color: Color(0xFF9E0000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              'Limpar Campo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    " $_bemvindo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.6,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


/*class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: InkWell(
        onTap:() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PedidoPage()), // Substitua pelo nome real da tela de pedidos
            );
          },
        child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(5),
     ),
    child: const Text("Pedido", style: TextStyle(fontSize: 24),),
  ),
),
      );
}*/