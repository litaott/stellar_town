import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../constant/ConstUrl.dart';
import '../../../util/HttpUtil.dart';

/// 帖子主信息组件(头像，名字，关注，点赞)
/// @author ww
/// @date 2023-06-29

class PostOwner extends StatefulWidget {
  const PostOwner({super.key,
    required this.postId,
    required this.userId,
    required this.avatar,
    required this.likeCount,
    required this.username});

  final int postId;
  final int userId;
  final String avatar;
  final int likeCount;
  final String username;


  @override
  PostOwnerState createState() => PostOwnerState();}


class PostOwnerState extends State<PostOwner>{

  late int likeCount =widget.likeCount;
  late bool _isLiked=false;
  late bool _isFollowed=false;
  final double ownerHeight=100;

  @override
  void initState() {
    super.initState();
    getIsLiked(); // 获取是否点赞
    getIsFollowed(); // 获取是否关注
  }
  ///获取是否点赞
  Future<void> getIsLiked() async {
    log('获取是否点赞');
    Response response = await HttpUtil.getJson(
        '${ConstUrl.isLiked}?postId=${widget.postId}');
    if (response.data['code'] ~/ 100 == 2) {
      setState(() {_isLiked = response.data['data'];});
      log('获取是否点赞成功');
    } else {
      log('获取是否点赞失败');
    }
  }
  ///获取是否关注
  Future<void> getIsFollowed() async {
    log('获取是否关注');
    Response response = await HttpUtil.getJson(
        '${ConstUrl.isFollowed}?followId=${widget.userId}');
    if (response.data['code'] ~/100== 2) {
      _isFollowed = response.data['data'];
      setState(() {_isFollowed = response.data['data'];});
      log('获取是否关注成功');
    } else {
      log('获取是否关注失败');
    }
  }
  ///关注
  void _toggleFollowState() async{
      Map body = {
        'id': widget.userId,
      };
      if (_isFollowed) {
        log('发送取消关注请求');
        Response response = await HttpUtil.postJson(ConstUrl.unFollowUser, body);
        if (response.data['code'] ~/ 100 == 2) {
          log('取消关注成功');
          _isFollowed = false;
          setState(() {});
        } else {
          log('取消关注失败');
        }
      } else {
        log('发送关注请求');
        Response response = await HttpUtil.postJson(ConstUrl.followUser, body);
        if (response.data['code'] ~/ 100 == 2) {
          log('关注成功');
          _isFollowed = true;
          setState(() {});
        } else {
          log('关注失败');
        }
      }
  }
  ///点赞
  void _toggleLikeState()async {
    Map body = {
      'id': widget.postId,
    };
    if (_isLiked) {
      log('发送取消点赞请求');
      Response response = await HttpUtil.postJson(ConstUrl.unLike, body);
      if (response.data['code'] ~/ 100 == 2) {
        log('取消点赞成功');
        likeCount -= 1;
        _isLiked = false;
        setState(() {});
      } else {
        log('取消点赞失败');
      }
    } else {
      log('发送点赞请求');
      Response response = await HttpUtil.postJson(ConstUrl.like, body);
      if (response.data['code'] ~/ 100 == 2) {
        log('点赞成功');
        likeCount += 1;
        _isLiked = true;
        setState(() {});
      } else {
        log('点赞失败');
      }
    }
  }

  late bool isLiked=false;
  void toggleLikeState()async {
    if(isLiked){isLiked=false; likeCount -= 1;setState(() {});}
    else{isLiked=true; likeCount += 1;setState(() {});}
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 70,
      child: Row(
        children: [
          SizedBox(
            height: ownerHeight*0.6,
            width: ownerHeight*0.6,
              child: CircleAvatar(
                  radius: 40,
                  foregroundImage: NetworkImage(widget.avatar)
              ),
          ),///头像
          Container(width: 8,),
          SizedBox(
            height: ownerHeight-16,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.username, style: const TextStyle(fontSize: 19,color:Colors.white),)),
                  ),///名字
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: _toggleFollowState,
                      child: Row(
                        children: [
                          Icon(
                            _isFollowed?Icons.star:Icons.star_border,
                            size: 15,
                            color: Colors.yellow[800],
                          ),
                          Text(
                            _isFollowed?'已关注':'关注',
                            style:TextStyle(
                              fontSize: 10,
                              color: _isFollowed?Colors.black:Colors.yellow[800]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),///关注
              ],
            ),
          ),//名字关注行
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width:75,
                child: Align(
                  alignment: Alignment.centerRight,
                  child:SizedBox(
                    child: Text(likeCount.toString(),style: TextStyle(color:Colors.yellow[300] ),),
                  ),
                ),
              ),///点赞数
              SizedBox(
                width: 20,
                height: 50,
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.centerRight,
                  icon: (_isLiked
                      ? const Icon(Icons.star)
                      : const Icon(Icons.star_border)),
                  color: Colors.yellow[300],
                  onPressed: _toggleLikeState,
                ),
              ),///点赞图标
            ],
          ),///喜欢
        ],
      ),
    );
  }
}

