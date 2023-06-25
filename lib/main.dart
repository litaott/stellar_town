import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stellar_town/component/Navigation.dart';
import 'package:stellar_town/view/SplashView.dart';
import 'package:stellar_town/view/user/LoginView.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    checkLoginStatus();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/homepage',
      routes: {
        '/': (context) => const SplashView(),
        '/login': (context) => const LoginView(),
        '/homepage': (context) => const Navigation(),
      },
    );
  }

  void checkLoginStatus() async {
    // 检查登录状态
    await Future.delayed(const Duration(seconds: 2)); // 模拟耗时操作
    if (navigatorKey.currentState?.canPop() != true) {
      navigatorKey.currentState?.pushReplacementNamed('/login');
    }
  }
}
