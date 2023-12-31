import 'package:flutter/material.dart';
import 'package:stellar_town/main.dart';

/// 帖子标签部件
/// @author ww
/// @date 2023-07-05

class PostTag extends StatelessWidget{
  PostTag({super.key, required this.tag});
  final String  tag;
  final List<String> _tagList = [];

  @override
  Widget build(BuildContext context) {
  _tagList.addAll(tag.split('/'));
  return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: SizedBox(
        width: screenWidth,
        child: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 10,
          children:[
            ..._tagList.map((e) => Chip(label: Text(e,style: const TextStyle(fontSize: 10),))).toList(),
            Container(height: 5,),
          ],
        ),
      ),
    );
  }
}