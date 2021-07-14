import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:restaurante_es1/client/favoritosClient.dart';
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
      body: FutureBuilder<List<dynamic>>(
          future: client.getAllFavoritos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return AnimatedCard(
                      child: TileFavoriteFood(
                          nome: snapshot.data![i]['nome'],
                          photoPath: snapshot.data![i]['photoPath'],
                          descricao: snapshot.data![i]['descricao_breve'],
                          id: snapshot.data![i]['id']),
                    );
                  });
            } else
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
          }),
    );
  }
}
