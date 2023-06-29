import 'package:flutter/material.dart';

/// 帖子标签部件
/// @author ww
/// @date 2023-06-29
///
class PostTag extends StatelessWidget{
  PostTag({super.key});
  final List<String> _tagList = ["星野摄影", "深空摄影", "天体摄影"];

  @override
  Widget build(BuildContext context) {
    return   Wrap(
      spacing: 10,
      children: _tagList.map((e) => Chip(label: Text(e,style: const TextStyle(fontSize: 10),))).toList(),
    );
  }
}