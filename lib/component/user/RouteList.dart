import 'package:flutter/material.dart';

/// 用户个人相关路由列表组件
/// @author tt
/// @date 2023-06-21

class RouteList extends StatefulWidget {
  const RouteList({Key? key}) : super(key: key);

  @override
  RouteListState createState() => RouteListState();
}

class RouteListState extends State<RouteList> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          title: Text('设置'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: Text('关于StellarTown'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ],
    );
  }
}
