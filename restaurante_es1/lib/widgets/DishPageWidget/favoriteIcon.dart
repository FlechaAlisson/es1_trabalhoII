import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_es1/client/favoritosClient.dart';
import 'package:restaurante_es1/model/PratosList.dart';
import 'package:restaurante_es1/styles/app_colors.dart';

class FavoriteIcon extends StatefulWidget {
  final bool comeFromFavoritePage;
  final int index;
  const FavoriteIcon({
    Key? key,
    required this.index,
    required this.comeFromFavoritePage,
  }) : super(key: key);

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  FavoritosClient client = FavoritosClient();

  @override
  Widget build(BuildContext context) {
    return Consumer<PratosList>(
      builder: (context, pratos, _) => GestureDetector(
        child: Container(
          child: (pratos.pratos[widget.index].favorito != 0)
              ? Icon(
                  Icons.favorite,
                  color: AppColors.primaryColor,
                )
              : Icon(
                  Icons.favorite_border,
                  color: AppColors.primaryColor,
                ),
        ),
        onTap: () {
          setState(() {
            if (pratos.pratos[widget.index].favorito == 0) {
              client.setFavorito(pratos.pratos[widget.index].id);
              pratos.toogleFavorite(widget.index);
            } else {
              client.deleteFavorito(pratos.pratos[widget.index].id);
              pratos.toogleFavorite(widget.index);
            }
          });
        },
      ),
    );
  }
}
