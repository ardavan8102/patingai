import 'package:get/get.dart';
import 'package:pating_ai/models/message_model.dart';

class ChatViewModel extends GetxController {
  RxList<MessageModel> messages = RxList();

  void addMessage({required String text, required bool isFromUser}){
    messages.add(
      MessageModel(
        text: text,
        isFromUser: isFromUser
      )
    );
  }
}