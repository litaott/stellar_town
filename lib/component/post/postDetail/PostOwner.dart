import 'package:flutter/material.dart';

/// 帖子主信息组件(头像，名字，关注)
/// @author ww
/// @date 2023-06-29

class PostOwner extends StatefulWidget {

  @override
  _PostOwnerState createState() => _PostOwnerState();}


class _PostOwnerState extends State<PostOwner>{

  late String name='名字';
  bool _isFollowed=false;

  void _toggleFollowState() {
    setState(() {
      if (_isFollowed) {
        _isFollowed = false;
      } else {
        _isFollowed= true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      height: 161,
      child: Row(
        children: [
          Image.asset('assets/image/login.png', fit: BoxFit.contain),

          Column(
            children: [
              Text(name, style: const TextStyle(fontSize: 15,),),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.centerRight,
                      icon: (_isFollowed
                          ? const Icon(Icons.star)
                          : const Icon(Icons.star_border)),
                      color: Colors.red[500],
                      onPressed: _toggleFollowState,
                    ),
                  ),
                  const SizedBox(
                    width:100,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:SizedBox(
                        child: Text('10000'), //child: Text('$_likeNum'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
