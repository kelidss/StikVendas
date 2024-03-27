import 'package:flutter/material.dart';
import 'package:stik_vendas/Controllers/PedidoController.dart';
import 'package:stik_vendas/Views/FuncoesNavegacao.dart';

class BuildNextButton extends StatefulWidget {
  final PageController pageController;
  final TextEditingController dtPedidoController;
  final TextEditingController dtEntregaController;
  final TextEditingController clienteController;
  final String selectedTipoDocumento;
  final String selectedTipoCobranca;
  final String selectedFormaPagamento;

  const BuildNextButton({
    Key? key,
    required this.pageController,
    required this.dtPedidoController,
    required this.dtEntregaController,
    required this.clienteController,
    required this.selectedTipoDocumento,
    required this.selectedTipoCobranca,
    required this.selectedFormaPagamento,
  }) : super(key: key);

  @override
  _BuildNextButtonState createState() => _BuildNextButtonState();
}

class _BuildNextButtonState extends State<BuildNextButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            if (widget.pageController.page == 0) {
              avancarproximapagina1(
                widget.pageController,
                widget.dtPedidoController,
                widget.dtEntregaController,
                widget.clienteController,
                widget.selectedTipoDocumento,
                widget.selectedTipoCobranca,
                widget.selectedFormaPagamento,
                context,
              );
            } else {
              widget.pageController.nextPage(
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
}
