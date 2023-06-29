import 'package:flutter/material.dart';

/// 帖子详细信息底部组件(点赞，点赞数)
/// @author ww
/// @date 2023-06-29

class PostBottom extends StatefulWidget {
  const PostBottom({super.key});

  @override
  _PostBottomState createState() => _PostBottomState();}

class _PostBottomState extends State<PostBottom>{
  bool _isLiked = false;
  int _likeNum = 41;

  void _toggleLikeState() {
    setState(() {
      if (_isLiked) {
        _likeNum -= 1;
        _isLiked = false;
      } else {
        _likeNum+= 1;
        _isLiked= true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
            width:100,
            child: Align(
              alignment: Alignment.centerRight,
              child:SizedBox(
                  child: Text('10000'), //child: Text('$_likeNum'),
              ),
            ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isLiked
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleLikeState,
          ),
        ),
      ],
    );
  }
}

