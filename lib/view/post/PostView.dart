import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/postDetail/PostContent.dart';
import 'package:stellar_town/component/post/postDetail/PostOwner.dart';
import 'package:stellar_town/component/post/postDetail/PostTag.dart';
import '../../entity/post/Post.dart';
import '../../main.dart';


/// 帖子详细信息界面
/// @author ww
/// @date 2023-07-05

class PostView extends StatefulWidget {
  PostView({Key? key,
    required this.postId,
    required this.title,
    required this.tag,
    required this.image,
    required this.address,
    required this.content,
    required this.userId,
    required this.avatar,
    required this.likeCount,
    required this.userName}) : super(key: key);

  final int postId;
  final int userId;
  final String title;
  final String tag;
  final String image;
  final String address;
  final String content;
  final String avatar;
  final String userName;
  final int likeCount;

  Post post = Post();

  @override
  PostViewState createState() => PostViewState();
}

class PostViewState extends State<PostView> {

  isTag() {
    if (widget.tag != "" && widget.tag != null) {
      return PostTag(tag: widget.tag,);
    } else {
      return Container();
    }
  }//有标签输出标签

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
                PostOwner(
                  postId: widget.postId,
                  userId: widget.userId,
                  avatar: widget.avatar,
                  likeCount: widget.likeCount,
                  username: widget.userName,),//贴主信息
                PostContent(
                  title:widget.title,
                  content:widget.content,
                  place: widget.address,
                  image: widget.image,
                ),//标题,内容,地点
                isTag(),//标签
              ],
            ),
          )
        )
    );
  }
}
