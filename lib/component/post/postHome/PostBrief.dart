import 'package:flutter/material.dart';
import 'package:stellar_town/component/post/postDetail/PostBottum.dart';
import 'package:stellar_town/main.dart';
import 'package:stellar_town/view/post/PostView.dart';

class PostBrief extends StatelessWidget {
  const PostBrief({Key? key,
    required this.title,
    required this.place,
    required this.tag
  }) : super(key: key);

  final String title;
  final String place;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: screenWidth*0.8,
        child:GestureDetector(
          onTap: () {
            // 导航到新页面，并传递详细信息参数
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PostView()),
            );
          },
          child:Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/image/login.png', fit: BoxFit.scaleDown),),
                  Expanded(
                    flex: 4,
                    child:Text(title),),
                ],
              ),//头像，标题
              Image.asset('assets/image/login.png', fit: BoxFit.cover),//图片
              PostBottom(
                place: place,
                tag: tag,
              ),
            ],
          ),
        ),
    );
  }
}
