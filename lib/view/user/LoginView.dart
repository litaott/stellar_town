import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stellar_town/component/user/CircleButton.dart';
import 'package:stellar_town/component/user/TextInput.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/TextStyleTheme.dart';
import 'package:stellar_town/view/user/RegisterView.dart';

/// 用户登录页面
/// @author tt
/// @date 2023-06-21

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String id, password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image(
                  image: Image.asset('assets/image/login.png').image,
                  width: 150,
                  height: 150,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextInput(
                    controller: idController,
                    hintText: '用户名',
                    icon: Icons.account_circle,
                  ),
                  TextInput(
                    controller: passwordController,
                    hintText: '密码',
                    icon: Icons.key,
                    obscureText: true,
                  ),
                ],
              ),
              GestureDetector(
                onTap: login,
                child: const CircleButton(
                  icon: Icons.arrow_forward_outlined,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterView(),
                    ),
                  );
                },
                child: const Text(
                  '未拥有账号？点击注册',
                  style: TextStyleTheme.registerStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///登录响应函数
  void login() {
    id = idController.text.toString();
    password = passwordController.text.toString();
    successDialog();
  }

  /// 登录成功弹窗
  void successDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('登录成功'),
          actions: [
            CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  if (navigatorKey.currentState?.canPop() != true) {
                    navigatorKey.currentState
                        ?.pushReplacementNamed('/homepage');
                  }
                },
                child: const Text('确定'))
          ],
        );
      },
    );
  }
}
