import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  UserListState createState() => UserListState();
}

class UserListState extends State<UserList> {
  late List<UserListTile> userListTiles;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: userListTiles,
    );
  }
}

class UserListTile extends StatefulWidget {
  const UserListTile({Key? key}) : super(key: key);

  @override
  UserListTileState createState() => UserListTileState();
}

class UserListTileState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListTile();
  }
}
