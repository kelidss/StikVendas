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
    textEditingController = textEditingController;
    _pageController = PageController();
  }

  String? _selectedTipoDocumento;
  String? _selectedTipoCobranca;
  String? _selectedFormaPagamento;
  String? _selectedArtigo;
  String? _selectedDetalheDoArtigo;
  String _selectedOption = '';

  _todosCamposPreenchidos1() {
    return DtPedidoController.text.isNotEmpty &&
        DtEntregaController.text.isNotEmpty &&
        //  VendedorController.text.isNotEmpty &&
        ClienteController.text.isNotEmpty;
    //&&
    //  TpDocumentoController.text.isNotEmpty &&
    // TipoCobracaController.text.isNotEmpty &&
    //  FormaPgtoController.text.isNotEmpty;
  }

  _avancarParaProximaPagina1() {
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
              "Campos obigatórios vazios",
              textAlign: TextAlign.center,
            ),
            shadowColor: Colors.red,
            icon: (Icon(Icons.error)),
            actions: <Widget>[
              InkWell(
                child: Text("Fechar"),
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
        padding: const EdgeInsets.all(3.0),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          //scrollDirection: Axis.horizontal,
          controller: _pageController,
          children: [
            // pagina 1
            Wrap(
              children: [
                const Text(
                  'Boas Vendas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 0.5,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: DtPedidoController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.calendar_month),
                            hintText: '00/00/0000',
                            border: const OutlineInputBorder(),
                            isDense: false,
                            labelText: 'Data Pedido',
                            floatingLabelStyle:
                                MaterialStateTextStyle.resolveWith(
                              (Set<MaterialState> states) {
                                final Color color =
                                    states.contains(MaterialState.error)
                                        ? Theme.of(context).colorScheme.error
                                        : Colors.green;
                                return TextStyle(
                                    color: color, letterSpacing: 1);
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20)),
                        inputFormatters: [
                          MaskTextInputFormatter(mask: '##/##/####')
                        ],
                        keyboardType: TextInputType.datetime,
                        validator: (String? value) {
                          if (value == null || value == '') {
                            return '';
                          }
                        },
                        autovalidateMode: AutovalidateMode.always,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: DtEntregaController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.calendar_month),
                            hintText: '00/00/0000',
                            border: const OutlineInputBorder(),
                            isDense: false,
                            labelText: 'Data Entrega',
                            floatingLabelStyle:
                                MaterialStateTextStyle.resolveWith(
                              (Set<MaterialState> states) {
                                final Color color =
                                    states.contains(MaterialState.error)
                                        ? Theme.of(context).colorScheme.error
                                        : Colors.green;
                                return TextStyle(
                                    color: color, letterSpacing: 1);
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20)),
                        inputFormatters: [
                          MaskTextInputFormatter(mask: '##/##/####')
                        ],
                        keyboardType: TextInputType.datetime,
                        validator: (String? value) {
                          if (value == null || value == '') {
                            return '';
                          }
                        },
                        autovalidateMode: AutovalidateMode.always,
                      ),
                    ),
                  ],
                ),
                /*     const SizedBox(height: 55),
                TextFormField(
                  controller: VendedorController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.people),
                      border: const OutlineInputBorder(),
                      isDense: false,
                      labelText: 'Vendedor',
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      }),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20)),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),*/
                const SizedBox(height: 55),
                TextFormField(
                  controller: ClienteController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.people),
                      border: const OutlineInputBorder(),
                      isDense: false,
                      labelText: 'Cliente',
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                          final Color color =
                              states.contains(MaterialState.error)
                                  ? Theme.of(context).colorScheme.error
                                  : Colors.green;
                          return TextStyle(color: color, letterSpacing: 1);
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20)),
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
                      isDense: false,
                      labelText: 'Tipo de Documento',
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                          final Color color =
                              states.contains(MaterialState.error)
                                  ? Theme.of(context).colorScheme.error
                                  : Colors.green;
                          return TextStyle(color: color, letterSpacing: 1);
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20)),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                SizedBox(height: 55),
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
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      isDense: false,
                      labelText: 'Tipo de Cobrança',
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.green;
                        return TextStyle(color: color, letterSpacing: 1);
                      }),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20)),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                SizedBox(height: 55),
                DropdownButtonFormField<String>(
                  value: _selectedFormaPagamento,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedFormaPagamento = newValue;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: '30 DIAS',
                      child: Text('30 DIAS'),
                    ),
                    DropdownMenuItem(
                      value: '60 DIAS',
                      child: Text('60 DIAS'),
                    ),
                    DropdownMenuItem(
                      value: '90 DIAS',
                      child: Text('90 DIAS'),
                    ),
                    DropdownMenuItem(
                      value: '51 DIAS',
                      child: Text('51 DIAS'),
                    ),
                    DropdownMenuItem(
                      value: '71 DIAS',
                      child: Text('71 DIAS'),
                    ),
                    DropdownMenuItem(
                      value: '111 DIAS',
                      child: Text('111 DIAS'),
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
                      }),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20)),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null; // Retorna null se o valor for válido.
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                
                /*
                */

                /**/
                /*  */
                const SizedBox(height: 50),
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
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.navigate_next,
                                      // size:18
                                    ),
                                    SizedBox(height: 0),
                                    Text('Avançar')
                                  ]))),
                    ],
                  ),
                ),
              ],
            ),
            // pagina 2
            Wrap(
              children: [
                const Text(
                  'Boas Vendas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: ObservacaoController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.pageview),
                      labelText: 'Observação',
                      hintText: 'não obrigatório',
                      border: OutlineInputBorder(),
                      isDense: false,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      )),
                ),
                SizedBox(height: 55),
                TextFormField(
                  controller: OcClienteController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.pageview),
                    labelText: 'OC Cliente',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    isDense: false,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  autovalidateMode: AutovalidateMode.always,
                ),
                     Padding(
                  padding: EdgeInsets.only(bottom: 65),
                ),
                const SizedBox(
                  width: 12,
                ),
                Icon(Icons.delivery_dining),
                SizedBox(
                  height: 0,
                  width: 5,
                ),
                Text('Frete: escolha uma opção'),
                Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Opção A'),
                    Radio<String>(
                      value: 'Opção A',
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                    const Text('Opção B'),
                    Radio<String>(
                      value: 'Opção B',
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                    const Text('Opção C'),
                    Radio<String>(
                      value: 'Opção C',
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 55),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PedidoPage()));
                        },
                        child: const SizedBox(
                          width: 50,
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.navigate_before),
                              SizedBox(
                                height: 1,
                              ),
                              Text('Voltar')
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
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
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.navigate_next,
                                            // size:18
                                          ),
                                          SizedBox(height: 0),
                                          Text('Avançar')
                                        ]))),
                          ],
                        ),
                      ),

                      /*   const SizedBox(height: 55, width: 30),
                      InkWell(
                        child: const SizedBox(
                            width: 100,
                            height: 50,
                            child: Column(children: [
                              Icon(Icons.navigate_next),
                              SizedBox(height: 1),
                              Text('Gravar')
                            ])),
                        onTap: () {
                          if (UndController.text.isNotEmpty &&
                              QtdController.text.isNotEmpty &&
                              VrBaseController.text.isNotEmpty &&
                              PrEfetivoController.text.isNotEmpty &&
                              VrBrutoController.text.isNotEmpty) {
                            // Todos os campos estão preenchidos, então você pode gravar os dados
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Pedido feito!'),
                                  content: Text('Gravado com sucesso',
                                      textAlign: TextAlign.center),
                                  shadowColor: Colors.red,
                                  icon: (Icon(Icons.verified)),
                                  actions: <Widget>[
                                    InkWell(
                                      child: Text("Fechar"),
                                      onTap: () {
                                        // Limpa os campos antes de voltar para a página de pedidos
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PedidoPage()));
                                      },
                                    ),
                                  ],
                                );
                              },
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
                                  icon: Icon(Icons.error),
                                  actions: <Widget>[
                                    InkWell(
                                      child: Text("Fechar"),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      )*/
                    ],
                  ),
                )
              ],
            ),
            //pagina 3
         Wrap(
              children: [
                const Text(
                  'Boas Vendas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
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
                  }
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20
                )
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.always,
          ),
          const SizedBox(height: 55),
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
                      }),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20)),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return '';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                Row(
                  children: [
                    SizedBox(height: 55),
                    Expanded(
                      child: TextFormField(
                        controller: UndController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.list_alt),
                          labelText: 'Unidade',
                          border: const OutlineInputBorder(),
                          isDense: true,
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
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          if (value == null || value == '') {
                            return '';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.always,
                      ),
                    ),
                    SizedBox(width: 10), // Espaçamento entre os TextFormField
                    Expanded(
                      child: TextFormField(
                        controller: QtdController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.list_alt),
                          labelText: 'Quantidade',
                          border: const OutlineInputBorder(),
                          isDense: true,
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
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          if (value == null || value == '') {
                            return '';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.always,
                      ),
                    ),
                  ],
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
                          final Color color =
                              states.contains(MaterialState.error)
                                  ? Theme.of(context).colorScheme.error
                                  : Colors.green;
                          return TextStyle(color: color, letterSpacing: 1);
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20)),
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
                const SizedBox(height: 55),
                TextFormField(
                  controller: PrEfetivoController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.monetization_on),
                      hintText: '0,0',
                      labelText: 'Preço Efetivo',
                      border: const OutlineInputBorder(),
                      isDense: true,
                      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                          final Color color =
                              states.contains(MaterialState.error)
                                  ? Theme.of(context).colorScheme.error
                                  : Colors.green;
                          return TextStyle(color: color, letterSpacing: 1);
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20)),
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
                            final Color color =
                                states.contains(MaterialState.error)
                                    ? Theme.of(context).colorScheme.error
                                    : Colors.green;
                            return TextStyle(color: color, letterSpacing: 1);
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20)),
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
                    autovalidateMode: AutovalidateMode.always),
          ],
        ),
                  ]
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
}

class CurrencyPtBrInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    String newText = "R\$ ${formatter.format(value / 100)}";

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
