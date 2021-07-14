import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_es1/client/pedidoClient.dart';
import 'package:restaurante_es1/model/Cart.dart';

import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';
import 'package:restaurante_es1/widgets/OrderPageWidgets/listTileOrderWidget.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    Key? key,
  }) : super(key: key);
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  PedidosClient client = PedidosClient();
  String dropdownValue = 'MasterCard';
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, _) => Container(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  cart.removeAll();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Center(
                    child: Text(
                      "Limpar",
                      style: AppTextStyles.titlePurple,
                    ),
                  ),
                ),
              )
            ],
            title: Text(
              "Pedido",
              style: AppTextStyles.title,
            ),
          ),
          body: ListView(
            children: [
              Container(
                color: AppColors.background,
                child: Column(
                  children: [
                    ListTileOrderWidget(pedidos: cart.items),
                    Divider(),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Observações",
                              style: AppTextStyles.title,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: AppTextStyles.textSimple,
                              decoration: InputDecoration(
                                hintText: "Exemplo: tirar cebola.",
                                fillColor: AppColors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 2.0),
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Valor total: R\$ ${cart.getTotalValue().toStringAsFixed(2)}",
                              style: AppTextStyles.title,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Pagamento (cartão de crédito): ",
                                  style: AppTextStyles.title,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: AppTextStyles.textSimple,
                                  underline: Container(
                                    height: 2,
                                    color: AppColors.primaryColor,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'MasterCard',
                                    'Visa',
                                    'Nubank'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: ElevatedButton(
            style: ElevatedButton.styleFrom(
                textStyle: AppTextStyles.title,
                primary: AppColors.primaryColor,
                fixedSize: Size(MediaQuery.of(context).size.width, 50)),
            onPressed: () {
              client.saveOrder(1, cart.getTotalValue(), cart.items);
              Fluttertoast.showToast(
                webBgColor: "linear-gradient(to right, #00b09b, #00b09b)",
                webPosition: "center",
                msg: "Pedido realizado com sucesso!",
                fontSize: 30,
              );
              cart.removeAll();
              Navigator.pop(context);
            },
            child: const Text('CONFIRMAR PEDIDO'),
          ),
        ),
      ),
    );
  }
}
