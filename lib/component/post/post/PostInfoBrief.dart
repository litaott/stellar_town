import 'package:flutter/material.dart';

/// 帖子界面
/// @author ww
/// @date 2023-06-24

class PostInfoBrief extends StatefulWidget {
  const PostInfoBrief({Key? key}) : super(key: key);

  @override
  PostInfoBriefState createState() => PostInfoBriefState();
}

class PostInfoBriefState extends State<PostInfoBrief> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children:[
        Row(
          children:[
          Expanded(child: Text('头像')),
          Column(
            children: [
            Expanded(child: Text('名字')),
            Expanded(child: Text('关注')),
          ],
        ),
      ]),
      Expanded(child: Text('标题')),
      Expanded(child: Text('图片')),
      Expanded(child: Text('描述')),
      Expanded(child: Text('地点')),
      Row(
        children: [
          Expanded(child: Text('标签')),
          Expanded(child: Text('点赞数')),
          Expanded(child: Text('点赞')),
        ],
      )
      ]
    );
  }
}
