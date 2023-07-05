import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/postDetail/PostLike.dart';

/// 帖子主信息组件(头像，名字，关注)
/// @author ww
/// @date 2023-06-29

class PostOwner extends StatefulWidget {
  const PostOwner({super.key});



  @override
  PostOwnerState createState() => PostOwnerState();}


class PostOwnerState extends State<PostOwner>{

  late String name='名字';
  bool _isFollowed=false;
  final double ownerHeight=100;

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
    return Container(//全部
      padding: const EdgeInsets.all(10),
      height: 70,
      child: Row(
        children: [
          SizedBox(
            height: ownerHeight*0.6,
            width: ownerHeight*0.6,
            child: Image.asset('assets/image/login.png', fit: BoxFit.cover),
          ),//图片
          SizedBox(
            height: ownerHeight-16,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(name, style: const TextStyle(fontSize: 19,),)),
                ),//名字
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: _toggleFollowState,
                      child: Row(
                        children: [
                          Icon(
                            _isFollowed?Icons.star_border:Icons.star,
                            size: 15,
                            color: Colors.red,
                          ),
                          Text(
                            _isFollowed?'关注':'已关注',
                            style:TextStyle(
                              fontSize: 10,
                              color: _isFollowed?Colors.black:Colors.black12
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),//名字关注行
          const Spacer(),
          const PostLike(),

        ],
      ),
    );
  }
}
