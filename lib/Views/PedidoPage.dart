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
        // appBar: PreferredSize(
        // preferredSize: Size.fromHeight(80),
        //  child: AppBar,
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
        padding: const EdgeInsets.all(15.0),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            // pagina 1
            Wrap(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: DtPedidoController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          hintText: '00/00/0000',
                          border: const OutlineInputBorder(),
                          isDense: true,
                        labelText: 'Data Pedido',
                 //       errorText: DtPedidoController.text.isEmpty ? 'campo obrigatorio' : null, 
                    //    errorBorder: OutlineInputBorder(
                         // borderSide: BorderSide(color: Colors.red)
                        //)
                            floatingLabelStyle:
                              MaterialStateTextStyle.resolveWith(
                            (Set<MaterialState> states) {
                              final Color color =
                                  states.contains(MaterialState.error)
                                      ? Theme.of(context).colorScheme.error
                                      : Colors.green;
                              return TextStyle(color: color, letterSpacing: 1);
                            },
                          ),
                        ),
                        inputFormatters: [
                          MaskTextInputFormatter(mask: '##/##/####')
                        ],
                        keyboardType: TextInputType.datetime,
                        validator: (String? value) {
                          if (value == null || value == '') {
                            return '';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.always,
                      ),
                    ),
                
                    const SizedBox(width: 20), // Espaçamento entre os campos
                    Expanded(
                      child: TextFormField(
                        controller: DtEntregaController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.calendar_month),
                          hintText: '00/00/0000',
                          border: const OutlineInputBorder(),
                          isDense: true,
                          labelText: 'Data Entrega',
                          floatingLabelStyle:
                              MaterialStateTextStyle.resolveWith(
                            (Set<MaterialState> states) {
                              final Color color =
                                  states.contains(MaterialState.error)
                                      ? Theme.of(context).colorScheme.error
                                      : Colors.green;
                              return TextStyle(color: color, letterSpacing: 1);
                            },
                          ),
                        ),
                        inputFormatters: [
                          MaskTextInputFormatter(mask: '##/##/####')
                        ],
                        keyboardType: TextInputType.datetime,
                        validator: (String? value) {
                          if (value == null || value == '') {
                            return '';
                          }
                       //   return null;
                        },
                        autovalidateMode: AutovalidateMode.always,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: VendedorController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.people),
                      border: const OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Vendedor',
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      })),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: ClienteController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.people),
                    border: const OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Cliente',
                    floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      },
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
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
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.list),
                    border: const OutlineInputBorder(),
                    //  contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    // floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Tipo de Documento',
                    floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      },
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
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
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.list),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide()),
                      isDense: true,
                      labelText: 'Tipo de Cobrança',
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      })),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
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
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.monetization_on),
                      border: const OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Forma de pagamento',
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      })),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: FreteController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.delivery_dining),
                    labelText: 'Frete',
                    hintText: 'não obrigatório',
                    border: OutlineInputBorder(),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: ObservacaoController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.pageview),
                    labelText: 'Observação',
                    hintText: 'não obrigatório',
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
                        child: const SizedBox(
                          width: 80,
                          height: 45,
                          child: Center(
                            child: Icon((Icons.navigate_next)),
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
                  decoration: InputDecoration(
                      labelText: 'Artigo',
                      prefixIcon: const Icon(Icons.note),
                      border: const OutlineInputBorder(),
                      isDense: true,
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      })),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
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
                  decoration: InputDecoration(
                      labelText: 'Detalhe do artigo',
                      prefixIcon: const Icon(Icons.note),
                      border: const OutlineInputBorder(),
                      isDense: true,
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      })),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: UndController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.list_alt),
                      labelText: 'Unidade',
                      border: const OutlineInputBorder(),
                      isDense: true,
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      })),
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: QtdController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.list_alt),
                    labelText: 'Quantidade',
                    border: const OutlineInputBorder(),
                    isDense: true,
                    floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      },
                    ),
                  ),
                  inputFormatters: [MaskTextInputFormatter(mask: '#,####.##')],
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: OcClienteController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.shopping_bag),
                      labelText: 'OC Cliente',
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 10),
                      isDense: true,
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      })),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: VrBaseController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.monetization_on),
                    hintText: '0,0',
                    labelText: 'Valor Base',
                    border: const OutlineInputBorder(),
                    isDense: true,
                    floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      },
                    ),
                  ),
                  inputFormatters: [MaskTextInputFormatter(mask: '#,####.##')],
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: PrEfetivoController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.monetization_on),
                    hintText: '0,0',
                    labelText: 'Preço Efetivo',
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      },
                    ),
                  ),
                  inputFormatters: [MaskTextInputFormatter(mask: '#,####.##')],
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                const SizedBox(height: 55),
                TextFormField(
                  controller: VrBrutoController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.monetization_on),
                    hintText: '0,0',
                    border: const OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Valor Bruto',
                    floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      },
                    ),
                  ),
                  inputFormatters: [MaskTextInputFormatter(mask: '#,####.##')],
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                const SizedBox(height: 55),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          // Limpando os campos ao clicar em "Voltar"
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

                          // Navegação de volta para a HomePage
                          Navigator.pop(context);
                        },
                        child: const SizedBox(
                          width: 100,
                          height: 50,
                          child: Center(
                            child: Icon(Icons.navigate_before),
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
                                        builder: (context) => HomePage()));
                              },
                            ).show();
                          }
                        },
                        child: const SizedBox(
                          width: 100,
                          height: 50,
                          child: Center(child: Icon(Icons.navigate_next)),
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
            /*  */
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
