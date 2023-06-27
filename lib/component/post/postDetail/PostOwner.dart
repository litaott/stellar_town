import 'package:flutter/material.dart';

/// 帖子主信息组件(头像，名字，关注)
/// @author ww
/// @date 2023-06-27

class PostOwner extends StatelessWidget {
  const PostOwner({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      height: 120,
      child: Row(
        children: [
          Image.asset('assets/image/login.png', fit: BoxFit.cover),
          Column(
            children: [
              Text(name, style: const TextStyle(fontSize: 20,),),
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
  }
}
