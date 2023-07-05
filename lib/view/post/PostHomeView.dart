import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/postHome/PostHomeTop.dart';
import 'package:stellar_town/component/post/postHome/PostList.dart';
import '../../entity/post/Post.dart';

/// 帖子总览界面
/// @author ww
/// @date 2023-06-29

class PostHomeView extends StatefulWidget {
  PostHomeView({Key? key}) : super(key: key);

  Post post = Post();

  @override
  PostHomeViewState createState() => PostHomeViewState();
}

class PostHomeViewState extends State<PostHomeView> {

  List<Post> data  = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const PostHomeTop(),
        ),
        body:PostList(),
      ),
    );
  }



}
