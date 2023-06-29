import 'package:flutter/material.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  DrawerViewState createState() => DrawerViewState();
}

class DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
}
