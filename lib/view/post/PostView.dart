import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/post/PostInfoBrief.dart';
import 'package:stellar_town/component/post/PostTopInfoBrief.dart';

/// 帖子总览界面
/// @author ww
/// @date 2023-06-24

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  PostViewState createState() => PostViewState();
}

class PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('返回'),
      ),
      body: const PostInfoBrief(),
    );
  }
}
