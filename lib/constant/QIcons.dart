import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 和风天气图标
/// @author tt
/// @date 2023-06-30

class QIcons {
  QIcons._();

  static SvgPicture fromCode(String code) {
    return SvgPicture.asset(
      'assets/icons/$code.svg',
      width: 30,
      height: 30,
    );
  }

  static const IconData sun = IconData(0xe800, fontFamily: 'QWeather');
  static const IconData moon = IconData(0xe80a, fontFamily: 'QWeather');
  static const IconData wind = IconData(0xe8d2, fontFamily: 'QWeather');
  static const IconData rain = IconData(0xe83c, fontFamily: 'QWeather');
  static const IconData temp = IconData(0xe88c, fontFamily: 'QWeather');
}
