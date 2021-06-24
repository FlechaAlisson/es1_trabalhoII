import 'package:flutter/material.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';

class tileOrderWidget extends StatelessWidget {
  final String valor;
  final String nome;
  final String quantidade;
  final String descricao;
  const tileOrderWidget(
      {Key? key,
      required this.valor,
      required this.nome,
      required this.quantidade,
      required this.descricao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        color: AppColors.white,
        child: Row(
          children: [
            Container(
              color: AppColors.background,
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "X${quantidade}",
                  style: AppTextStyles.title,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.nome,
                    style: AppTextStyles.title,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    this.descricao,
                    style: AppTextStyles.discription,
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              'R\$ ' + valor,
              style: AppTextStyles.title,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
