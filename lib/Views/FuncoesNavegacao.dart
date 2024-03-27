// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void avancarproximapagina1(
    PageController pageController,
    TextEditingController DtPedidoController,
    TextEditingController DtEntregaController,
    TextEditingController ClienteController,
    String? _selectedTipoDocumento,
    String? _selectedTipoCobranca,
    String? _selectedFormaPagamento,
    BuildContext context) {
  if (DtPedidoController.text.isNotEmpty &&
      DtEntregaController.text.isNotEmpty &&
      ClienteController.text.isNotEmpty &&
      _selectedTipoDocumento != null &&
      _selectedTipoCobranca != null &&
      _selectedFormaPagamento != null) {
    pageController.nextPage(
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

void avancarproximapagina2(
    PageController pageController,
    String? _selectedOption,
    String? _selectedFrete,
    TextEditingController FreteController,
    BuildContext context) {
  if (_selectedOption != null &&
      _selectedFrete != null &&
      FreteController.text.isNotEmpty) {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: const Text('Preencha todos os campos obrigatórios'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
