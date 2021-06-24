import 'package:flutter/material.dart';
import 'package:restaurante_es1/Pages/HomePage.dart';
import 'package:restaurante_es1/styles/app_colors.dart';
import 'package:restaurante_es1/styles/app_text_styles.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: AppTextStyles.textSimple,
        )),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
