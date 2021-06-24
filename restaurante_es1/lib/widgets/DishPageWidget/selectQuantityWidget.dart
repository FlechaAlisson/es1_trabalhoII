import 'package:flutter/material.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';

class selectQuantityWidget extends StatefulWidget {
  const selectQuantityWidget({Key? key}) : super(key: key);

  @override
  _selectQuantityWidgetState createState() => _selectQuantityWidgetState();
}

class _selectQuantityWidgetState extends State<selectQuantityWidget> {
  var quantidadePedido = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(
              Icons.remove,
              color: quantidadePedido == 1
                  ? AppColors.black
                  : AppColors.primaryColorButton,
            ),
            onTap: () =>
                setState(() => {if (quantidadePedido != 1) quantidadePedido--}),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              quantidadePedido.toString(),
              style: AppTextStyles.title,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Icon(
              Icons.add,
              color: AppColors.primaryColorButton,
            ),
            onTap: () => setState(() => {quantidadePedido++}),
          )
        ],
      ),
    );
  }
}
