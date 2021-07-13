import 'package:flutter/material.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';
import 'package:restaurante_es1/widgets/FavoritePageWidget/TileFavoriteFoodWidget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
      body: ListView(
        children: [
          TileFavoriteFood(
              nome: "comida",
              photoPath: "images/rato.png",
              descricao: "hmmm que deli",
              id: 1),
          TileFavoriteFood(
              nome: "comida",
              photoPath: "images/rato.png",
              descricao: "hmmm que deli",
              id: 1)
        ],
      ),
    );
  }
}
