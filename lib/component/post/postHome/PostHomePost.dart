import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/postHome/PostBrief.dart';
import 'package:stellar_town/main.dart';

/// 帖子总览界面
/// @author ww
/// @date 2023-06-24

class PostHomePost extends StatelessWidget {
  const PostHomePost({
    Key? key,
    required this.title,
    required this.place,
    required this.tag}) : super(key: key);

  final String title;
  final String place;
  final String tag;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child:SizedBox(
        width: screenWidth*0.95,
        child:ListView.separated(
          itemCount:5,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: screenWidth*0.025,
              color: Colors.transparent,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return
              PostBrief(title: title, place: place, tag: tag);
          }
        )
      )
    );
  }
}
