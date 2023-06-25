import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stellar_town/component/user/CircleButton.dart';
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
  TextEditingController phoneNumberController = TextEditingController();

  late String id, password, phoneNumber;

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
                  TextInput(
                    controller: phoneNumberController,
                    hintText: '手机号码',
                    icon: Icons.phone,
                  ),
                ],
              ),
              GestureDetector(
                onTap: register,
                child: const CircleButton(icon: Icons.check),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///注册响应函数
  void register() async {
    id = idController.text.toString();
    password = passwordController.text.toString();
    phoneNumber = phoneNumberController.text.toString();
    successDialog();
  }

  /// 注册成功弹窗
  void successDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('注册成功'),
          content: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('返回登录页面'),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
              },
              child: const Text('确定'),
            )
          ],
        );
      },
    );
  }
}
