import 'package:flutter/material.dart';

class UserInfoBrief extends StatefulWidget {
  const UserInfoBrief({Key? key}) : super(key: key);

  @override
  UserInfoBriefState createState() => UserInfoBriefState();
}

class UserInfoBriefState extends State<UserInfoBrief> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage:
            Image.network('https://img.duoziwang.com/2018/04/2411164027183.jpg')
                .image,
      ),
      title: const Text('sing_me_to_a_flow'),
      subtitle: const Text('令人愤慨的不是受苦/而是受这苦没理由'),
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}
