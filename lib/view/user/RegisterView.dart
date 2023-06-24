import 'package:flutter/material.dart';
import 'package:stellar_town/component/user/TextInput.dart';

/// 用户注册页面
/// @author tt
/// @date 2023-06-21

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
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
            Image(image: Image.asset('assets/image/register.png').image),
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
              height: 48.0,
              child: ElevatedButton(
                onPressed: register,
                child: const Text('注册'),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  ///注册响应函数
  void register() {
    id = idController.text.toString();
    password = passwordController.text.toString();
  }
}
