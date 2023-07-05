import 'package:flutter/material.dart';

/// 帖子点赞组件
/// @author ww
/// @date 2023-07-05

class PostLike extends StatefulWidget {
  const PostLike({super.key});

  @override
  _PostLikeState createState() => _PostLikeState();}

class _PostLikeState extends State<PostLike>{
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
            width:75,
            child: Align(
              alignment: Alignment.centerRight,
              child:SizedBox(
                  child: Text('100000000'), //child: Text('$_likeNum'),
              ),
            ),
        ),
        SizedBox(
          width: 20,
          height: 50,
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

