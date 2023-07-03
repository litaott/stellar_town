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

  static const TextStyle dateStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    letterSpacing: 4,
  );

  static const TextStyle cityStyle = TextStyle(
    color: Colors.black,
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle tempStyle = TextStyle(
    color: Colors.black,
    fontSize: 54,
  );

  static const TextStyle weatherTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
  );

  static const TextStyle infoCardStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  static const TextStyle cardTitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}
