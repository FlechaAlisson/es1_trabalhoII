import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurante_es1/styles/app_colors.dart';

class DishPage extends StatefulWidget {
  final int id;
  const DishPage({Key? key, required this.id}) : super(key: key);

  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  var loading = false;
  loadData() async {
    loading = true;
    await http.get(Uri.parse('http://localhost:3000/prato/${widget.id}'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        }).then((value) {
      print(value.body);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (!loading) {
            return Center(
              child: Text('oi'),
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
