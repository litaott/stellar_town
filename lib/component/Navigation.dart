import 'package:flutter/material.dart';
import 'package:stellar_town/view/explore/ExploreView.dart';
import 'package:stellar_town/view/post/PostHomeView.dart';
import 'package:stellar_town/view/user/PersonalView.dart';

import '../view/user/DrawerView.dart';

/// 底部导航栏组件
/// @author tt
/// @date 2023-06-20

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    PostHomeView(),
    const ExploreView(),
    const PersonalView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: const DrawerView(),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '社区',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree),
              label: '探索',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '个人',
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(
      () {
        _currentIndex = index;
      },
    );
  }
}
