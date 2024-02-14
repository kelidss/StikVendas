// ignore_for_file: use_build_context_synchronously, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stik_vendas/Controllers/Controller_Pedido.dart';
import 'package:stik_vendas/Views/FeedsPage.dart';
import 'package:stik_vendas/Views/HomePage.dart';
import 'package:stik_vendas/Views/LoginPage.dart';
import 'package:intl/intl.dart';


class PedidoPage extends StatefulWidget {
  const PedidoPage({Key? key}) : super(key: key);

  @override
  _PedidoPageState createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  String? _selectedTipoDocumento;
  String? _selectedTipoCobranca;
  String? _selectedFormaPagamento;
  String? _selectedArtigo;
  String? _selectedDetalheDoArtigo;
  String _selectedOption = '';

  bool _todosCamposPreenchidos1() {
    return DtPedidoController.text.isNotEmpty &&
        DtEntregaController.text.isNotEmpty &&
        ClienteController.text.isNotEmpty;
  }

  void _avancarParaProximaPagina1() {
    if (_todosCamposPreenchidos1()) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Atenção"),
            content: Text(
              "Campos obrigatórios vazios",
              textAlign: TextAlign.center,
            ),
            shadowColor: Colors.red,
            icon: const Icon(Icons.error),
            actions: <Widget>[
              InkWell(
                child: const Text("Fechar"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pedido',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFD52B1E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            _buildPage1(),
            _buildPage2(),
            _buildPage3(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
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
                VrBrutoController.clear();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ).show();
          } else if (_currentIndex == 0) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (_currentIndex == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeedsPage()));
          }
        },
      ),
    );
  }

  Widget _buildPage1() {
    return Wrap(
      children: [
        _buildText('Boas Vendas', fontSize: 0.5),
        const SizedBox(height: 4),
        _buildDateFields(),
        const SizedBox(height: 70),
        _buildTextFormField('Cliente', controller: ClienteController),
        const SizedBox(height: 70),
        _buildDropdownButtonFormField(
            'Tipo de Documento', _selectedTipoDocumento, ['RG', 'CPF']),
        const SizedBox(height: 70),
        _buildDropdownButtonFormField(
            'Tipo de Cobrança', _selectedTipoCobranca, ['Opção 1', 'Opção 2']),
        const SizedBox(height: 70),
        _buildDropdownButtonFormField(
            'Forma de pagamento', _selectedFormaPagamento, [
          '30 DIAS',
          '60 DIAS',
          '90 DIAS',
          '51 DIAS',
          '71 DIAS',
          '111 DIAS'
        ]),
        const SizedBox(height: 50),
        _buildNextButton(),
      ],
    );
  }

  // Método para construir a segunda página
  Widget _buildPage2() {
    return Wrap(
      children: [
        _buildText('Boas Vendas', fontSize: 0.5),
        const SizedBox(height: 10),
        _buildTextFormField('Observação',
            controller: ObservacaoController, hintText: 'não obrigatório'),
        const SizedBox(height: 70),
        _buildTextFormField('OC Cliente', controller: OcClienteController),
        const SizedBox(height: 70),
        _buildFreteOptions(),
        const SizedBox(height: 50),
        _buildNextButton(),
      ],
    );
  }

  // Método para construir a terceira página
  Widget _buildPage3() {
    return Wrap(
      children: [
        _buildText('Boas Vendas', fontSize: 0.5),
        const SizedBox(height: 10),
        _buildDropdownButtonFormField(
            'Artigo', _selectedArtigo, ['teste', 'teste2']),
        const SizedBox(height: 70),
        _buildDropdownButtonFormField('Detalhe do artigo',
            _selectedDetalheDoArtigo, ['teste3', 'teste4']),
        const SizedBox(height: 60),
        _buildTextFormField('Unidade', controller: UndController),
        const SizedBox(height: 70),
        _buildQuantidadeAndValorFields(),
        const SizedBox(height: 60),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFD52B1E),
                  minimumSize: const Size(150, 50),
                ),
                child: const Text(
                  'Finalizar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Método para construir um Text Widget
  Widget _buildText(String text, {double fontSize = 1.0}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.07 * fontSize,
        color: const Color(0xFFD52B1E),
      ),
    );
  }

  // Método para construir um TextFormField
  Widget _buildTextFormField(
    String label, {
    TextEditingController? controller,
    String? Function(String?)? validator,
    String? hintText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }

  // Método para construir os campos de data
  Widget _buildDateFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildTextFormField(
            'Data do pedido',
            controller: DtPedidoController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, informe a data do pedido.';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildTextFormField(
            'Data de entrega',
            controller: DtEntregaController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, informe a data de entrega.';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  // Método para construir um DropdownButtonFormField
  Widget _buildDropdownButtonFormField(
      String label, String? value, List<String> options) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      items: options.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          value = newValue;
        });
      },
    );
  }

  // Método para construir os campos de frete
  Widget _buildFreteOptions() {
    return Column(
      children: [
        _buildText('Frete', fontSize: 0.7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildRadio('Por conta do emitente'),
            _buildRadio('Por conta do destinatário'),
          ],
        ),
      ],
    );
  }

  // Método para construir um Radio Widget
  Widget _buildRadio(String label) {
    return Row(
      children: [
        Radio<String>(
          value: label,
          groupValue: _selectedOption,
          onChanged: (String? value) {
            setState(() {
              _selectedOption = value!;
            });
          },
        ),
        Text(label),
      ],
    );
  }

  // Método para construir os campos de quantidade e valor
  Widget _buildQuantidadeAndValorFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildTextFormField(
            'Quantidade',
            controller: QtdController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, informe a quantidade.';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildTextFormField(
            'Valor bruto',
            controller: VrBrutoController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, informe o valor bruto.';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  // Método para construir o botão "Próximo"
  Widget _buildNextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            if (_pageController.page == 0) {
              _avancarParaProximaPagina1();
            } else {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFD52B1E),
            minimumSize: const Size(150, 50),
          ),
          child: const Text(
            'Próximo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
