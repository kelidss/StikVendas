import 'package:flutter/material.dart';

TextEditingController DtPedidoController = TextEditingController();
TextEditingController DtEntregaController = TextEditingController();
TextEditingController VendedorController = TextEditingController();
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

class CheckboxModel {
  String title;
  bool value;
  bool shouldToggle = true;
  VoidCallback? onToggle;
  CheckboxModel({
    required this.title,
    required this.value,
    this.onToggle,
    this.shouldToggle = true,
  }) {
    onToggle = this.toggle;
  }
  void toggle() {
    if (shouldToggle) value = !value;
  }

  void enable(bool state) => shouldToggle = state;
  bool get isEnabled => shouldToggle;
  VoidCallback? handler() {
    if (shouldToggle) {
      return onToggle;
    } else {
      return null;
    }
  }
}
