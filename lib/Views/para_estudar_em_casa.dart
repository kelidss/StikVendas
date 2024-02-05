// tente dar um jeito nesse codigo.


/*TextFormField(
                  controller: DtPedidoController,
                  decoration: const InputDecoration(
                    labelText: 'Data Pedido',
                    floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states){
                        final Color color = states.contains(MaterialState.error)
                        ? Theme.of(context).colorScheme.error
                         : Colors.orange;
                        return TextStyle(color: color, letterSpacing: 1.3);
                      }
                      ),
                  )
                      validator: (String ? value){
                        if (value == null || value = ''){
                          return 'campo obrigatorio';

                        }
                        return null;
                      },
                  autovalidateMode: AutovalidateMode.always,
                 autovalidateMode: AutovalidateMode.always,
   // );
  //}
//}
                    // labelStyle: TextStyle(height:10),
                    hintText: '00/00/0000',
                    border: OutlineInputBorder(),
                    // borderSide: BorderSide()
                    //  color: DtPedidoController.text.isEmpty
                    //      ? Colors.red
                    //     : Colors.grey,
                    //   ),
                    //),
                    contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 10),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  //  validator: (DtPedidoController)=> DtPedidoController!.isEmpty ?,
                  inputFormatters: [MaskTextInputFormatter(mask: '##/##/####')],
                  keyboardType: TextInputType.datetime,
                ),*/



// estude esse abaixo, isso resolverá o problema de validação dos campos.
/*import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// Flutter code sample for [InputDecorator].

void main() => runApp(const FloatingLabelStyleErrorExampleApp());

class FloatingLabelStyleErrorExampleApp extends StatelessWidget {
  const FloatingLabelStyleErrorExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('InputDecorator Sample')),
        body: const Center(
          child: InputDecoratorExample(),
        ),
      ),
    );
  }
}

class InputDecoratorExample extends StatelessWidget {
  const InputDecoratorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
         isDense: true,
         floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: 'Data',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.orange;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
    inputFormatters: [MaskTextInputFormatter(mask: '##/##/####')],
     keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Enter name';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.always,
      
    );
  }
}*/

// ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO 
// esse precisa somente de um ajuste, tente mudar o local pois o erro indica isso
/*              TextFormField(
                    controller: DtPedidoController,
                    decoration: const InputDecoration(
                      hintText: '00/00/0000',
                      border: OutlineInputBorder(),
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Data Pedido',
                     floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                     (Set<MaterialState> states) {
                      final Color color =
                      states.contains(MaterialState.error)
                       ? Theme.of(context).colorScheme.error
                      : Colors.orange;
                         return TextStyle(color: color, letterSpacing: 1.3);
                        },
                      ),
                    ),
                    inputFormatters: [
                      MaskTextInputFormatter(mask: '##/##/####')
                    ],
                    keyboardType: TextInputType.datetime,
                    validator: (String? value) {
                      if (value == null || value == '') {
                        return 'Campo obrigatorio';
                      }
                     return null;
                    },
                   autovalidateMode: AutovalidateMode.always,
                    ),*/
