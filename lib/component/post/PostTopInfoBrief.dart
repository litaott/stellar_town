import 'package:flutter/material.dart';

/// 帖子顶部导航界面
/// @author ww
/// @date 2023-06-24

class PostTopInfoBrief extends StatefulWidget {
  const PostTopInfoBrief({Key? key}) : super(key: key);

  @override
  PostTopInfoBriefState createState() => PostTopInfoBriefState();
}

class PostTopInfoBriefState extends State<PostTopInfoBrief> {
  @override
  Widget build(BuildContext context) {
    return const Row(
        children: [
        Expanded(
          child: Center(
            child: Text('附近'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          tooltip: '发帖',
          onPressed: null, // null disables the button
        ),
        Expanded(
          child: Center(
            child: Text('推荐'),
          ),
        ),
      ]
    );
  }
}
