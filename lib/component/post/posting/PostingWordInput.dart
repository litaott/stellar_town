import 'package:flutter/material.dart';

/// 帖子发表文字输入框组件（PostingWordInput未完成，不用管）
/// @author ww
/// @date 2023-06-27

/*class PostingWordInput extends StatefulWidget {
  PostingWordInput({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.maxLine,
    required this.rowName,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  late  int maxLine;
  final String rowName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            rowName,
            style: const TextStyle(fontSize: 16.0),),
        ),
        Expanded(
          child: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: hintText,),
              maxLines: maxLine,
              onChanged: (value) {
                final lines = value.split('\n').length;
                setState(() {if (lines > maxLine) { maxLine = lines;}});
              }
          ),
        )
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

  void setState(Null Function() param0) {}
}*/

class PostingWordInput2 extends StatelessWidget {
  PostingWordInput2({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.maxLine,
    required this.rowName,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  late int maxLine;
  final String rowName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            rowName,
            style: const TextStyle(fontSize: 16.0),),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: hintText,),
            maxLines: maxLine,
          ),
        )
      ],
    );
  }
}