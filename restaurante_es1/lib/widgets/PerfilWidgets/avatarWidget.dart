import 'package:flutter/material.dart';
import 'package:restaurante_es1/client/userClient.dart';
import 'package:restaurante_es1/model/User.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  _AvatarWidgetState createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  late User user;
  getUser() async {
    UserClient client = UserClient();
    user = await client.getUser(1);
    print(user.nome);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
                      TextSpan(text: user.nome, style: AppTextStyles.title),
                      TextSpan(text: "!", style: AppTextStyles.textSimple)
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
