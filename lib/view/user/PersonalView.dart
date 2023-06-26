import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stellar_town/component/user/RouteList.dart';
import 'package:stellar_town/component/user/UserInfoBrief.dart';

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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UserInfoBrief(),
            RouteList(),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
