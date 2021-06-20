import 'package:flutter/material.dart';
import 'package:restaurante_es1/Pages/DishPage.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';

// ignore: camel_case_types
class tileFoodWidget extends StatelessWidget {
  final String valor;
  final String nome;
  final String photoPath;
  final String descricao;
  final int id;
  const tileFoodWidget(
      {Key? key,
      required this.valor,
      required this.nome,
      required this.photoPath,
      required this.descricao,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DishPage(
              id: id,
            ),
          ),
        );
      },
      child: Material(
        elevation: 5,
        child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 15),
          color: AppColors.white,
          child: Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        photoPath,
                      )),
                  borderRadius: BorderRadius.all(Radius.circular(360.0)),
                ),
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
      ),
    );
  }
}
