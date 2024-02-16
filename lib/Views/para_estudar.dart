// ignore_for_file: use_build_context_synchronously
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:stik_vendas/Controllers/PedidoController.dart';
import 'package:stik_vendas/Views/FeedsPageView.dart';
import 'package:stik_vendas/Views/HomePageView.dart';
import 'package:stik_vendas/Views/LoginPageView.dart';
import 'package:intl/intl.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({Key? key}) : super(key: key);

  @override
  _PedidoPageState createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  String? _selectedTipoDocumento;
  String? _selectedTipoCobranca;
  String? _selectedFormaPagamento;
  String? _selectedArtigo;
  String? _selectedDetalheDoArtigo;
  String _selectedOption = '';

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                _clearFieldsAndNavigate(context);
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
        _buildText(
          'Boas Vendas',
          fontSize: 0.5,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        _buildDateFields(),
        const SizedBox(height: 70),
        _buildTextFormField('Cliente', controller: ClienteController),
        const SizedBox(height: 70),
        _buildDropdownButtonFormField('Tipo de Documento',
            _selectedTipoDocumento, ['Pedido DC', 'Nota fiscal eletrônica']),
        const SizedBox(height: 70),
        _buildDropdownButtonFormField(
            'Tipo de Cobrança', _selectedTipoCobranca, ['Boleto', 'PIX']),
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
        const SizedBox(height: 70),
        _buildNextButton(),
      ],
    );
  }

  Widget _buildPage2() {
    return Wrap(children: [
      _buildText(
        'Boas Vendas',
        fontSize: 0.5,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 0.5,
        ),
      ),
      const SizedBox(height: 10),
      _buildTextFormField('Observação',
          controller: ObservacaoController, hintText: 'não obrigatório'),
      const SizedBox(height: 70),
      _buildTextFormField('OC Cliente',
          controller: OcClienteController, hintText: 'não obrigatório'),
      const SizedBox(height: 70),
      _buildFreteSection(),
      //   const SizedBox(height: 70),
      _buildButtonRow2()
    ]);
  }

  Widget _buildPage3() {
    return Wrap(
      children: [
        _buildText(
          'Boas Vendas',
          fontSize: 0.5,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        _buildDropdownButtonFormField(
            'Artigo', _selectedArtigo, ['teste', 'teste2']),
        const SizedBox(height: 70),
        _buildDropdownButtonFormField('Detalhe do artigo',
            _selectedDetalheDoArtigo, ['teste3', 'teste4']),
        const SizedBox(height: 60),
        Row(
          children: [
            Expanded(
              child: _buildTextFormField('Unidade', controller: UndController),
            ),
            const SizedBox(width: 8),
            Expanded(
              child:
                  _buildTextFormField('Quantidade', controller: QtdController),
            ),
          ],
        ),
        const SizedBox(height: 70),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: _buildCurrencyTextFormField('Valor Base',
                    controller: VrBaseController),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: _buildCurrencyTextFormField('Preço Efetivo',
                    controller: PrEfetivoController),
              ),
            ),
          ],
        ),
        const SizedBox(height: 70),
        TextFormField(
          controller: VrBrutoController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.monetization_on),
            hintText: '0,0',
            border: const OutlineInputBorder(),
            labelText: 'Valor Bruto',
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.green;
              return TextStyle(color: color, letterSpacing: 1);
            }),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CurrencyPtBrInputFormatter()
          ],
          keyboardType: TextInputType.number,
          validator: (String? value) {
            if (value == null || value == '') {
              return '';
            }
          },
          autovalidateMode: AutovalidateMode.always,
        ),
        const SizedBox(height: 60),
        _buildButtonRow(),
      ],
    );
  }

  Widget _buildButtonRow() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildVoltarButton(),
          SizedBox(width: 200),
          _buildButton(Icons.done, () => _showDialog(context)),
        ],
      ),
    );
  }

  Widget _buildButtonRow2() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildVoltarButton(),
          SizedBox(width: 200),
          _buildButton2(Icons.done, () => _showDialog(context)),
        ],
      ),
    );
  }

  Widget _buildButton2(IconData icon, Function() onTap) {
    return InkWell(
      onTap: () {
        if (_pageController.page! < 2) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFD52B1E),
        ),
        child: const Icon(
          Icons.navigate_next,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFD52B1E),
        ),
        child: const Icon(
          Icons.navigate_next,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    if (UndController.text.isNotEmpty &&
        QtdController.text.isNotEmpty &&
        VrBrutoController.text.isNotEmpty) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'Pedido feito!',
        btnOkOnPress: () {
          _clearFieldsAndNavigate(context);
        },
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.scale,
        title: 'Erro',
        desc: 'Preencha todos os campos obrigatórios',
        btnCancelOnPress: () {},
        btnCancelText: 'Fechar',
      ).show();
    }
  }

  void _clearFieldsAndNavigate(BuildContext context) {
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
    ArtigoController.clear();
    DetArtigoController.clear();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PedidoPage()),
    );
  }

  Widget _buildText(String text,
      {double fontSize = 0.2, required TextStyle style}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.07 * fontSize,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

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
        border: const OutlineInputBorder(),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.green;
            return TextStyle(color: color, letterSpacing: 1);
          },
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return '';
        }
      },
      autovalidateMode: AutovalidateMode.always,
    );
  }

  Widget _buildDateFields() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: _buildDateTextFormField('Data Pedido',
                controller: DtPedidoController),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: _buildDateTextFormField('Data Entrega',
                controller: DtEntregaController),
          ),
        ),
      ],
    );
  }

  Widget _buildDateTextFormField(
    String label, {
    TextEditingController? controller,
    String? Function(String?)? validator,
    String? hintText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.calendar_month),
        hintText: hintText ?? '00/00/0000',
        border: const OutlineInputBorder(),
        isDense: false,
        labelText: label,
        floatingLabelStyle:
            const TextStyle(color: Colors.green, letterSpacing: 1),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      ),
      inputFormatters: [MaskTextInputFormatter(mask: '##/##/####')],
      keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value == null || value == '') {
          return '';
        }
      },
      autovalidateMode: AutovalidateMode.always,
    );
  }

  Widget _buildDropdownButtonFormField(
      String label, String? value, List<String> options) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        floatingLabelStyle:
            const TextStyle(color: Colors.green, letterSpacing: 1),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return '';
        }
      },
      autovalidateMode: AutovalidateMode.always,
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
          activeColor: Colors.red,
        ),
        Text(label),
      ],
    );
  }

  Widget _buildNextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            if (_pageController.page == 0) {
              _avancarParaProximaPagina1();
            } else {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFD52B1E),
            ),
            child: const Icon(
              Icons.navigate_next,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVoltarButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            if (_pageController.page! > 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFD52B1E),
            ),
            child: const Icon(
              Icons.navigate_before,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  void _avancarParaProximaPagina1() {
    if (DtPedidoController.text.isNotEmpty &&
            DtEntregaController.text.isNotEmpty &&
            ClienteController.text.isNotEmpty
        //     _selectedTipoDocumento != null &&
        //   _selectedTipoCobranca != null &&
        // _selectedFormaPagamento != null
        ) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.scale,
        title: 'Erro',
        desc: 'Preencha todos os campos obrigatórios',
        btnCancelOnPress: () {},
        btnCancelText: 'Fechar',
      ).show();
    }
  }

  Widget _buildFreteSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Frete:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              _buildRadio('CIF'),
              _buildRadio('FOB'),
              _buildRadio('Terceiros'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              _buildRadio('Remetente'),
              _buildRadio('Destinatário'),
              _buildRadio('Sem frete'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencyTextFormField(
    String label, {
    TextEditingController? controller,
    String? Function(String?)? validator,
    String? hintText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.monetization_on),
        hintText: hintText,
        border: const OutlineInputBorder(),
        labelText: label,
        floatingLabelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.error)
              ? Theme.of(context).colorScheme.error
              : Colors.green;
          return TextStyle(color: color, letterSpacing: 1);
        }),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyPtBrInputFormatter()
      ],
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value == null || value == '') {
          return '';
        }
      },
      autovalidateMode: AutovalidateMode.always,
    );
  }
}
