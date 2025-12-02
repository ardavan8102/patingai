import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pating_ai/consts/app_routes.dart';

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
      // TODO : create App Theme file
      // theme: ThemeData(
      //   colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      // ),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}