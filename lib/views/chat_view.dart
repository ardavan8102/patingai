import 'package:flutter/material.dart';
import 'package:pating_ai/components/appbar.dart';
import 'package:pating_ai/consts/colors.dart';

class ChatViewPage extends StatelessWidget {
  const ChatViewPage({super.key});

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppSolidColors.darkScaffoldBackground,
        appBar: PatingoAppBar(textTheme: textTheme),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          // Main Column
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Text(
                  'Chat View',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}