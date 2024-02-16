import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


TextEditingController DtPedidoController = TextEditingController();
TextEditingController DtEntregaController = TextEditingController();
//TextEditingController VendedorController = TextEditingController();
TextEditingController ClienteController = TextEditingController();
TextEditingController TpDocumentoController = TextEditingController();
TextEditingController TipoCobracaController = TextEditingController();
TextEditingController FormaPgtoController = TextEditingController();
TextEditingController FreteController = TextEditingController();
TextEditingController ObservacaoController = TextEditingController();
TextEditingController OcClienteController = TextEditingController();
TextEditingController ArtigoController = TextEditingController();
TextEditingController DetArtigoController = TextEditingController();
TextEditingController UndController = TextEditingController();
TextEditingController QtdController = TextEditingController();
TextEditingController VrBaseController = TextEditingController();
TextEditingController PrEfetivoController = TextEditingController();
TextEditingController VrBrutoController = TextEditingController();

TextEditingController textEditingController = TextEditingController();
int index = 0;

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
