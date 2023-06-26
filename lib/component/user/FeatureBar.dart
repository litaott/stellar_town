import 'package:flutter/material.dart';
import 'package:stellar_town/theme/TextStyleTheme.dart';

/// 功能按钮块
/// @author tt
/// @date 2023-06-25

class FeatureBar extends StatefulWidget {
  const FeatureBar({super.key});

  @override
  State createState() => FeatureBarState();
}

class FeatureBarState extends State<FeatureBar> {
  String publishNum = '0', thumbNum = '0', followNum = '0', followerNum = '0';

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      buttonPadding: EdgeInsets.zero,
      children: [
        TextButton(
          onPressed: null,
          child: Column(
            children: [
              Text(
                publishNum,
                style: TextStyleTheme.featureBarStyle,
              ),
              const Text(
                '发布',
                style: TextStyleTheme.featureBarStyle,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: null,
          child: Column(
            children: [
              Text(
                thumbNum,
                style: TextStyleTheme.featureBarStyle,
              ),
              const Text(
                '点赞',
                style: TextStyleTheme.featureBarStyle,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: null,
          child: Column(
            children: [
              Text(
                followNum,
                style: TextStyleTheme.featureBarStyle,
              ),
              const Text(
                '关注',
                style: TextStyleTheme.featureBarStyle,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: null,
          child: Column(
            children: [
              Text(
                followerNum,
                style: TextStyleTheme.featureBarStyle,
              ),
              const Text(
                '粉丝',
                style: TextStyleTheme.featureBarStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
