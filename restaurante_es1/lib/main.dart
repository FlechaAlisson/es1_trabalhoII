import 'package:flutter/material.dart';
import 'package:restaurante_es1/Pages/HomePage.dart';
import 'package:restaurante_es1/styles/app_colors.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: AppColors.primaryColor),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
