import 'package:flutter/material.dart';
/// 帖子
/// @author ww
/// @date 2023-06-24

class PostInfoBrief extends StatefulWidget {
  const PostInfoBrief({Key? key}) : super(key: key);

  @override
  PostInfoBriefState createState() => PostInfoBriefState();
}

class PostInfoBriefState extends State<PostInfoBrief> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: ListView(
            children: [
              titleRow, //标题
              Image.asset('assets/image/login.png', fit: BoxFit.cover), //图片
              titleSection2, //内容
              titleSection, //地点
            ],
          ),
        ),
      ),
    );
  }
}

//头像，名字，关注
Widget personalSection = Container(
  padding: const EdgeInsets.all(32),
  height: 120,
  child: Row(

    children: [
      Image.asset('assets/image/login.png', fit: BoxFit.cover),
      Column(
        children: [
          const Text('名字', style: TextStyle(fontSize: 20,),),
          Expanded(
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.red[500],),
                const Text('关注'),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
);

//单行输入框
Widget titleSection = const TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Enter text here',
  ),
  maxLines: 1,
);

//五行输入框
Widget titleSection2 = const TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Enter text here',
  ),
  maxLines: 5,
);

//tag,点赞，点赞数
Widget domain = const Row(
  textDirection: TextDirection.ltr,
  children: [
    Expanded(child: Text('标签')),
    Expanded(child: Text('点赞数')),
    Expanded(child: Text('点赞')),
  ],
);


Widget titleRow = const Row(
  children: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        '标题:',
        style: TextStyle(fontSize: 16.0),
      ),
    ),
    Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: '输入标题',
        ),
      ),
    ),
  ],
);
