import 'package:dart_mappable/dart_mappable.dart';

part 'Astronomy.mapper.dart';

/// 气象实体类
/// @author tt
/// @date 2023-06-30

@MappableClass()
class Astronomy with AstronomyMappable {
  String fxTime; // 天气预报时间
  String value; // 月相值
  String name; // 月相名称
  String illumination; // 明亮度
  String icon; // 天气图标
  String status; // 状态
  String message; // 消息
  String inputDate; // 输入日期
  String city; // 城市
  String weatherCode; // 天气代码
  String longitude; // 经度
  String latitude; // 纬度
  String dayLength; // 白天时长
  String nightLength; // 夜晚时长
  String goldenHourAMStart; // 渐近黄金时刻（上午-开始）
  String goldenHourAMEnd; // 渐近黄金时刻（上午-结束）
  String goldenHourPMStart; // 渐近黄金时刻（下午-开始）
  String goldenHourPMEnd; // 渐近黄金时刻（下午-结束）
  String blueHourAMStart; // 渐近蓝时刻（上午-开始）
  String blueHourAMEnd; // 渐近蓝时刻（上午-结束）
  String blueHourPMStart; // 渐近蓝时刻（下午-开始）
  String blueHourPMEnd; // 渐近蓝时刻（下午-结束）
  String moonRiseTime; // 月升时间
  String moonMidTime; // 月中时间
  String moonSetTime; // 月落时间
  String sunRiseTime; // 日出时间
  String sunSetTime; // 日落时间
  String sunMidTime; // 太阳中天时间
  String sunrise; // 日出
  String sunset; // 日落
  String moonrise; // 月升
  String moonset; // 月落
  String civiDawnStart; // 民用晨光开始
  String civiDawnEnd; // 民用晨光结束
  String nautDawnStart; // 航海晨光开始
  String nautDawnEnd; // 航海晨光结束
  String astroDawnStart; // 天文晨光开始
  String astroDawnEnd; // 天文晨光结束

  Astronomy({
    this.fxTime = '---',
    this.value = '---',
    this.name = '---',
    this.illumination = '---',
    this.icon = '---',
    this.status = '---',
    this.message = '---',
    this.inputDate = '---',
    this.city = '---',
    this.weatherCode = '---',
    this.longitude = '---',
    this.latitude = '---',
    this.dayLength = '---',
    this.nightLength = '---',
    this.goldenHourAMStart = '---',
    this.goldenHourAMEnd = '---',
    this.goldenHourPMStart = '---',
    this.goldenHourPMEnd = '---',
    this.blueHourAMStart = '---',
    this.blueHourAMEnd = '---',
    this.blueHourPMStart = '---',
    this.blueHourPMEnd = '---',
    this.moonRiseTime = '---',
    this.moonMidTime = '---',
    this.moonSetTime = '---',
    this.sunRiseTime = '---',
    this.sunSetTime = '---',
    this.sunMidTime = '---',
    this.sunrise = '---',
    this.sunset = '---',
    this.moonrise = '---',
    this.moonset = '---',
    this.civiDawnStart = '---',
    this.civiDawnEnd = '---',
    this.nautDawnStart = '---',
    this.nautDawnEnd = '---',
    this.astroDawnStart = '---',
    this.astroDawnEnd = '---',
  });

  static const fromMap = AstronomyMapper.fromMap;
  static const fromJson = AstronomyMapper.fromJson;

  @override
  String toString() {
    return 'Astronomy{fxTime: $fxTime, value: $value, name: $name, illumination: $illumination, icon: $icon, status: $status, message: $message, inputDate: $inputDate, city: $city, weatherCode: $weatherCode, longitude: $longitude, latitude: $latitude, dayLength: $dayLength, nightLength: $nightLength, goldenHourAMStart: $goldenHourAMStart, goldenHourAMEnd: $goldenHourAMEnd, goldenHourPMStart: $goldenHourPMStart, goldenHourPMEnd: $goldenHourPMEnd, blueHourAMStart: $blueHourAMStart, blueHourAMEnd: $blueHourAMEnd, blueHourPMStart: $blueHourPMStart, blueHourPMEnd: $blueHourPMEnd, moonRiseTime: $moonRiseTime, moonMidTime: $moonMidTime, moonSetTime: $moonSetTime, sunRiseTime: $sunRiseTime, sunSetTime: $sunSetTime, sunMidTime: $sunMidTime, sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, civiDawnStart: $civiDawnStart, civiDawnEnd: $civiDawnEnd, nautDawnStart: $nautDawnStart, nautDawnEnd: $nautDawnEnd, astroDawnStart: $astroDawnStart, astroDawnEnd: $astroDawnEnd}';
  }
}
