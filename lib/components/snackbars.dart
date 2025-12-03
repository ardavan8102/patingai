import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBars {

  static void failed(String msg, TextTheme textTheme, Size size){
    Get.snackbar(
      '', // Set title empty for using Widget
      '', // Set message empty for using Widget
      titleText: Row(
        spacing: 8,
        children: [
          Icon(
            Icons.cancel,
            color: Colors.red,
          ),
          Text(
            'خطا',
            style: textTheme.titleLarge!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w800,
              fontFamily: 'Meem'
            ),
          ),
        ],
      ),
      messageText: Text(
        msg,
        style: textTheme.labelMedium,
      ),
      duration: Duration(seconds: 4),
      animationDuration: Duration(milliseconds: 400),
      margin: EdgeInsets.only(top: size.height / 15),
    );
  }

  static void success(String msg, TextTheme textTheme, Size size){
    Get.snackbar(
      '', // Set title empty for using Widget
      '', // Set message empty for using Widget
      titleText: Row(
        spacing: 8,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          Text(
            'موفق',
            style: textTheme.titleLarge!.copyWith(
              color: Colors.green,
              fontWeight: FontWeight.w800,
              fontFamily: 'Meem'
            ),
          ),
        ],
      ),
      messageText: Text(
        msg,
        style: textTheme.labelMedium,
      ),
      duration: Duration(seconds: 4),
      animationDuration: Duration(milliseconds: 400),
      margin: EdgeInsets.only(top: size.height / 15),
    );
  }

}