import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stellar_town/component/user/personal/UserList.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/entity/user/User.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/ColorTheme.dart';
import 'package:stellar_town/util/HttpUtil.dart';

/// 关注列表等切换
/// @author tt
/// @date 2023-06-28

class TabList extends StatefulWidget {
  const TabList({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final int userId;

  @override
  TabListState createState() => TabListState();
}

class TabListState extends State<TabList> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late int userId;

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
    userId = widget.userId;

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
          child: SizedBox(
            width: screenWidth * 0.95,
            height: screenHeight * 0.1,
            child: TabBarView(
              controller: tabController,
              children: [
                const Center(child: Text('发布')),
                const Center(child: Text('点赞')),

                /// 关注列表
                FutureBuilder<List<User>>(
                  future: getFollowList(),
                  initialData: const [],
                  builder: (BuildContext context,
                      AsyncSnapshot<List<User>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        log(snapshot.error.toString());
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        log('Follow:Success');
                        if (snapshot.data!.isEmpty) {
                          return const Center(child: Text('还没有关注的人哦~'));
                        } else {
                          return UserList(users: snapshot.data ?? []);
                        }
                      } else {
                        return const Center(child: Text('Empty data'));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),

                /// 粉丝列表
                FutureBuilder<List<User>>(
                  future: getFansList(),
                  initialData: const [],
                  builder: (BuildContext context,
                      AsyncSnapshot<List<User>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        log(snapshot.error.toString());
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        log('Fans:Success');
                        if (snapshot.data!.isEmpty) {
                          return const Center(child: Text('还没有人关注你哦~'));
                        } else {
                          return UserList(users: snapshot.data ?? []);
                        }
                      } else {
                        return const Center(child: Text('Empty data'));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<List<User>> getFollowList() async {
    List<User> followList = [];
    Response response =
        await HttpUtil.getJson('${ConstUrl.getOthersFollow}?id=$userId');
    Map body = response.data;
    if (body['code'] ~/ 100 == 2) {
      log(body['data'].toString());
      List<dynamic> maps = body['data'];
      for (int i = 0; i < maps.length; i++) {
        followList.add(User.fromMap(maps[i]));
      }
      log('getFollowList:Success');
    } else {
      log('getFollowList:Fail');
    }
    log(followList.toString());
    return followList;
  }

  Future<List<User>> getFansList() async {
    List<User> fansList = [];
    Response response =
        await HttpUtil.getJson('${ConstUrl.getOthersFans}?id=$userId');
    Map body = response.data;
    if (body['code'] ~/ 100 == 2) {
      log(body['data'].toString());
      List<dynamic> maps = body['data'];
      for (int i = 0; i < maps.length; i++) {
        fansList.add(User.fromMap(maps[i]));
      }
      log('getFansList:Success');
    } else {
      log('getFansList:Fail');
    }
    log(fansList.toString());
    return fansList;
  }
}
