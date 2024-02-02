import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stik_vendas/Controllers/Controller_Pedido.dart';
import 'package:stik_vendas/Views/FeedsPage.dart';
import 'package:stik_vendas/Views/LoginPage.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PedidoPageState createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  int _currentIndex = 0;
//  bool value = false;
  /*final checkboxes = [
    CheckboxModel(title: 'Test 1', value: false),
    CheckboxModel(title: 'Test 2', value: false),
    CheckboxModel(title: 'Toggle Group', value: false),
    CheckboxModel(title: 'Test 3', value: false, shouldToggle: false),
    CheckboxModel(title: 'Test 4', value: false, shouldToggle: false),
  ]; */

  /* @override
    Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
    TextStyle style2 = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
    List<Widget> checkboxModels = buildCheckboxes(checkboxes);*/
  /* List<Map> categories = [
    {"name": "opcao1", "isChecked": false},
    {"name": "opcao2", "isChecked": false},
    {"name": "opcao3", "isChecked": false}
  ];*/
  late PageController _pageController;

  // final List<bool> _freteCheckboxValues = [false, false, false];

  @override
  void initState() {
    super.initState();
    textEditingController = textEditingController;

    _pageController = PageController();
  }

  String? _selectedTipoDocumento;
  String? _selectedTipoCobranca;
  String? _selectedFormaPagamento;
  String? _selectedArtigo;
  String? _selectedDetalheDoArtigo;

  _todosCamposPreenchidos1() {
    return DtPedidoController.text.isNotEmpty &&
        DtEntregaController.text.isNotEmpty &&
        VendedorController.text.isNotEmpty &&
        ClienteController.text.isNotEmpty;
    // &&
    // TpDocumentoController.text.isNotEmpty &&
    //  TipoCobracaController.text.isNotEmpty &&
    // FormaPgtoController.text.isNotEmpty &&
    //  FreteController.text.isNotEmpty;
  }

  _avancarParaProximaPagina1() {
    if (_todosCamposPreenchidos1()) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.scale,
        title: 'Preencha todos os campos',
        btnOkOnPress: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PedidoPage()));
        },
      ).show();
    }
  }

  _todosCamposPreenchidos2() {
    return
        //ArtigoController.text.isNotEmpty &&
        // DetArtigoController.text.isNotEmpty &&

        UndController.text.isNotEmpty &&
            QtdController.text.isNotEmpty &&
            VrBaseController.text.isNotEmpty &&
            PrEfetivoController.text.isNotEmpty &&
            VrBrutoController.text.isNotEmpty;
  }

  _avancarParaProximaPagina2() {
    if (_todosCamposPreenchidos2()) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.scale,
        title: 'Preencha todos os campos',
        btnOkOnPress: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const PedidoPage()));
        },
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //  length: 3,
    //  child: build(
    //   Builder(BuildContext context ){
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
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          // scrollDirection: Axis.horizontal,
          controller: _pageController,
          children: [
            // pagina 1
            Wrap(
              children: [
                const SizedBox(
                  height: 55,
                ),
                TextFormField(
                  controller: DtPedidoController,
                  decoration: const InputDecoration(
                    labelText: 'Data Pedido',
                    hintText: '**/**/****',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  inputFormatters: [MaskTextInputFormatter(mask: '##/##/####')],
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: DtEntregaController,
                  decoration: const InputDecoration(
                      labelText: 'Data Entrega',
                      hintText: '**/**/****',
                      border: OutlineInputBorder(),
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                  inputFormatters: [MaskTextInputFormatter(mask: '##/##/####')],
                  keyboardType: TextInputType.datetime,
                ),

                const SizedBox(height: 55),
                TextFormField(
                  controller: VendedorController,
                  decoration: const InputDecoration(
                    labelText: 'Vendedor',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 55),
                TextFormField(
                    controller: ClienteController,
                    decoration: const InputDecoration(
                      labelText: 'Cliente',
                      border: OutlineInputBorder(),
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    )),

                const SizedBox(height: 55),
                DropdownButtonFormField<String>(
                  value: _selectedTipoDocumento,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedTipoDocumento = newValue;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'RG',
                      child: Text('RG'),
                    ),
                    DropdownMenuItem(
                      value: 'CPF',
                      child: Text('CPF'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Tipo de Documento',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 55),
                DropdownButtonFormField<String>(
                  value: _selectedTipoCobranca,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedTipoCobranca = newValue;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Opção 1',
                      child: Text('Opção 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Opção 2',
                      child: Text('Opção 2'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Tipo de Cobrança',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 55),
                DropdownButtonFormField<String>(
                  value: _selectedFormaPagamento,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedFormaPagamento = newValue;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'BOLETO',
                      child: Text('BOLETO'),
                    ),
                    DropdownMenuItem(
                      value: 'PIX',
                      child: Text('PIX'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Forma de pagamento',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),

                //  Container(

                //:

                // transformar isso em um checkbox

                const SizedBox(height: 55),
                /*Column(
                  children: [
                    checkboxModels[2],
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      Decoration: BoxDecoration(
                        Border(''
                          Border.all(),
                        )
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                         children:[
                          Padding(padding:  const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text("Group 1", style: style2),
                          ),
                          ),
                           checkboxModels[0],
                           checkboxModels[1],
                         ],
                      ),
                    )
                  ],
                 ),*/
                TextFormField(
                  controller: FreteController,
                  decoration: const InputDecoration(
                    labelText: 'Frete',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),

                /* Column(
                    children: categories.map((escolha) {
                  return CheckboxListTile(
                      activeColor: Colors.deepPurpleAccent,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      value: escolha["isChecked"],
                      title: Text(escolha["name"]),
                      onChanged: (val) {
                        setState(() {
                          escolha["isChecked"] = val;
                        });
                      });
                }).toList()),
                //   TextFormField(
                //  controller: FreteController,
                // decoration: const InputDecoration(
                //   labelText: 'Frete',
                //   border: OutlineInputBorder(),
                //   isDense: true,
                //  floatingLabelBehavior: FloatingLabelBehavior.auto,
                //  ),
                //   ),
                /*  const SizedBox(height: 10),
                Column(
                  children: [
                    _buildCheckboxOption('Opção 1', 0),
                    _buildCheckboxOption('Opção 2', 1),
                    _buildCheckboxOption('Opção 3', 2),
                  ],
                ),*/
                Wrap(
                  children: categories.map((escolha) {
                    if (escolha["isChecked"] == true) {
                      return Card(
                        elevation: 3,
                        color: Colors.deepPurpleAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                escolha["name"],
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    escolha["isChecked"] =
                                        !escolha["isChecked"];
                                  });
                                },
                                child: const Icon(
                                  Icons.delete_forever_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Container();
                  }).toList(),
                ),*/
                const SizedBox(height: 55),
                TextFormField(
                  controller: ObservacaoController,
                  decoration: const InputDecoration(
                    labelText: 'Observação',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),

                const SizedBox(height: 55),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          _avancarParaProximaPagina1();
                        },
                        child: Container(
                          width: 80,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Itens',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //pagina 2

            // child: PageView(
            //  scrollDirection: Axis.vertical ,
            //controller: _pageController,

            //PageView(
            Wrap(
              children: [
                const SizedBox(
                  height: 55,
                ),
                DropdownButtonFormField<String>(
                  //value: _selectedArtigo,
                  onChanged: (value) {
                    // setState(() {
                    //   _selectedArtigo = value;
                    //  });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'teste',
                      child: Text('teste'),
                    ),
                    DropdownMenuItem(
                      value: 'teste2',
                      child: Text('teste2'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Artigo',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedDetalheDoArtigo,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedDetalheDoArtigo = newValue;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'teste3',
                      child: Text('teste3'),
                    ),
                    DropdownMenuItem(
                      value: 'teste4',
                      child: Text('teste4'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Detalhe do artigo',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: UndController,
                  decoration: const InputDecoration(
                    labelText: 'Unidade',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: QtdController,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: OcClienteController,
                  decoration: const InputDecoration(
                    labelText: 'OC Cliente',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: VrBaseController,
                  decoration: const InputDecoration(
                    hintText: '0,0',
                    labelText: 'Valor Base',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),

                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  //  inputFormatters:[
                  // FilteringTextInputFormatter.allow(RegExp(r'^d\+\\.?\d{0,1}'))
                  // ],

                  //    MaskTextInputFormatter(mask: '#,###0.00')],
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: PrEfetivoController,
                  decoration: const InputDecoration(
                    hintText: '0,0',
                    labelText: 'Preço Efetivo',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  inputFormatters: [MaskTextInputFormatter(mask: '#,###0.00')],
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: VrBrutoController,
                  decoration: const InputDecoration(
                    hintText: '0,0',
                    labelText: 'Valor Bruto',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  inputFormatters: [MaskTextInputFormatter(mask: '#,###0.00')],
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 55),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeInOut);
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Voltar',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 55,
                        width: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeedsPage()),
                          );
                          //  _avancarParaProximaPagina2();
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Ver Pedidos',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
            //  ),
            // tentando adicionar um indicador para as pages
            /* SmoothPageIndicator(controller: _pageController, count: 3,
             effect: JumpingDotEffect(
              activeDotColor: Colors.deepPurple,
              dotColor: Colors.deepPurple.shade100,
              dotHeight: 30,
              dotWidth: 30,
              spacing: 16,
              //verticalOffset: 50,
              jumpScale: 3,
            ),
            ),*/
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color(0xFFD52B1E),
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.exit_to_app, color: Colors.white),
          Icon(Icons.feed, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (_currentIndex == 0) {
            Navigator.pop(context);
          } else if (_currentIndex == 1) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          } else if (_currentIndex == 2) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => FeedsPage()));
          }
        },
      ),
    );
  }
}

  /*Widget _buildCheckboxOption(String label, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Checkbox(
          value: _freteCheckboxValues[index],
          onChanged: (value) {
            setState(() {
              _freteCheckboxValues[index] = value ?? false;
            });
          },
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    ),
  );
}
}*/
