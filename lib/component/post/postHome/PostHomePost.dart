import 'package:flutter/material.dart';

/// 帖子总览界面
/// @author ww
/// @date 2023-06-24

class PostHomePost extends StatefulWidget {
  const PostHomePost({Key? key}) : super(key: key);

  @override
  PostHomePostState createState() => PostHomePostState();
}

class PostHomePostState extends State<PostHomePost> {
  @override
  Widget build(BuildContext context) {
    return const Text('社区主页');
  }
}
