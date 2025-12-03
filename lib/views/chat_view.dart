import 'package:flutter/material.dart';

class ChatViewPage extends StatelessWidget {
  const ChatViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Text(
            'Chat View'
          )
        )
      ),
    );
  }
}