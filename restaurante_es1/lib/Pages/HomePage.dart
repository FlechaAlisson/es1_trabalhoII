import 'package:animated_card/animated_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_es1/Pages/OrderPage.dart';
import 'package:restaurante_es1/Pages/PerfilPage.dart';
import 'package:restaurante_es1/client/pratosClient.dart';
import 'package:restaurante_es1/model/Cart.dart';
import 'package:restaurante_es1/model/PratosList.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/widgets/HomePageWidget/tilePlateWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PratosClient client = PratosClient();

  Future<List<dynamic>> loadData() async {
    return await client.getAllPratos();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartModel, PratosList>(
      builder: (context, cart, pratos, __) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Restaurante"),
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
          floatingActionButton: cart.items.length == 0
              ? Container()
              : FloatingActionButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingPage(),
                    ),
                  ),
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(Icons.restaurant),
                ),
          body: Container(
            color: AppColors.background,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Center(

                  //Future Builder: Enquanto não carrega retorna um loading
                  // se carrega, retorna os widgets da pagina
                  child: FutureBuilder<dynamic>(
                future: pratos.getAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: pratos.pratos.length,
                      itemBuilder: (context, i) {
                        return AnimatedCard(
                          child: tileFoodWidget(
                            index: i,
                          ),
                        );
                      },
                    );
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
      ),
    );
  }
}
