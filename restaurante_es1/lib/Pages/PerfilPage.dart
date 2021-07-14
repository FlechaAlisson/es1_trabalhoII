import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';
import 'package:restaurante_es1/widgets/PerfilWidgets/avatarWidget.dart';

import 'FavoritePage.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
        color: AppColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarWidget(),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                color: AppColors.background,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Icon(CupertinoIcons.money_dollar_circle),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Cupons",
                            style: AppTextStyles.title,
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            " Acesse seus cupons disponíneis",
                            style: AppTextStyles.discription,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Divider(
              indent: 25,
              endIndent: 25,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                color: AppColors.background,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Icon(Icons.shopping_basket_outlined),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Seu pedido",
                            style: AppTextStyles.title,
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            "Confira os pratos que estão em seu pedido",
                            style: AppTextStyles.discription,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Divider(
              indent: 25,
              endIndent: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritePage()));
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 60,
                  color: AppColors.background,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.heart),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Pratos Favoritos",
                              style: AppTextStyles.title,
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              "Confira os pratos seus pratos favoritos",
                              style: AppTextStyles.discription,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Divider(
              indent: 25,
              endIndent: 25,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                color: AppColors.background,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Icon(CupertinoIcons.clock),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Reservas prontas",
                            style: AppTextStyles.title,
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            "Confira as suas reservas já realizadas",
                            style: AppTextStyles.discription,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Divider(
              indent: 25,
              endIndent: 25,
            ),
          ],
        ),
      ),
    );
  }
}
