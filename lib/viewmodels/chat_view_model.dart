import 'package:get/get.dart';
import 'package:pating_ai/models/message_model.dart';
import 'package:pating_ai/services/api_service.dart';

class ChatViewModel extends GetxController {
  RxList<MessageModel> messages = RxList();

  final ApiService _apiService = ApiService();

  RxBool isLoading = false.obs;

  void addMessage({required String text, required bool isFromUser}){
    messages.add(
      MessageModel(
        text: text,
        isFromUser: isFromUser
      )
    );
  }

  Future<void> sendMessageToAi(String message) async {
    isLoading.value = true;

    addMessage(
      text: message,
      isFromUser: true
    );

    try {
      final response = await _apiService.sendMessage(
        message: message,
        conversation: messages,
      );

      final reply = response['response'] as String;
      addMessage(text: reply, isFromUser: false);
      isLoading.value = false;
    } catch (e) {
      addMessage(text: 'خطا در ارسال پیام', isFromUser: false);
    }

  }

}