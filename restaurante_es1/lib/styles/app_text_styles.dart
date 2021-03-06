import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.notoSans(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    fontSize: 16,
  );

  static final TextStyle titlePurple = GoogleFonts.notoSans(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
    fontSize: 16,
  );

  static final TextStyle discription = GoogleFonts.notoSans(
    decoration: TextDecoration.none,
    color: AppColors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle textSimple = GoogleFonts.notoSans(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontSize: 16,
  );

  static final TextStyle textButton = GoogleFonts.notoSans(
    decoration: TextDecoration.none,
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
