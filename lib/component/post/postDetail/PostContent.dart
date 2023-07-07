import 'package:flutter/material.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/theme/TextStyleTheme.dart';

/// 帖子详细信息主体组件(标题，图片，内容，地点)
/// @author ww
/// @date 2023-07-05

class PostContent extends StatelessWidget {
  const PostContent({
    Key? key,
    required this.title,
    required this.content,
    required this.place,
    required this.image,
  }) : super(key: key);

  final String title;
  final String content;
  final String place;
  final String image;

  isImage() {
    if (image != "" && image != null) {
      return Image.network(image, fit: BoxFit.cover);
    } else {
      return Container();
    }
  }//有图片输出图片

  isPlace() {
    if (image != "" && image != null&&place != "" && place != null) {
      return SizedBox(
        width: screenWidth,
        child: Text(place,style:TextStyleTheme.postPlaceStyle,),);
    } else {
      return Container();
    }
  }//有图片和地点输出地点

  isContent() {
    if (content != "" && content != null) {
      return SizedBox(
        width: screenWidth,
        child: Text(content,style: TextStyleTheme.postContentStyle,),);
    } else {
      return Container();
    }
  }//有内容输出内容


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text(title,style: TextStyleTheme.postTitleStyle,),),
        isImage(),
        isPlace(),
        isContent(),
      ],
    );


  }
}