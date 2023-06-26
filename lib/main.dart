import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stellar_town/component/Navigation.dart';
import 'package:stellar_town/view/SplashView.dart';
import 'package:stellar_town/view/user/LoginView.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late double screenWidth;
late double screenHeight;

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    checkLoginStatus();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

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
    await Future.delayed(const Duration(seconds: 2));
    if (navigatorKey.currentState?.canPop() != true) {
      navigatorKey.currentState?.pushReplacementNamed('/login');
    }
  }
}
