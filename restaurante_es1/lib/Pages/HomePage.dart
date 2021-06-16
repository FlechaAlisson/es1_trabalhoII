import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/widgets/tilePlateWidget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var loading = false;
  late List<dynamic> pratos;
  void initState() {
    super.initState();
  }

  loadData() async {
    loading = true;
    await http.get(Uri.parse('http://localhost:3000'), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    }).then((value) {
      pratos = jsonDecode(value.body);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Restaurante XPTO"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print('oi'),
          backgroundColor: AppColors.primaryColor,
          child: Icon(CupertinoIcons.calendar_badge_plus),
        ),
        body: Container(
          color: AppColors.background,
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
            child: Center(
                child: FutureBuilder(
              future: loadData(),
              builder: (context, snapshot) {
                if (!loading) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return tileFoodWidget(
                            id: pratos[index]['id'],
                            valor: pratos[index]['valor'],
                            nome: pratos[index]['nome'],
                            photoPath: pratos[index]['photoPath'],
                            descricao: pratos[index]['descricao']);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                            height: 8,
                          ),
                      itemCount: pratos.length);
                } else {
                  return SizedBox(
                    child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            AppColors.primaryColor)),
                    width: 60,
                    height: 60,
                  );
                }
              },
            )),
          ),
        ),
      ),
    );
  }
}
