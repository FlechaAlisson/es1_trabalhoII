import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_es1/client/pratosClient.dart';
import 'package:restaurante_es1/model/Cart.dart';
import 'package:restaurante_es1/model/Pedido.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';
import 'package:restaurante_es1/widgets/DishPageWidget/favoriteIcon.dart';
import 'package:restaurante_es1/widgets/DishPageWidget/selectQuantityWidget.dart';

typedef void IntCallback(int qt);

class DishPage extends StatefulWidget {
  final String valor;
  final String nome;
  final String photoPath;
  final String descricao;
  final int id;

  final bool isFavorite;
  const DishPage(
      {Key? key,
      required this.id,
      required this.valor,
      required this.nome,
      required this.photoPath,
      required this.descricao,
      required this.isFavorite})
      : super(key: key);

  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  // pesquisar null safety
  var quantidadePedido = 1;
  var loading = false;
  late Map<String, dynamic> prato;
  PratosClient client = PratosClient();

  void updateQt(int qt) {
    quantidadePedido = qt;
  }

//Primeiro transformar de JSON para uma tipo de dado do flutter
//Depois montar a tela
  @override
  Widget build(BuildContext context) {
    //ctrl ponto
    return Consumer<CartModel>(builder: (context, cart, _) {
      return Container(
        color: AppColors.background,
        child: ListView(children: [
          Container(
              child: Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Container(
                    height: 100,
                    width: 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            widget.photoPath,
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Container(
                    color: AppColors.background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
                                child: Text(
                                  widget.nome,
                                  style: AppTextStyles.title,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
                              child: FavoriteIcon(
                                id_prato: widget.id,
                                wasFavorite: widget.isFavorite,
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 40),
                          child: Text(
                            widget.descricao,
                            style: AppTextStyles.discription,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Text(
                            'R\$ ' + widget.valor,
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
                          width: 480,
                          height: 200,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: TextField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: "Exemplo: tirar cebola.",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 2.0),
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            selectQuantityWidget(
                              onChangeQt: (int qt) => updateQt(qt),
                            ),
                            Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  textStyle: AppTextStyles.title,
                                  primary: AppColors.primaryColor,
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width / 1.5,
                                      50)),
                              onPressed: () {
                                cart.add(
                                  Pedido(
                                      id: widget.id,
                                      valor: double.parse(widget.valor),
                                      nome: widget.nome,
                                      photoPath: widget.photoPath,
                                      descricao: widget.descricao,
                                      quantidade: quantidadePedido),
                                );

                                cart.printAll();
                                print(cart.getTotalValue());
                                Fluttertoast.showToast(
                                    webBgColor:
                                        "linear-gradient(to right, #00b09b, #00b09b)",
                                    webPosition: "center",
                                    msg: "Prato adicionado ao pedido!",
                                    fontSize: 30,
                                    timeInSecForIosWeb: 2);
                                Navigator.pop(context);
                              },
                              child: const Text('ADICIONAR'),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          )),
        ]),
      );
    });
  }
}
