import 'package:flutter/material.dart';
import 'package:stellar_town/view/post/PostingView.dart';

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
    return Row(
        children: [
        const Expanded(
          child: Center(
            child: Text('附近'),
          ),
        ),
          InkWell(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostingView()),
              );
            },// null disables the button
        ),
        const Expanded(
          child: Center(
            child: Text('推荐'),
          ),
        ),
      ]
    );
  }
}
