import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stellar_town/component/user/personal/TabList.dart';
import 'package:stellar_town/component/user/personal/UserInfoBrief.dart';
import 'package:stellar_town/entity/user/User.dart';
import 'package:stellar_town/main.dart';

/// 用户主页
/// @author tt
/// @date 2023-06-28

class PersonalPageView extends StatefulWidget {
  const PersonalPageView({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  PersonalPageViewState createState() => PersonalPageViewState();
}

class PersonalPageViewState extends State<PersonalPageView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

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
                user: widget.user,
              ),
              SizedBox(
                width: screenWidth,
                height: 10,
              ),
              Expanded(
                child: TabList(
                  userId: widget.user.id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
