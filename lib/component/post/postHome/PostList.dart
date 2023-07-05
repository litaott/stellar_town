import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../constant/ConstUrl.dart';
import '../../../entity/post/Post.dart';
import '../../../util/HttpUtil.dart';
import 'PostBrief.dart';


/// 帖子列表组件
/// @author ww
/// @date 2023-07-05

class PostList extends StatefulWidget {
  PostList({Key? key}) : super(key: key);

  Post post = Post();

  @override
  PostListState createState() => PostListState();
}

class PostListState extends State<PostList> {

  List<Post> data  = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    postHome(); // 调用接口获取数据
  }

  ///获取数据
  postHome() async {
    Response response = await HttpUtil.getJson(ConstUrl.recommendation);
    if (response.data['code'] / 100 == 2) {
      List<dynamic> maps;
      maps = response.data['data'];

      for (int i = 0; i < maps.length; i++) {
        data.add(Post.fromMap(maps[i]));
        isLoading=false;
      }
      //log(response.data['data']['']);
      log('获取数据成功');
      setState(() {});
    } else {
      log('fail');
      log('获取数据失败');
      //throw Exception('获取数据失败');
    }
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length+1,
      controller: ScrollController()..addListener(scrollListener),// 监听滚动事件，当滚动到底部时触发加载更多数据
      itemBuilder: (context, index) {
        if (index == data.length) {
          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        }//到底时显示圆形旋转条
        return PostBrief(
          postId: data[index].id,
          image: data[index].image,
          title: data[index].title,
          tag: data[index].tag,
          userId: data[index].userId,
        );
      },
    );
  }

  void scrollListener() {
    final scrollController = ScrollController();
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    const delta = 200.0; // 距离底部多少像素时触发加载更多

    if (maxScroll - currentScroll <= delta) {
      postHome();
    }
  }
}
