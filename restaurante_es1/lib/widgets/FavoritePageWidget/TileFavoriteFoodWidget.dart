import 'package:flutter/material.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';
import 'package:restaurante_es1/widgets/DishPageWidget/favoriteIcon.dart';

class TileFavoriteFood extends StatefulWidget {
  final String nome;
  final String photoPath;
  final String descricao;
  final int id;
  const TileFavoriteFood(
      {Key? key,
      required this.nome,
      required this.photoPath,
      required this.descricao,
      required this.id})
      : super(key: key);

  @override
  _TileFavoriteFoodState createState() => _TileFavoriteFoodState();
}

class _TileFavoriteFoodState extends State<TileFavoriteFood> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    return Material(
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
                    image: AssetImage(
                      widget.photoPath,
                    )),
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
                    this.widget.nome,
                    style: AppTextStyles.title,
                  ),
                  // acho q uma box entre o titulo e descrição
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    this.widget.descricao,
                    style: AppTextStyles.discription,
                  ),
                ],
              ),
            ),
            Spacer(),
            FavoriteIcon(
              wasFavorite: true,
              id_prato: 1,
            ),
            Divider(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
