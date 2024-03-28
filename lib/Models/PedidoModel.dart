// models.dart


class PedidoModel {
  late String dtPedido;
  late String dtEntrega;
  late String cliente;
  late String tipoDocumento;
  late String tipoCobranca;
  late String formaPagamento;
  late String observacao;
  late String ocCliente;
  late String artigo;
  late String detalheArtigo;
  late String und;
  late int qtd;
  late double vrBase;
  late double prEfetivo;

  PedidoModel({
    required this.dtPedido,
    required this.dtEntrega,
    required this.cliente,
    required this.tipoDocumento,
    required this.tipoCobranca,
    required this.formaPagamento,
    required this.observacao,
    required this.ocCliente,
    required this.artigo,
    required this.detalheArtigo,
    required this.und,
    required this.qtd,
    required this.vrBase,
    required this.prEfetivo,
  });
}

