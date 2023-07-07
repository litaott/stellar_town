import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/postHome/PostHomeTop.dart';
import 'package:stellar_town/component/post/postHome/PostList.dart';
import 'package:stellar_town/main.dart';
import '../../entity/post/Post.dart';

/// 帖子总览界面
/// @author ww
/// @date 2023-07-05

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
          title:const PostHomeTop(),
        ),
        body:Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/default.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SizedBox(
              width: screenWidth*0.96,
                child: PostList()
            ),
          ),
        ),
      ),
    );
  }



}
