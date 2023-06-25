import 'package:flutter/material.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/ColorTheme.dart';
import 'package:stellar_town/theme/TextStyleTheme.dart';

/// 用户简短信息组件
/// @author tt
/// @date 2023-06-21

class UserInfoBrief extends StatefulWidget {
  const UserInfoBrief({Key? key}) : super(key: key);

  @override
  UserInfoBriefState createState() => UserInfoBriefState();
}

class UserInfoBriefState extends State<UserInfoBrief> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.95,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            spreadRadius: 10,
            color: Color.fromARGB(20, 0, 0, 0),
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [ColorTheme.blue, ColorTheme.lightBlue],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 1,
                  spreadRadius: 2,
                  color: Color.fromARGB(20, 0, 0, 0),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: Image.network(
                      'https://img.duoziwang.com/2018/04/2411164027183.jpg')
                  .image,
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '明室',
                style: TextStyleTheme.currentUsernameStyle,
              ),
              Text(
                '唯一辨识我是我的，只有心上的疤痕',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
