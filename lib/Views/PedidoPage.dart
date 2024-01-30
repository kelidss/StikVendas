import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stik_vendas/Controllers/Controller_Pedido.dart';
import 'package:stik_vendas/Views/FeedsPage.dart';
import 'package:stik_vendas/Views/HomePage.dart';
import 'package:stik_vendas/Views/LoginPage.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PedidoPageState createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  int _currentIndex = 0;
  // late DateTime _selectedDate;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  bool _todosCamposPreenchidos() {
    return DtPedidoController.text.isNotEmpty &&
        DtEntregaController.text.isNotEmpty &&
        VendedorController.text.isNotEmpty &&
        ClienteController.text.isNotEmpty &&
        TpDocumentoController.text.isNotEmpty &&
        TipoCobracaController.text.isNotEmpty &&
        FormaPgtoController.text.isNotEmpty &&
        FreteController.text.isNotEmpty &&
        ObservacaoController.text.isNotEmpty &&
        OcClienteController.text.isNotEmpty &&
        ArtigoController.text.isNotEmpty &&
        DetArtigoController.text.isNotEmpty &&
        UndController.text.isNotEmpty &&
        QtdController.text.isNotEmpty &&
        VrBaseController.text.isNotEmpty &&
        PrEfetivoController.text.isNotEmpty &&
        VrBrutoController.text.isNotEmpty;
  }

  void _avancarParaProximaPagina() {
    if (_todosCamposPreenchidos()) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      (
      ) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.scale,
          title: 'preencha todos os campos',
        //  desc: 'Tem certeza que deseja sair?',
        //  btnCancelOnPress: () {},
          btnOkOnPress: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PedidoPage()),
            );
          },
        ).show();
      };
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
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          controller: _pageController,
          children: [
            Wrap(
              children: [
                const SizedBox(
                  height: 15,
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
                const SizedBox(height: 10),
                TextFormField(
                  // TextField(
                  controller: DtEntregaController,
                  //  keyboardType:TextInputType.datetime,
                  decoration: const InputDecoration(
                      labelText: 'Data Entrega',
                      hintText: '**/**/****',
                      border: OutlineInputBorder(),
                      //   contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                  inputFormatters: [MaskTextInputFormatter(mask: '##/##/####')],
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: VendedorController,
                  decoration: const InputDecoration(
                    labelText: 'Vendedor',
                    border: OutlineInputBorder(),
                    // contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior:
                        FloatingLabelBehavior.auto, // Rótulo flutuante
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: ClienteController,
                  decoration: const InputDecoration(
                    labelText: 'Cliente',
                    border: OutlineInputBorder(),
                    //  contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: TpDocumentoController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de Documento',
                    border: OutlineInputBorder(),
                    //   contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: TipoCobracaController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de Cobrança',
                    border: OutlineInputBorder(),
                    //  contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: FormaPgtoController,
                  decoration: const InputDecoration(
                    labelText: 'Forma de Pagamento',
                    border: OutlineInputBorder(),
                    //contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: FreteController,
                  decoration: const InputDecoration(
                    labelText: 'Frete',
                    border: OutlineInputBorder(),
                    //  contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: ObservacaoController,
                  decoration: const InputDecoration(
                    labelText: 'Observação',
                    border: OutlineInputBorder(),
                    //  contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                //Botão Avançar
                Expanded(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    //  if (_todosCamposPreenchidos())
                      InkWell(
                        onTap: () {
                          _pageController.nextPage(
                             duration: const Duration(milliseconds: 300),
                             curve: Curves.easeInOut);
                          _avancarParaProximaPagina();
                       },
                      
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(
                                10), // Bordas arredondadas
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
            Wrap(
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: ArtigoController,
                  decoration: const InputDecoration(
                    labelText: 'Artigo',
                    border: OutlineInputBorder(),
                    //   contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior:
                        FloatingLabelBehavior.auto, // Rótulo flutuante
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: DetArtigoController,
                  decoration: const InputDecoration(
                      labelText: 'Detalhe do Artigo',
                      border: OutlineInputBorder(),
                      //       contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: UndController,
                  decoration: const InputDecoration(
                    labelText: 'Unidade',
                    border: OutlineInputBorder(),
                    //   contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior:
                        FloatingLabelBehavior.auto, // Rótulo flutuante
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: QtdController,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                    border: OutlineInputBorder(),
                    // contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: VrBaseController,
                  decoration: const InputDecoration(
                    labelText: 'Valor Base',
                    border: OutlineInputBorder(),
                    // contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: PrEfetivoController,
                  decoration: const InputDecoration(
                    labelText: 'Preço Efetivo',
                    border: OutlineInputBorder(),
                    //  contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: VrBrutoController,
                  decoration: const InputDecoration(
                    labelText: 'Valor Bruto',
                    border: OutlineInputBorder(),
                    //  contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                          _avancarParaProximaPagina();
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(
                                10), // Bordas arredondadas
                          ),
                          child: const Center(
                            child: Text(
                              'Resumo',
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
            Container(
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
            ),
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
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
