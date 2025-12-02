import 'package:get/get.dart';
import 'package:pating_ai/views/chat_view.dart';
import 'package:pating_ai/views/splash.dart';

class AppRoutes {

  static const String splash = '/';
  static const String chatView = '/chat-view';
}

class AppPages {

  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => ChatViewPage(),
    ),
  ];

}