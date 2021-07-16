import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_es1/Pages/DishPage.dart';
import 'package:restaurante_es1/model/PratosList.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';

// ignore: camel_case_types
class tileFoodWidget extends StatelessWidget {
  final int index;
  const tileFoodWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PratosList>(
      builder: (context, pratos, _) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DishPage(index: this.index),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Material(
            elevation: 5,
            child: Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: AppColors.white,
              child: Row(
                children: [
                  // Container de imagem
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(pratos.pratos[this.index].photoUrl),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(360.0)),
                    ),
                  ),
                  // Container de texto
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pratos.pratos[this.index].nome,
                          style: AppTextStyles.title,
                        ),
                        // acho q uma box entre o titulo e descrição
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          pratos.pratos[this.index].descricao_breve,
                          style: AppTextStyles.discription,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    'R\$ ' + pratos.pratos[this.index].valor.toStringAsFixed(2),
                    style: AppTextStyles.title,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
