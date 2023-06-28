import 'package:flutter/material.dart';
import 'package:stellar_town/entity/user/User.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/ColorTheme.dart';
import 'package:stellar_town/theme/TextStyleTheme.dart';

/// 用户简短信息组件
/// @author tt
/// @date 2023-06-21

class UserInfoBrief extends StatefulWidget {
  final User user;

  @override
  UserInfoBriefState createState() => UserInfoBriefState();

  const UserInfoBrief({
    Key? key,
    required this.user,
  }) : super(key: key);
}

class UserInfoBriefState extends State<UserInfoBrief> {
  // String username = '当幽灵失灵';
  // String signature = '当你四处逃逸最终还是回到原地，怔怔看着拥挤人群最怕那些都是自己';
  // String avatar = ConstUrl.defaultAvatar;

  @override
  Widget build(BuildContext context) {
    String username = widget.user.username;
    String signature = widget.user.signature;
    String avatar = widget.user.avatar;

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
              SizedBox(
                width: screenWidth * 0.95 - 140,
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
    );
  }
}
