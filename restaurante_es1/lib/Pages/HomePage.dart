import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurante_es1/Pages/OrderPage.dart';
import 'package:restaurante_es1/Pages/PerfilPage.dart';
import 'package:restaurante_es1/client/pratosClient.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/widgets/HomePageWidget/tilePlateWidget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var loading = false;
  late List<dynamic> pratos;
  PratosClient client = PratosClient();

  loadData() async {
    loading = true;
    pratos = await client.getAllPratos();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Restaurante da Isabola"),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PerfilPage(),
                      ),
                    ),
                icon: Icon(CupertinoIcons.person_fill))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  !loading ? BookingPage(pratos: pratos) : Container(),
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          child: Icon(CupertinoIcons.calendar_badge_plus),
        ),
        body: Container(
          color: AppColors.background,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Center(

                //Future Builder: Enquanto não carrega retorna um loading
                // se carrega, retorna os widgets da pagina
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
