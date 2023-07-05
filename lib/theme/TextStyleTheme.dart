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
    color: Colors.black,
    fontSize: 32,
  );

  ///帖子内容
  static const TextStyle postContentStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );

  ///帖子地点
  static const TextStyle postPlaceStyle = TextStyle(
    color:Colors.grey,
    fontSize: 10,
  );
}
