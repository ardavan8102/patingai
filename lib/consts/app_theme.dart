import 'package:flutter/material.dart';
import 'package:pating_ai/consts/colors.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(

    // Global Configs
    fontFamily: 'Dana',

    // Texts
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
      ),

      // Labels
      labelLarge: TextStyle(
        fontFamily: 'Dana',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppSolidColors.textLight,
      ),

      labelMedium: TextStyle(
        fontFamily: 'Dana',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppSolidColors.textLight,
      ),

      labelSmall: TextStyle(
        fontFamily: 'Dana',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppSolidColors.textLight,
      ),
    ),

  );

}