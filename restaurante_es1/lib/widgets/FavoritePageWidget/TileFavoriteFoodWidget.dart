import 'package:flutter/material.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';
import 'package:restaurante_es1/widgets/DishPageWidget/favoriteIcon.dart';

class TileFavoriteFood extends StatefulWidget {
  final String nome;
  final String photoUrl;
  final String descricao;
  final int id;
  final int index;
  const TileFavoriteFood(
      {Key? key,
      required this.nome,
      required this.photoUrl,
      required this.descricao,
      required this.id,
      required this.index})
      : super(key: key);

  @override
  _TileFavoriteFoodState createState() => _TileFavoriteFoodState();
}

class _TileFavoriteFoodState extends State<TileFavoriteFood> {
  @override
  Widget build(BuildContext context) {
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
                    fit: BoxFit.cover, image: NetworkImage(widget.photoUrl)),
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
              comeFromFavoritePage: true,
              index: widget.index,
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
