import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/Post/PostHomeInfoBrief.dart';
import 'package:stellar_town/component/post/PostTopInfoBrief.dart';

/// 帖子总览界面
/// @author ww
/// @date 2023-06-24

class PostHomeView extends StatefulWidget {
  const PostHomeView({Key? key}) : super(key: key);

  @override
  PostHomeViewState createState() => PostHomeViewState();
}

class PostHomeViewState extends State<PostHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PostTopInfoBrief(),
      ),
      body: const PostHomeInfoBrief(),
    );
  }
}
