import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/postDetail/PostContent.dart';
import 'package:stellar_town/component/post/postDetail/PostOwner.dart';
import 'package:stellar_town/component/post/postDetail/PostTag.dart';

import '../../constant/ConstUrl.dart';
import '../../entity/post/Post.dart';
import '../../main.dart';
import '../../util/HttpUtil.dart';


/// 帖子详细信息界面
/// @author ww
/// @date 2023-07-05

class PostView extends StatefulWidget {
  PostView({Key? key, required this.postId}) : super(key: key);

  final int postId;

  Post post = Post();

  @override
  PostViewState createState() => PostViewState();
}

class PostViewState extends State<PostView> {

  void posting() async {
    Response response = await HttpUtil.postJson(ConstUrl.post, widget.postId as Map);
    widget.post= Post.fromMap(response.data['data']);
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home:Scaffold(
          appBar: AppBar(
            title:InkWell(
              child: const Text('返回'),
              onTap: () {Navigator.pop(context);},
            ),//返回,
          ),
          body:Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                PostOwner(),//贴主信息
                PostContent(
                  title:widget.post.title,
                  content:widget.post.content,
                  place: widget.post.address,
                ),//标题,内容,地点
                PostTag(tag: widget.post.tag,),//标签
              ],
            ),
          )
        )
    );
  }
}
