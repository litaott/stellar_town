import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stellar_town/component/user/personal/TabList.dart';
import 'package:stellar_town/component/user/personal/UserInfoBrief.dart';
import 'package:stellar_town/entity/user/User.dart';
import 'package:stellar_town/main.dart';

/// 用户个人相关页面
/// @author tt
/// @date 2023-06-20

class PersonalView extends StatefulWidget {
  const PersonalView({Key? key}) : super(key: key);

  @override
  PersonalViewState createState() => PersonalViewState();
}

class PersonalViewState extends State<PersonalView> {
  @override
  Widget build(BuildContext context) {
    changeSystemStatusBar();

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
              UserInfoBrief(
                user: User.currentUser,
              ),
              SizedBox(
                width: screenWidth,
                height: 10,
              ),
              Expanded(
                child: TabList(
                  userId: User.currentUser.id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 修改系统状态栏颜色
  void changeSystemStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
