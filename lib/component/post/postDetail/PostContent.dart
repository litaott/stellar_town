import 'package:flutter/material.dart';

/// 帖子详细信息主体组件(标题，内容（图片还没写）)
/// @author ww
/// @date 2023-06-29

class PostContent extends StatelessWidget {
  const PostContent({
    Key? key,
    required this.title,
    required this.content,
    required this.place,
  }) : super(key: key);

  final String title;
  final String content;
  final String place;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
    // height: 120,
      child: Column(
        children: [
          Text(title),
          Image.asset('assets/image/login.png', fit: BoxFit.scaleDown),
          Text(content),
          Text(place,style: const TextStyle(fontSize: 10,color:Colors.grey),),
        ],
      )
    );
  }
}