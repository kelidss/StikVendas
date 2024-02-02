import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stik_vendas/Controllers/Controller_Pedido.dart';
import 'package:stik_vendas/Views/FeedsPage.dart';
import 'package:stik_vendas/Views/HomePage.dart';
import 'package:stik_vendas/Views/LoginPage.dart';

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
      /* AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.scale,
        title: 'Preencha todos os campos',
        btnOkOnPress: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PedidoPage()));
        },
      ).show();*/
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
      /* AwesomeDialog(
       context: context,
        dialogType: DialogType.warning,
       animType: AnimType.scale,
        title: 'Preencha todos os campos',
        btnOkOnPress: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const PedidoPage()));
        },
      ).show();*/
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
        padding: const EdgeInsets.all(20.0),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
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
                    hintText: '00/00/0000',
                    border: OutlineInputBorder(),
                    // borderSide: BorderSide()
                    //  color: DtPedidoController.text.isEmpty
                    //      ? Colors.red
                    //     : Colors.grey,
                    //   ),
                    //),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  //  validator: (DtPedidoController)=> DtPedidoController!.isEmpty ?,
                  inputFormatters: [MaskTextInputFormatter(mask: '##/##/####')],
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: DtEntregaController,
                  decoration: const InputDecoration(
                      labelText: 'Data Entrega',
                      hintText: '00/00/0000',
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
                    border: OutlineInputBorder(borderSide: BorderSide()),
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
                const SizedBox(height: 55),
                TextFormField(
                  controller: FreteController,
                  decoration: const InputDecoration(
                    labelText: 'Frete',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
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
                            color: const Color(0xFFD52B1E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Itens',
                              style: TextStyle(
                                color: Colors.white,
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
            Wrap(
              children: [
                const SizedBox(
                  height: 55,
                ),
                DropdownButtonFormField<String>(
                  value: _selectedArtigo,
                  onChanged: (value) {
                    setState(() {
                      _selectedArtigo = value;
                    });
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
                  inputFormatters: [MaskTextInputFormatter(mask: '#,####.##')],
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 55),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          // Limpando os campos ao clicar em "Voltar"
                          /*    DtPedidoController.clear();
                          DtEntregaController.clear();
                          VendedorController.clear();
                          ClienteController.clear();
                          FreteController.clear();
                          ObservacaoController.clear();
                          UndController.clear();
                          QtdController.clear();
                          OcClienteController.clear();
                          VrBaseController.clear();
                          PrEfetivoController.clear();
                          VrBrutoController.clear();*/

                          // Navegação de volta para a HomePage
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD52B1E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Voltar',
                              style: TextStyle(
                                color: Colors.white,
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
                          {
                            // Limpar todos os campos antes de exibir o diálogo
                            DtPedidoController.clear();
                            DtEntregaController.clear();
                            VendedorController.clear();
                            ClienteController.clear();
                            FreteController.clear();
                            ObservacaoController.clear();
                            UndController.clear();
                            QtdController.clear();
                            OcClienteController.clear();
                            VrBaseController.clear();
                            PrEfetivoController.clear();
                            VrBrutoController.clear();
                            //if (_avancarParaProximaPagina2()) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.scale,
                              title: 'Gravado com sucesso',
                              btnOkOnPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PedidoPage()));
                              },
                            ).show();
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD52B1E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Gravar',
                              style: TextStyle(
                                color: Colors.white,
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
            //    ],
            //   ),
            // resumo do pedido
            /*  Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('Campo')),
                      DataColumn(label: Text('Valor')),
                    ],
                    rows: [
                      DataRow(cells: [
                        const DataCell(Text('DtPedido')),
                        DataCell(Text(DtPedidoController.text)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Cliente')),
                        DataCell(Text(ClienteController.text)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Artigo')),
                        DataCell(Text(ArtigoController.text)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Detalhe do Artigo')),
                        DataCell(Text(DetArtigoController.text)),
                      ]),
                    ],
                  ),
                ],
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
        onTap: (index) async {
          setState(() {
            _currentIndex = index;
          });
          await Future.delayed(const Duration(seconds: 1));
          if (_currentIndex == 1) {
            // ignore: use_build_context_synchronously
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.scale,
              title: 'Confirmação',
              desc: 'Tem certeza que deseja sair?',
              btnCancelOnPress: () {},
              btnOkOnPress: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ).show();
          } else if (_currentIndex == 0) {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (_currentIndex == 2) {
            // ignore: use_build_context_synchronously
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeedsPage()));
          }
        },
      ),
    );
  }
}
