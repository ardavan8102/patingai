import 'package:flutter/material.dart';
import 'package:pating_ai/consts/colors.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(

    // Text
    textTheme: TextTheme(

      // HeadLines
      headlineLarge: TextStyle(
        fontFamily: 'Meem',
        fontSize: 50,
        fontWeight: FontWeight.w900,
        color: AppSolidColors.textLight,
      ),


      // Titles
      titleSmall: TextStyle(
        fontFamily: 'Dana',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppSolidColors.textLight,
      )

      // Labels
    ),

  );

}