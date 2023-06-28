import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stellar_town/component/Navigation.dart';
import 'package:stellar_town/component/user/login/CircleButton.dart';
import 'package:stellar_town/component/user/login/RollingBox.dart';
import 'package:stellar_town/component/user/login/TextInput.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/entity/user/User.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/TextStyleTheme.dart';
import 'package:stellar_town/util/HttpUtil.dart';
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

  late String username, password;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

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
            SizedBox(
              height: screenHeight * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  ///登录响应函数
  void login() async {
    username = idController.text.toString();
    password = passwordController.text.toString();
    Map body = {
      'username': username,
      'password': password,
    };
    Response response = await HttpUtil.post(ConstUrl.login, body);
    body = response.data;
    if (body['code'] ~/ 100 == 2) {
      String tokenData = body['data']['token'];
      HttpUtil.token = 'Bearer $tokenData';
      User.currentUser = User.fromMap(body['data']);
      //log(HttpUtil.token);
      successDialog();
    } else {
      failDialog(body['message']);
    }
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
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Navigation();
                    },
                  ),
                );
              },
              child: const Text('确定'),
            )
          ],
        );
      },
    );
  }

  /// 登录失败弹窗
  void failDialog(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('登录失败'),
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
