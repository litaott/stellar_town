import 'package:flutter/material.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/TextStyleTheme.dart';

/// 帖子详细信息主体组件(标题，内容（图片还没写）)
/// @author ww
/// @date 2023-06-29

class PostContent extends StatelessWidget {
  const PostContent({
    Key? key,
    required this.title,
    required this.content,
    required this.place,
  }) : super(key: key);

  final String title;
  final String content;
  final String place;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text(title,style: TextStyleTheme.postTitleStyle,),),
        Image.asset('assets/image/login.png', fit: BoxFit.scaleDown),
        SizedBox(
          width: screenWidth,
          child: Text(place,style:TextStyleTheme.postPlaceStyle,),),
        SizedBox(
          width: screenWidth,
          child: Text(content,style: TextStyleTheme.postContentStyle,),),
      ],
    );
  }
}