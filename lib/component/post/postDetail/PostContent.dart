import 'package:flutter/cupertino.dart';

/// 帖子详细信息主体组件(标题，内容（图片还没写）)
/// @author ww
/// @date 2023-06-27

class PostContent extends StatelessWidget {
  const PostContent({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
    // height: 120,
      child: Column(
        children: [
          Text(title),
          Text(content),
        ],
      )
    );
  }
}