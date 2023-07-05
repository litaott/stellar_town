import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/view/post/PostView.dart';
import 'package:stellar_town/view/user/PersonalPageView.dart';
import '../../../entity/user/User.dart';
import '../../../util/HttpUtil.dart';
import '../postDetail/PostTag.dart';

/// 帖子简略信息部件
/// @author ww
/// @date 2023-06-29

class PostBrief extends StatelessWidget {
  PostBrief({Key? key,
    required this.postId,
    required this.image,
    required this.title,
    required this.tag,
    required this.userId,
  }) : super(key: key);

  final int postId;
  final int userId;
  final String image;
  final String title;
  final String tag;

  User user = User();

  void postBrief() async {
    Response userResponse = await HttpUtil.postJson(ConstUrl.getUserInfo, userId as Map);
    if (userResponse.data['code']/ 100 == 2) {
      List<Map<String, dynamic>> maps;
      maps = userResponse.data['data'];
      for (int i = 0; i < maps.length; i++) {
        user = User.fromMap(userResponse.data['data'][i]);
      }
      log('获取用户信息成功');
    }else{
      log('获取用户信息失败');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        color: Colors.blueGrey,
      ),
      width: screenWidth*0.5,
        child:GestureDetector(
          onTap: () {
            // 导航到新页面，并传递详细信息参数
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostView(postId:postId,)),
            );
          },//点击跳转到详细信息界面
          child:Container(
            padding:const EdgeInsets.all(5.0) ,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding:const EdgeInsets.all(5.0) ,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      width: 60,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PersonalPageView( user: user,)),
                              );
                            },//点击跳转到个人主页界面
                            child: CircleAvatar(
                                radius: 40,
                                foregroundImage: NetworkImage(user.avatar)
                            )//圆形头像
                        )
                      ),
                    ),
                    Expanded(
                      child:Center(child: Text(title)),),
                  ],
                ),///头像，标题
                Container(
                    padding:const EdgeInsets.only(top: 7,bottom: 7) ,
                    child: Image.network(image, fit: BoxFit.cover)
                ), ///图片
                PostTag(tag:tag,),///标签
              ],
            ),
          ),
        ),
    );
  }
}
