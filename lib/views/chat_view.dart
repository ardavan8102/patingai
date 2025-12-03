import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pating_ai/components/appbar.dart';
import 'package:pating_ai/components/snackbars.dart';
import 'package:pating_ai/consts/app_styles.dart';
import 'package:pating_ai/consts/colors.dart';
import 'package:pating_ai/consts/strings.dart';
import 'package:pating_ai/viewmodels/chat_view_model.dart';

class ChatViewPage extends StatelessWidget {
  ChatViewPage({super.key});

  final ChatViewModel chatViewModel = Get.put(ChatViewModel());

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    final TextEditingController messageTextEditingController = TextEditingController();

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
                // List Messages
                Obx(
                  () => Expanded(
                    child: ListView.builder(
                      itemCount: chatViewModel.messages.length,
                      itemBuilder: (context, index) {
                        final message = chatViewModel.messages[index];

                        return Align(
                          alignment: message.isFromUser
                            ? .centerRight
                            : .centerLeft,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              gradient: message.isFromUser 
                                ? LinearGradient(
                                    colors: AppGradientColors.magentaVpurple,
                                    begin: .bottomRight,
                                    end: .topLeft,
                                  )
                                : LinearGradient(
                                    colors: AppGradientColors.blueVcyan,
                                    begin: .bottomLeft,
                                    end: .topRight,
                                  ),
                              borderRadius: .circular(8),
                            ),
                            child: Text(
                              message.text, 
                              style: TextStyle(color: Colors.white),
                            )
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Message Input
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppGradientColors.whiteGlass,
                      begin: .bottomRight,
                      end: .topLeft,
                    ),
                    borderRadius: .circular(12),
                    border: Border.all(
                      width: 1,
                      color: AppSolidColors.glassBoxBorderWhite,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageTextEditingController,
                          style: textTheme.labelSmall,
                          decoration: InputDecoration(
                            hintText: 'یک متن بنویسید ...',
                            border: InputBorder.none,
                            hintStyle: AppTextStyles.textInputHintText,
                          ),
                          cursorColor: AppSolidColors.accent,
                        ),
                      ),

                      Row(
                        spacing: 10,
                        children: [
                          InkWell(
                            onTap: () {
                              showCupertinoDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    insetAnimationDuration: Duration(milliseconds: 300),
                                    title: Text(
                                      AppStrings.deleteMessagesListDialogTitle,
                                      style: textTheme.titleLarge!.copyWith(
                                        color: AppSolidColors.darkScaffoldBackground,
                                        fontFamily: 'Meem',
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        AppStrings.deleteMessagesListDialogContent,
                                        style: textTheme.labelMedium!.copyWith(
                                          color: AppSolidColors.darkScaffoldBackground.withValues(alpha: 0.6),
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          "خیر",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          chatViewModel.messages.clear();
                                        },
                                        child: Text(
                                          "بله، مطمئنم",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.delete_forever,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              if (messageTextEditingController.text != '') {
                                chatViewModel.addMessage(
                                  text: messageTextEditingController.text,
                                  isFromUser: true
                                );
                            
                                // Clear Text Input On Send
                                messageTextEditingController.clear();
                              } else {
                                AppSnackBars.failed(
                                  'متن ارسالی نباید خالی باشد!',
                                  textTheme,
                                  size
                                );
                              }
                              
                            },
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}