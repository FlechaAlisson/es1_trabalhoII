import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_es1/client/favoritosClient.dart';
import 'package:restaurante_es1/model/PratosList.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';
import 'package:restaurante_es1/widgets/FavoritePageWidget/TileFavoriteFoodWidget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FavoritosClient client = new FavoritosClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Favoritos",
          style: AppTextStyles.title,
        ),
      ),
      body: Consumer<PratosList>(builder: (context, list, _) {
        return ListView.builder(
            itemCount: list.pratos.length,
            itemBuilder: (context, i) {
              if (list.pratos[i].favorito == 0) {
                return Container();
              } else {
                return AnimatedCard(
                  child: TileFavoriteFood(
                    nome: list.pratos[i].nome,
                    photoPath: list.pratos[i].photoPath,
                    descricao: list.pratos[i].descricao_breve,
                    id: list.pratos[i].id,
                    index: i,
                  ),
                );
              }
            });
      }),
    );
  }
}
