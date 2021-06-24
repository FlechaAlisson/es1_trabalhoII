import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';

class DishPage extends StatefulWidget {
  final int id;
  const DishPage({Key? key, required this.id}) : super(key: key);

  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  var loading = false;
  late Map<String, dynamic> prato;

  loadData() async {
    loading = true;
    await http.get(Uri.parse('http://localhost:3000/prato/${widget.id}'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        }).then((value) {
      prato = jsonDecode(value.body);
      print(prato);
      loading = false;
    });
  }

//Primeiro transformar de JSON para uma tipo de dado do flutter
//Depois montar a tela
  @override
  Widget build(BuildContext context) {
    //ctrl ponto
    return Container(
      child: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (!loading) {
            return Material(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Container(
                      height: 100,
                      width: 500,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              prato['photoPath'],
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 40, 0, 0),
                        child: Text(
                          prato['nome'],
                          style: AppTextStyles.title,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 10, 0, 40),
                        child: Text(
                          prato['descricao_completa'],
                          style: AppTextStyles.discription,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
                        child: Text(
                          'R\$ ' + prato['valor'],
                          style: AppTextStyles.title,
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                        child: Row(children: [
                          Icon(Icons.article_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Observações',
                            style: AppTextStyles.textSimple,
                          ),
                        ]),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
                        width: 450,
                        height: 200,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintStyle: AppTextStyles.discription,
                              hintText: 'Ex: Tirar cebola',
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 100, 10, 0),
                            child: Row(
                              children: [
                                Icon(Icons.remove),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '1',
                                    style: AppTextStyles.title,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.add)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      AppColors.primaryColor)),
            );
          }
        },
      ),
    );
  }
}
