import 'package:flutter/material.dart';
import 'package:stellar_town/theme/ColorTheme.dart';

/// 文字样式
/// @author tt
/// @date 2023-06-21

class TextStyleTheme {
  TextStyleTheme._();

  /// 跳转注册底部蓝字
  static const TextStyle registerStyle = TextStyle(
    color: ColorTheme.blue,
    fontSize: 14,
    fontStyle: FontStyle.italic,
  );

  /// 登录/注册按钮字体
  static const TextStyle loginButtonStyle = TextStyle(
    color: Colors.white,
    fontSize: 28,
  );

  /// 当前用户名
  static const TextStyle currentUsernameStyle = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  /// FeatureBar
  static const TextStyle featureBarStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  ///帖子标题
  static const TextStyle postTitleStyle = TextStyle(
    color: Color(0xC2FFFFFF),
    fontSize: 32,
  );

  ///帖子内容
  static const TextStyle postContentStyle = TextStyle(
    color: Color(0xFFDADACE),
    fontSize: 15,
  );

  ///帖子地点
  static const TextStyle postPlaceStyle = TextStyle(
    color: Colors.grey,
    fontSize: 10,
  );

  ///当前日期
  static const TextStyle dateStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    letterSpacing: 4,
  );

  ///距离
  static const TextStyle distanceStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
  );

  ///景点名
  static const TextStyle attractionNameStyle = TextStyle(
    color: Colors.black,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  ///城市名
  static const TextStyle cityStyle = TextStyle(
    color: Colors.black,
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );

  ///当前气温
  static const TextStyle tempStyle = TextStyle(
    color: Colors.black,
    fontSize: 54,
  );

  ///当前天气信息
  static const TextStyle weatherTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
  );

  ///景点简介
  static const TextStyle introductionStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
  );

  ///天气卡片内容
  static const TextStyle infoCardStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  ///天气卡片标题
  static const TextStyle cardTitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}
