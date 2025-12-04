import 'dart:convert';
import 'package:pating_ai/models/message_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  
  final String baseURL = 'https://patingai.s16.viptelbot.top/api';

  Future<Map<String, dynamic>> sendMessage ({
    required String message,
    List<MessageModel>? conversation
  }) async {
    List<Map<String, dynamic>> convList = [];

    if (conversation != null) {
      List<MessageModel> conversationForApi = List.from(conversation);

      if (conversationForApi.isNotEmpty && conversationForApi.last.isFromUser) {
        conversationForApi.removeLast();
      }

      for(var msg in conversationForApi){
        convList.add(
          {
            "role" : msg.isFromUser ? "user" : "assistant",
            "content" : msg.text
          }
        );
      }
    }

    final url = Uri.parse("$baseURL/ai");

    final response = await http.post(
      url,
      headers: {'Content-Type' : 'application/json'},
      body: jsonEncode(
        {
          "message" : message,
          "conversation" : convList,
        }
      )
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('خطایی رخ داد');
    }

  }

}