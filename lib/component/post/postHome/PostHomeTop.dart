import 'package:flutter/material.dart';

/// 帖子主页顶部导航组件
/// @author ww
/// @date 2023-06-24

class PostHomeTop extends StatefulWidget {
  const PostHomeTop({Key? key}) : super(key: key);

  @override
  PostHomeTopState createState() => PostHomeTopState();
}

class PostHomeTopState extends State<PostHomeTop> {
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
