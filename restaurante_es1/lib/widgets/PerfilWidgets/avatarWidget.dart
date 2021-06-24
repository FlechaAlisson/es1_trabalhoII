import 'package:flutter/material.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'images/person.png',
                )),
            borderRadius: BorderRadius.all(Radius.circular(360.0)),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        RichText(
          text: TextSpan(
            text: "Olá ",
            style: AppTextStyles.textSimple,
            children: [
              TextSpan(text: "John Doe", style: AppTextStyles.title),
              TextSpan(text: "!", style: AppTextStyles.textSimple)
            ],
          ),
        ),
      ],
    );
  }
}
