import 'package:flutter/material.dart';
import 'package:restaurante_es1/widgets/OrderPageWidgets/tileOrderWidget.dart';

class ListTileOrderWidget extends StatelessWidget {
  final List<dynamic> pedidos;
  const ListTileOrderWidget({Key? key, required this.pedidos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: pedidos
            .map((e) => tileOrderWidget(
                valor: e.valor.toStringAsFixed(2),
                nome: e.nome,
                quantidade: e.quantidade.toString(),
                descricao: e.descricao))
            .toList());
  }
}
