import 'package:flutter/cupertino.dart';

/// 帖子详细信息底部组件(地点，标签，点赞，点赞数)
/// @author ww
/// @date 2023-06-27

class PostBottom extends StatelessWidget {
  const PostBottom({
    Key? key,
    required this.tag,
    required this.place,
  }) : super(key: key);

  final String tag;
  final String place;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
     // height: 120,
      child: Column(
        children:[
        Text(place),
        Row(
        textDirection: TextDirection.ltr,
        children: [
          Text(tag),
          Text('点赞数'),
          Text('点赞'),
        ],
      ),
        ]
      ),
    );
  }
}