import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/postHome/PostHomeTop.dart';

import '../../component/post/postHome/PostHomePost.dart';

/// 帖子总览界面
/// @author ww
/// @date 2023-06-27

class PostHomeView extends StatefulWidget {
  const PostHomeView({Key? key}) : super(key: key);

  @override
  PostHomeViewState createState() => PostHomeViewState();
}

class PostHomeViewState extends State<PostHomeView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const PostHomeTop(),
        ),
        body: const PostHomePost(title: '标题',place: '地点',tag: '标签',),
      )
    );
  }
}
