import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/view/post/PostView.dart';
import 'package:stellar_town/view/user/PersonalPageView.dart';
import '../../../entity/user/User.dart';
import '../../../theme/TextStyleTheme.dart';
import '../../../util/HttpUtil.dart';
import '../postDetail/PostTag.dart';

/// 帖子简略信息部件
/// @author ww
/// @date 2023-07-05

class PostBrief extends StatefulWidget {
  PostBrief({Key? key,
    required this.postId,
    required this.image,
    required this.title,
    required this.tag,
    required this.userId,
    required this.place,
    required this.content,
    required this.likeCount,
  }) : super(key: key);

  @override
  _PostBriefState createState() => _PostBriefState();

  final int postId;
  final int userId;
  final String image;
  final String title;
  final String tag;
  final String place;
  final String content;
  final int likeCount;

  User user = User();
}

class _PostBriefState extends State<PostBrief>{

  @override
  void initState() {
    super.initState();
    getUserInfo(); // 调用接口获取数据
  }

  void getUserInfo() async {
    log('发送获取用户信息请求');
    Response userResponse = await HttpUtil.getJson('${ConstUrl.getUserInfoById}?id=${widget.userId}');

    if (userResponse.data['code']~/100== 2) {
      widget.user = User.fromMap(userResponse.data['data']);
      /*List<Map<String, dynamic>> maps;
      maps = userResponse.data['data'];
      for (int i = 0; i < maps.length; i++) {
        widget.user = User.fromMap(userResponse.data['data'][i]);
      }*/
      log('获取用户信息成功');
    }else{
      log('获取用户信息失败');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 导航到新页面，并传递详细信息参数
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)
          => PostView(
              postId:widget.postId,
              title: widget.title,
              tag: widget.tag,
              image: widget.image,
              address:widget.place,
              content: widget.content,
              userId: widget.userId,
              likeCount: widget.likeCount,
              avatar: widget.user.avatar,
              userName: widget.user.username,)),
        );
      },///点击跳转到详细信息界面
      child:Column(
        children: [
          Container(
            color: Colors.blue,
            padding:const EdgeInsets.all(5.0) ,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PersonalPageView( user: widget.user)),
                          );
                        },//点击跳转到个人主页界面
                        child: SizedBox(
                          //padding:const EdgeInsets.all(5.0) ,
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                              radius: 40,
                              foregroundImage: NetworkImage(widget.user.avatar)
                          ),
                        )//圆形头像
                    ),//头像，点击前往主页
                    Expanded(
                      child:Center(child: Text(widget.title)),),
                  ],
                ),///头像，标题
                isImage(), ///图片
                isTag(),///标签
              ],
            ),
          ),///帖子
          Container(
            height: screenWidth*0.025,
          ),///帖子间隔
        ],
      ),
    );
  }

  isImage(){
    if(widget.image!=""&&widget.image!=null){
      return  Column(
        children: [
          Container(
              padding:const EdgeInsets.only(top: 7,bottom: 7) ,
              child: Image.network(widget.image, fit: BoxFit.cover)
          ),
          SizedBox(
            width: screenWidth*0.95-14,
            child: Text(widget.place,style:TextStyleTheme.postPlaceStyle,)),
        ],
      );
    }else{
      return Container();
    }
  }///有图片就输出图片和地址

  isTag(){
    if(widget.tag!=""&&widget.tag!=null){
      return PostTag(tag:widget.tag,);
    }else{
      return Container();
    }
  }///有标签就输出标签


}
