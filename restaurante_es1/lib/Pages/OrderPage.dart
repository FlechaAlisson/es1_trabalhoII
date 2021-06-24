import 'package:flutter/material.dart';

import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';
import 'package:restaurante_es1/widgets/OrderPageWidgets/tileOrderWidget.dart';

class BookingPage extends StatefulWidget {
  final pratos;
  const BookingPage({
    Key? key,
    required this.pratos,
  }) : super(key: key);
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String dropdownValue = 'MasterCard';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Pedido",
            style: AppTextStyles.title,
          ),
        ),
        body: Container(
          color: AppColors.background,
          child: Column(
            children: [
              tileOrderWidget(
                  valor: widget.pratos[1]["valor"],
                  nome: widget.pratos[1]["nome"],
                  quantidade: "3",
                  descricao: widget.pratos[1]["descricao"]),
              SizedBox(
                height: 5,
              ),
              tileOrderWidget(
                  valor: widget.pratos[2]["valor"],
                  nome: widget.pratos[2]["nome"],
                  quantidade: "1",
                  descricao: widget.pratos[2]["descricao"]),
              SizedBox(
                height: 5,
              ),
              tileOrderWidget(
                  valor: widget.pratos[0]["valor"],
                  nome: widget.pratos[0]["nome"],
                  quantidade: "2",
                  descricao: widget.pratos[0]["descricao"]),
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
                                color: AppColors.primaryColor, width: 2.0),
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
                        "Valor total: R\$ 175,49",
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
                            items: <String>['MasterCard', 'Visa', 'Nubank']
                                .map<DropdownMenuItem<String>>((String value) {
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: AppTextStyles.title,
                            primary: AppColors.primaryColor,
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 50)),
                        onPressed: () {
                          _showToast();
                          Navigator.pop(context);
                        },
                        child: const Text('CONFIRMAR PEDIDO'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showToast() {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Pedido realizado com sucesso!",
          style: AppTextStyles.title,
        ),
      ),
    );
  }
}
