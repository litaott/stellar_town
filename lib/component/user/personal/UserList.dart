import 'package:flutter/material.dart';
import 'package:stellar_town/entity/user/User.dart';
import 'package:stellar_town/view/user/PersonalPageView.dart';

/// 用户列表组件
/// @author tt
/// @date 2023-06-28

class UserList extends StatefulWidget {
  const UserList({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  UserListState createState() => UserListState();
}

class UserListState extends State<UserList> {
  late List<UserListTile> userListTiles = [];
  late List<User> users = widget.users;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < users.length; i++) {
      userListTiles.add(UserListTile(user: users[i]));
    }
    return ListView(
      children: userListTiles,
    );
  }
}

class UserListTile extends StatefulWidget {
  const UserListTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  UserListTileState createState() => UserListTileState();
}

class UserListTileState extends State<UserListTile> {
  late User user = widget.user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PersonalPageView(user: user);
            },
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          foregroundImage: NetworkImage(user.avatar),
        ),
        title: Center(child: Text(user.username)),
      ),
    );
  }
}
