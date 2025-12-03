import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pating_ai/consts/app_routes.dart';
import 'package:pating_ai/consts/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      locale: Locale('fa', 'IR'),
      title: 'Pating AI',

      theme: AppTheme.mainTheme,
      
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}