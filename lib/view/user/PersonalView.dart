import 'package:flutter/material.dart';
import 'package:stellar_town/component/user/RouteList.dart';
import 'package:stellar_town/component/user/UserInfoBrief.dart';
import 'package:stellar_town/constant/Url.dart';
import 'package:stellar_town/entity/user/User.dart';
import 'package:stellar_town/util/HttpUtil.dart';

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
    return Scaffold(
        appBar: AppBar(),
        body: const Column(children: [
          UserInfoBrief(),
          RouteList(),
        ]));
  }
}

Future<User> getUser(int id) async {
  try {
    final response = await HttpUtil.post(getUserInfoUrl, {'id': id.toString()});
    if (response.statusCode == 200) {
      User user = User.fromJson(response.data);
      return user;
    } else {
      throw Exception('Failed to load user');
    }
  } catch (e) {
    throw Exception('Network error: $e');
  }
}
