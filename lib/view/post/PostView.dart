import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/postDetail/PostContent.dart';
import 'package:stellar_town/component/post/postDetail/PostOwner.dart';
import 'package:stellar_town/component/post/postDetail/PostBottum.dart';


/// 帖子详细信息界面
/// @author ww
/// @date 2023-06-27

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  PostViewState createState() => PostViewState();
}

class PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          appBar: AppBar(
            title:InkWell(
              child: const Text('返回'),
              onTap: () {Navigator.pop(context);},
            ),//返回,
          ),
          body:ListView(
            children: const [
              PostOwner(
                name: '2',
              ),//贴主信息
              PostContent(
                  title:'标题',
                  content:'内容',
              ),//标题,内容
              PostBottom(
                tag:"1",
                place: '地点',
              ),//标签，点赞，点赞数
            ],
          )
        )
    );
  }
}
