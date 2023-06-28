import 'package:flutter/material.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/ColorTheme.dart';

/// 个人主页页面
/// @author tt
/// @date 2023-06-26

class PersonalPageView extends StatefulWidget {
  const PersonalPageView({Key? key}) : super(key: key);

  @override
  PersonalPageViewState createState() => PersonalPageViewState();
}

class PersonalPageViewState extends State<PersonalPageView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.95,
          height: 40,
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: ColorTheme.lightBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [ColorTheme.blue, ColorTheme.lightBlue],
            ),
          ),
          child: TabBar(
            controller: tabController,
            tabs: const [
              Tab(text: '发布'),
              Tab(text: '点赞'),
              Tab(text: '关注'),
              Tab(text: '粉丝'),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: screenWidth * 0.95,
            height: screenHeight * 0.1,
            color: ColorTheme.lightBlue,
            child: TabBarView(
              controller: tabController,
              children: const [
                Center(child: Text('发布')),
                Center(child: Text('点赞')),
                Center(child: Text('关注')),
                Center(child: Text('粉丝')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
