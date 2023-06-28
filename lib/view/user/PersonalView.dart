import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stellar_town/component/user/UserInfoBrief.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/entity/user/User.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/util/HttpUtil.dart';
import 'package:stellar_town/view/user/PersonalPageView.dart';

/// 用户个人相关页面
/// @author tt
/// @date 2023-06-20

class PersonalView extends StatefulWidget {
  const PersonalView({Key? key}) : super(key: key);

  @override
  PersonalViewState createState() => PersonalViewState();
}

class PersonalViewState extends State<PersonalView> {
  late User? user;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    getCurrentUser();

    return FutureBuilder<User>(
      future: getCurrentUser(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          user = snapshot.data;
          return MaterialApp(
            home: Scaffold(
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth,
                      height: 20,
                    ),
                    const UserInfoBrief(),
                    const Expanded(
                      child: PersonalPageView(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<User>? getCurrentUser() async {
    Response response = await HttpUtil.getJson(ConstUrl.getUserInfo);
    Map body = response.data;
    if (body['code'] ~/ 100 == 2) {
      return User.fromJson(body['data']);
    } else {
      String message = body['message'];
      log('HTTP_FAILURE:$message');
      return User.defaultUser;
    }
  }
}
