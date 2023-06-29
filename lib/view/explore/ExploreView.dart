import 'package:flutter/material.dart';
import 'package:stellar_town/constant/ConstUrl.dart';
import 'package:stellar_town/constant/QIcons.dart';

/// 探索页面
/// @author tt
/// @date 2023-06-29

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  ExploreViewState createState() => ExploreViewState();
}

class ExploreViewState extends State<ExploreView> {
  late String province, city;

  @override
  Widget build(BuildContext context) {
    province = '湖北';
    city = '武汉';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            onPressed: null,
            icon: Icon(
              QIcons.sun,
              color: Colors.white,
            ),
          ),
          title: Center(child: Text('$province $city')),
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(ConstUrl.defaultAvatar),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
