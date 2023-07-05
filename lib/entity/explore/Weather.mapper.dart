// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'Weather.dart';

class WeatherMapper extends ClassMapperBase<Weather> {
  WeatherMapper._();

  static WeatherMapper? _instance;
  static WeatherMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WeatherMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Weather';

  static String _$obsTime(Weather v) => v.obsTime;
  static const Field<Weather, String> _f$obsTime =
      Field('obsTime', _$obsTime, opt: true, def: '---');
  static String _$temp(Weather v) => v.temp;
  static const Field<Weather, String> _f$temp =
      Field('temp', _$temp, opt: true, def: '---');
  static String _$feelsLike(Weather v) => v.feelsLike;
  static const Field<Weather, String> _f$feelsLike =
      Field('feelsLike', _$feelsLike, opt: true, def: '---');
  static String _$icon(Weather v) => v.icon;
  static const Field<Weather, String> _f$icon =
      Field('icon', _$icon, opt: true, def: '100');
  static String _$text(Weather v) => v.text;
  static const Field<Weather, String> _f$text =
      Field('text', _$text, opt: true, def: '---');
  static String _$wind360(Weather v) => v.wind360;
  static const Field<Weather, String> _f$wind360 =
      Field('wind360', _$wind360, opt: true, def: '---');
  static String _$windDir(Weather v) => v.windDir;
  static const Field<Weather, String> _f$windDir =
      Field('windDir', _$windDir, opt: true, def: '---');
  static String _$windScale(Weather v) => v.windScale;
  static const Field<Weather, String> _f$windScale =
      Field('windScale', _$windScale, opt: true, def: '---');
  static String _$windSpeed(Weather v) => v.windSpeed;
  static const Field<Weather, String> _f$windSpeed =
      Field('windSpeed', _$windSpeed, opt: true, def: '---');
  static String _$humidity(Weather v) => v.humidity;
  static const Field<Weather, String> _f$humidity =
      Field('humidity', _$humidity, opt: true, def: '---');
  static String _$precip(Weather v) => v.precip;
  static const Field<Weather, String> _f$precip =
      Field('precip', _$precip, opt: true, def: '---');
  static String _$pressure(Weather v) => v.pressure;
  static const Field<Weather, String> _f$pressure =
      Field('pressure', _$pressure, opt: true, def: '---');
  static String _$vis(Weather v) => v.vis;
  static const Field<Weather, String> _f$vis =
      Field('vis', _$vis, opt: true, def: '---');
  static String _$cloud(Weather v) => v.cloud;
  static const Field<Weather, String> _f$cloud =
      Field('cloud', _$cloud, opt: true, def: '---');
  static String _$dew(Weather v) => v.dew;
  static const Field<Weather, String> _f$dew =
      Field('dew', _$dew, opt: true, def: '---');

  @override
  final Map<Symbol, Field<Weather, dynamic>> fields = const {
    #obsTime: _f$obsTime,
    #temp: _f$temp,
    #feelsLike: _f$feelsLike,
    #icon: _f$icon,
    #text: _f$text,
    #wind360: _f$wind360,
    #windDir: _f$windDir,
    #windScale: _f$windScale,
    #windSpeed: _f$windSpeed,
    #humidity: _f$humidity,
    #precip: _f$precip,
    #pressure: _f$pressure,
    #vis: _f$vis,
    #cloud: _f$cloud,
    #dew: _f$dew,
  };

  static Weather _instantiate(DecodingData data) {
    return Weather(
        obsTime: data.dec(_f$obsTime),
        temp: data.dec(_f$temp),
        feelsLike: data.dec(_f$feelsLike),
        icon: data.dec(_f$icon),
        text: data.dec(_f$text),
        wind360: data.dec(_f$wind360),
        windDir: data.dec(_f$windDir),
        windScale: data.dec(_f$windScale),
        windSpeed: data.dec(_f$windSpeed),
        humidity: data.dec(_f$humidity),
        precip: data.dec(_f$precip),
        pressure: data.dec(_f$pressure),
        vis: data.dec(_f$vis),
        cloud: data.dec(_f$cloud),
        dew: data.dec(_f$dew));
  }

  @override
  final Function instantiate = _instantiate;

  static Weather fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Weather>(map));
  }

  static Weather fromJson(String json) {
    return _guard((c) => c.fromJson<Weather>(json));
  }
}

mixin WeatherMappable {
  String toJson() {
    return WeatherMapper._guard((c) => c.toJson(this as Weather));
  }

  Map<String, dynamic> toMap() {
    return WeatherMapper._guard((c) => c.toMap(this as Weather));
  }

  WeatherCopyWith<Weather, Weather, Weather> get copyWith =>
      _WeatherCopyWithImpl(this as Weather, $identity, $identity);
  @override
  String toString() {
    return WeatherMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WeatherMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WeatherMapper._guard((c) => c.hash(this));
  }
}

extension WeatherValueCopy<$R, $Out> on ObjectCopyWith<$R, Weather, $Out> {
  WeatherCopyWith<$R, Weather, $Out> get $asWeather =>
      $base.as((v, t, t2) => _WeatherCopyWithImpl(v, t, t2));
}

abstract class WeatherCopyWith<$R, $In extends Weather, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? obsTime,
      String? temp,
      String? feelsLike,
      String? icon,
      String? text,
      String? wind360,
      String? windDir,
      String? windScale,
      String? windSpeed,
      String? humidity,
      String? precip,
      String? pressure,
      String? vis,
      String? cloud,
      String? dew});
  WeatherCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WeatherCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Weather, $Out>
    implements WeatherCopyWith<$R, Weather, $Out> {
  _WeatherCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Weather> $mapper =
      WeatherMapper.ensureInitialized();
  @override
  $R call(
          {String? obsTime,
          String? temp,
          String? feelsLike,
          String? icon,
          String? text,
          String? wind360,
          String? windDir,
          String? windScale,
          String? windSpeed,
          String? humidity,
          String? precip,
          String? pressure,
          String? vis,
          String? cloud,
          String? dew}) =>
      $apply(FieldCopyWithData({
        if (obsTime != null) #obsTime: obsTime,
        if (temp != null) #temp: temp,
        if (feelsLike != null) #feelsLike: feelsLike,
        if (icon != null) #icon: icon,
        if (text != null) #text: text,
        if (wind360 != null) #wind360: wind360,
        if (windDir != null) #windDir: windDir,
        if (windScale != null) #windScale: windScale,
        if (windSpeed != null) #windSpeed: windSpeed,
        if (humidity != null) #humidity: humidity,
        if (precip != null) #precip: precip,
        if (pressure != null) #pressure: pressure,
        if (vis != null) #vis: vis,
        if (cloud != null) #cloud: cloud,
        if (dew != null) #dew: dew
      }));
  @override
  Weather $make(CopyWithData data) => Weather(
      obsTime: data.get(#obsTime, or: $value.obsTime),
      temp: data.get(#temp, or: $value.temp),
      feelsLike: data.get(#feelsLike, or: $value.feelsLike),
      icon: data.get(#icon, or: $value.icon),
      text: data.get(#text, or: $value.text),
      wind360: data.get(#wind360, or: $value.wind360),
      windDir: data.get(#windDir, or: $value.windDir),
      windScale: data.get(#windScale, or: $value.windScale),
      windSpeed: data.get(#windSpeed, or: $value.windSpeed),
      humidity: data.get(#humidity, or: $value.humidity),
      precip: data.get(#precip, or: $value.precip),
      pressure: data.get(#pressure, or: $value.pressure),
      vis: data.get(#vis, or: $value.vis),
      cloud: data.get(#cloud, or: $value.cloud),
      dew: data.get(#dew, or: $value.dew));

  @override
  WeatherCopyWith<$R2, Weather, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _WeatherCopyWithImpl($value, $cast, t);
}
