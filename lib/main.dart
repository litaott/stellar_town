import 'package:flutter/material.dart';
import 'package:stellar_town/component/Navigation.dart';
import 'package:stellar_town/view/SplashView.dart';
import 'package:stellar_town/view/user/LoginView.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    checkLoginStatus();

    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/',
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
