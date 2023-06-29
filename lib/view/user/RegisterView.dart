import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stellar_town/component/user/login/CircleButton.dart';
import 'package:stellar_town/component/user/login/RollingBox.dart';
import 'package:stellar_town/component/user/login/TextInput.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/util/HttpUtil.dart';

/// 用户注册页面
/// @author tt
/// @date 2023-06-21

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  late String username, password, phoneNumber;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const RollingBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextInput(
                  controller: usernameController,
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
                  hintText: '电话号码',
                  icon: Icons.phone,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleButton(icon: Icons.arrow_back_outlined),
                ),
                GestureDetector(
                  onTap: register,
                  child: const CircleButton(icon: Icons.check),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  ///注册响应函数
  void register() async {
    username = usernameController.text.toString();
    password = passwordController.text.toString();
    phoneNumber = phoneNumberController.text.toString();

    Map body = {
      'username': username,
      'password': password,
    };
    Response response = await HttpUtil.post(ConstUrl.register, body);
    body = response.data;

    if (body['code'] ~/ 100 == 2) {
      successDialog();
    } else {
      failDialog(body['message']);
    }
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
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('确定'),
            )
          ],
        );
      },
    );
  }

  /// 注册失败弹窗
  void failDialog(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('注册失败'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('确定'),
            )
          ],
        );
      },
    );
  }
}
