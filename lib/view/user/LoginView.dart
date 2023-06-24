import 'package:flutter/material.dart';
import 'package:stellar_town/component/user/TextInput.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: Image.asset('assets/image/login.png').image),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: TextInput(
                controller: idController,
                hintText: '用户名',
                icon: Icons.account_circle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 40),
              child: TextInput(
                controller: passwordController,
                hintText: '密码',
                icon: Icons.key,
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 36.0,
              child: ElevatedButton(
                onPressed: login,
                child: const Text('登录'),
              ),
            ),
            SizedBox(
              height: 36.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterView()),
                  );
                },
                child: const Text('注册'),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  ///登录响应函数
  void login() {
    id = idController.text.toString();
    password = passwordController.text.toString();
  }
}
