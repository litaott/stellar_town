import 'package:flutter/material.dart';
import 'package:stellar_town/component/user/FeatureBar.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
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
  String username = '当幽灵失灵';
  String signature = '当你四处逃逸最终还是回到原地，怔怔看着拥挤人群最怕那些都是自己';
  String avatar = ConstUrl.defaultAvatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.95,
      height: 220,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
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
                  foregroundImage: NetworkImage(avatar),
                  backgroundImage: const AssetImage('assets/image/planet.png'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyleTheme.currentUsernameStyle,
                  ),
                  const Divider(
                    height: 6,
                  ),
                  SizedBox(
                    width: screenWidth * 0.95 - 180,
                    height: 40,
                    child: Text(
                      signature,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const FeatureBar(),
        ],
      ),
    );
  }
}
