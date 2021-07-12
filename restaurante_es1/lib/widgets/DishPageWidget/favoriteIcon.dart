import 'package:flutter/material.dart';
import 'package:restaurante_es1/styles/app_colors.dart';

class FavoriteIcon extends StatefulWidget {
  final bool wasFavorite;
  const FavoriteIcon({
    Key? key,
    required this.wasFavorite,
  }) : super(key: key);

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  late bool isFavorite;

  @override
  void initState() {
    isFavorite = widget.wasFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: isFavorite
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
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
