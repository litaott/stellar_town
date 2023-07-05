import 'package:dart_mappable/dart_mappable.dart';

part 'Weather.mapper.dart';

/// 天气实体类
/// @author tt
/// @date 2023-06-30

@MappableClass()
class Weather with WeatherMappable {
  String obsTime; // 观测时间
  String temp; // 温度
  String feelsLike; // 体感温度
  String icon; // 天气图标
  String text; // 天气文字
  String wind360; // 风向角度
  String windDir; // 风向
  String windScale; // 风力等级
  String windSpeed; // 风速
  String humidity; // 相对湿度
  String precip; // 降水量
  String pressure; // 气压
  String vis; // 能见度
  String cloud; // 云量
  String dew; // 露点温度

  Weather({
    this.obsTime = '---',
    this.temp = '---',
    this.feelsLike = '---',
    this.icon = '100',
    this.text = '---',
    this.wind360 = '---',
    this.windDir = '---',
    this.windScale = '---',
    this.windSpeed = '---',
    this.humidity = '---',
    this.precip = '---',
    this.pressure = '---',
    this.vis = '---',
    this.cloud = '---',
    this.dew = '---',
  });

  static const fromMap = WeatherMapper.fromMap;
  static const fromJson = WeatherMapper.fromJson;
}
