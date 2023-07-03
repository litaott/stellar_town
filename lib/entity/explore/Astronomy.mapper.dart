// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'Astronomy.dart';

class AstronomyMapper extends ClassMapperBase<Astronomy> {
  AstronomyMapper._();

  static AstronomyMapper? _instance;
  static AstronomyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AstronomyMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Astronomy';

  static String _$fxTime(Astronomy v) => v.fxTime;
  static const Field<Astronomy, String> _f$fxTime =
      Field('fxTime', _$fxTime, opt: true, def: '---');
  static String _$value(Astronomy v) => v.value;
  static const Field<Astronomy, String> _f$value =
      Field('value', _$value, opt: true, def: '---');
  static String _$name(Astronomy v) => v.name;
  static const Field<Astronomy, String> _f$name =
      Field('name', _$name, opt: true, def: '---');
  static String _$illumination(Astronomy v) => v.illumination;
  static const Field<Astronomy, String> _f$illumination =
      Field('illumination', _$illumination, opt: true, def: '---');
  static String _$icon(Astronomy v) => v.icon;
  static const Field<Astronomy, String> _f$icon =
      Field('icon', _$icon, opt: true, def: '---');
  static String _$status(Astronomy v) => v.status;
  static const Field<Astronomy, String> _f$status =
      Field('status', _$status, opt: true, def: '---');
  static String _$message(Astronomy v) => v.message;
  static const Field<Astronomy, String> _f$message =
      Field('message', _$message, opt: true, def: '---');
  static String _$inputDate(Astronomy v) => v.inputDate;
  static const Field<Astronomy, String> _f$inputDate =
      Field('inputDate', _$inputDate, opt: true, def: '---');
  static String _$city(Astronomy v) => v.city;
  static const Field<Astronomy, String> _f$city =
      Field('city', _$city, opt: true, def: '---');
  static String _$weatherCode(Astronomy v) => v.weatherCode;
  static const Field<Astronomy, String> _f$weatherCode =
      Field('weatherCode', _$weatherCode, opt: true, def: '---');
  static String _$longitude(Astronomy v) => v.longitude;
  static const Field<Astronomy, String> _f$longitude =
      Field('longitude', _$longitude, opt: true, def: '---');
  static String _$latitude(Astronomy v) => v.latitude;
  static const Field<Astronomy, String> _f$latitude =
      Field('latitude', _$latitude, opt: true, def: '---');
  static String _$dayLength(Astronomy v) => v.dayLength;
  static const Field<Astronomy, String> _f$dayLength =
      Field('dayLength', _$dayLength, opt: true, def: '---');
  static String _$nightLength(Astronomy v) => v.nightLength;
  static const Field<Astronomy, String> _f$nightLength =
      Field('nightLength', _$nightLength, opt: true, def: '---');
  static String _$goldenHourAMStart(Astronomy v) => v.goldenHourAMStart;
  static const Field<Astronomy, String> _f$goldenHourAMStart =
      Field('goldenHourAMStart', _$goldenHourAMStart, opt: true, def: '---');
  static String _$goldenHourAMEnd(Astronomy v) => v.goldenHourAMEnd;
  static const Field<Astronomy, String> _f$goldenHourAMEnd =
      Field('goldenHourAMEnd', _$goldenHourAMEnd, opt: true, def: '---');
  static String _$goldenHourPMStart(Astronomy v) => v.goldenHourPMStart;
  static const Field<Astronomy, String> _f$goldenHourPMStart =
      Field('goldenHourPMStart', _$goldenHourPMStart, opt: true, def: '---');
  static String _$goldenHourPMEnd(Astronomy v) => v.goldenHourPMEnd;
  static const Field<Astronomy, String> _f$goldenHourPMEnd =
      Field('goldenHourPMEnd', _$goldenHourPMEnd, opt: true, def: '---');
  static String _$blueHourAMStart(Astronomy v) => v.blueHourAMStart;
  static const Field<Astronomy, String> _f$blueHourAMStart =
      Field('blueHourAMStart', _$blueHourAMStart, opt: true, def: '---');
  static String _$blueHourAMEnd(Astronomy v) => v.blueHourAMEnd;
  static const Field<Astronomy, String> _f$blueHourAMEnd =
      Field('blueHourAMEnd', _$blueHourAMEnd, opt: true, def: '---');
  static String _$blueHourPMStart(Astronomy v) => v.blueHourPMStart;
  static const Field<Astronomy, String> _f$blueHourPMStart =
      Field('blueHourPMStart', _$blueHourPMStart, opt: true, def: '---');
  static String _$blueHourPMEnd(Astronomy v) => v.blueHourPMEnd;
  static const Field<Astronomy, String> _f$blueHourPMEnd =
      Field('blueHourPMEnd', _$blueHourPMEnd, opt: true, def: '---');
  static String _$moonRiseTime(Astronomy v) => v.moonRiseTime;
  static const Field<Astronomy, String> _f$moonRiseTime =
      Field('moonRiseTime', _$moonRiseTime, opt: true, def: '---');
  static String _$moonMidTime(Astronomy v) => v.moonMidTime;
  static const Field<Astronomy, String> _f$moonMidTime =
      Field('moonMidTime', _$moonMidTime, opt: true, def: '---');
  static String _$moonSetTime(Astronomy v) => v.moonSetTime;
  static const Field<Astronomy, String> _f$moonSetTime =
      Field('moonSetTime', _$moonSetTime, opt: true, def: '---');
  static String _$sunRiseTime(Astronomy v) => v.sunRiseTime;
  static const Field<Astronomy, String> _f$sunRiseTime =
      Field('sunRiseTime', _$sunRiseTime, opt: true, def: '---');
  static String _$sunSetTime(Astronomy v) => v.sunSetTime;
  static const Field<Astronomy, String> _f$sunSetTime =
      Field('sunSetTime', _$sunSetTime, opt: true, def: '---');
  static String _$sunMidTime(Astronomy v) => v.sunMidTime;
  static const Field<Astronomy, String> _f$sunMidTime =
      Field('sunMidTime', _$sunMidTime, opt: true, def: '---');
  static String _$sunrise(Astronomy v) => v.sunrise;
  static const Field<Astronomy, String> _f$sunrise =
      Field('sunrise', _$sunrise, opt: true, def: '---');
  static String _$sunset(Astronomy v) => v.sunset;
  static const Field<Astronomy, String> _f$sunset =
      Field('sunset', _$sunset, opt: true, def: '---');
  static String _$moonrise(Astronomy v) => v.moonrise;
  static const Field<Astronomy, String> _f$moonrise =
      Field('moonrise', _$moonrise, opt: true, def: '---');
  static String _$moonset(Astronomy v) => v.moonset;
  static const Field<Astronomy, String> _f$moonset =
      Field('moonset', _$moonset, opt: true, def: '---');
  static String _$civiDawnStart(Astronomy v) => v.civiDawnStart;
  static const Field<Astronomy, String> _f$civiDawnStart =
      Field('civiDawnStart', _$civiDawnStart, opt: true, def: '---');
  static String _$civiDawnEnd(Astronomy v) => v.civiDawnEnd;
  static const Field<Astronomy, String> _f$civiDawnEnd =
      Field('civiDawnEnd', _$civiDawnEnd, opt: true, def: '---');
  static String _$nautDawnStart(Astronomy v) => v.nautDawnStart;
  static const Field<Astronomy, String> _f$nautDawnStart =
      Field('nautDawnStart', _$nautDawnStart, opt: true, def: '---');
  static String _$nautDawnEnd(Astronomy v) => v.nautDawnEnd;
  static const Field<Astronomy, String> _f$nautDawnEnd =
      Field('nautDawnEnd', _$nautDawnEnd, opt: true, def: '---');
  static String _$astroDawnStart(Astronomy v) => v.astroDawnStart;
  static const Field<Astronomy, String> _f$astroDawnStart =
      Field('astroDawnStart', _$astroDawnStart, opt: true, def: '---');
  static String _$astroDawnEnd(Astronomy v) => v.astroDawnEnd;
  static const Field<Astronomy, String> _f$astroDawnEnd =
      Field('astroDawnEnd', _$astroDawnEnd, opt: true, def: '---');

  @override
  final Map<Symbol, Field<Astronomy, dynamic>> fields = const {
    #fxTime: _f$fxTime,
    #value: _f$value,
    #name: _f$name,
    #illumination: _f$illumination,
    #icon: _f$icon,
    #status: _f$status,
    #message: _f$message,
    #inputDate: _f$inputDate,
    #city: _f$city,
    #weatherCode: _f$weatherCode,
    #longitude: _f$longitude,
    #latitude: _f$latitude,
    #dayLength: _f$dayLength,
    #nightLength: _f$nightLength,
    #goldenHourAMStart: _f$goldenHourAMStart,
    #goldenHourAMEnd: _f$goldenHourAMEnd,
    #goldenHourPMStart: _f$goldenHourPMStart,
    #goldenHourPMEnd: _f$goldenHourPMEnd,
    #blueHourAMStart: _f$blueHourAMStart,
    #blueHourAMEnd: _f$blueHourAMEnd,
    #blueHourPMStart: _f$blueHourPMStart,
    #blueHourPMEnd: _f$blueHourPMEnd,
    #moonRiseTime: _f$moonRiseTime,
    #moonMidTime: _f$moonMidTime,
    #moonSetTime: _f$moonSetTime,
    #sunRiseTime: _f$sunRiseTime,
    #sunSetTime: _f$sunSetTime,
    #sunMidTime: _f$sunMidTime,
    #sunrise: _f$sunrise,
    #sunset: _f$sunset,
    #moonrise: _f$moonrise,
    #moonset: _f$moonset,
    #civiDawnStart: _f$civiDawnStart,
    #civiDawnEnd: _f$civiDawnEnd,
    #nautDawnStart: _f$nautDawnStart,
    #nautDawnEnd: _f$nautDawnEnd,
    #astroDawnStart: _f$astroDawnStart,
    #astroDawnEnd: _f$astroDawnEnd,
  };

  static Astronomy _instantiate(DecodingData data) {
    return Astronomy(
        fxTime: data.dec(_f$fxTime),
        value: data.dec(_f$value),
        name: data.dec(_f$name),
        illumination: data.dec(_f$illumination),
        icon: data.dec(_f$icon),
        status: data.dec(_f$status),
        message: data.dec(_f$message),
        inputDate: data.dec(_f$inputDate),
        city: data.dec(_f$city),
        weatherCode: data.dec(_f$weatherCode),
        longitude: data.dec(_f$longitude),
        latitude: data.dec(_f$latitude),
        dayLength: data.dec(_f$dayLength),
        nightLength: data.dec(_f$nightLength),
        goldenHourAMStart: data.dec(_f$goldenHourAMStart),
        goldenHourAMEnd: data.dec(_f$goldenHourAMEnd),
        goldenHourPMStart: data.dec(_f$goldenHourPMStart),
        goldenHourPMEnd: data.dec(_f$goldenHourPMEnd),
        blueHourAMStart: data.dec(_f$blueHourAMStart),
        blueHourAMEnd: data.dec(_f$blueHourAMEnd),
        blueHourPMStart: data.dec(_f$blueHourPMStart),
        blueHourPMEnd: data.dec(_f$blueHourPMEnd),
        moonRiseTime: data.dec(_f$moonRiseTime),
        moonMidTime: data.dec(_f$moonMidTime),
        moonSetTime: data.dec(_f$moonSetTime),
        sunRiseTime: data.dec(_f$sunRiseTime),
        sunSetTime: data.dec(_f$sunSetTime),
        sunMidTime: data.dec(_f$sunMidTime),
        sunrise: data.dec(_f$sunrise),
        sunset: data.dec(_f$sunset),
        moonrise: data.dec(_f$moonrise),
        moonset: data.dec(_f$moonset),
        civiDawnStart: data.dec(_f$civiDawnStart),
        civiDawnEnd: data.dec(_f$civiDawnEnd),
        nautDawnStart: data.dec(_f$nautDawnStart),
        nautDawnEnd: data.dec(_f$nautDawnEnd),
        astroDawnStart: data.dec(_f$astroDawnStart),
        astroDawnEnd: data.dec(_f$astroDawnEnd));
  }

  @override
  final Function instantiate = _instantiate;

  static Astronomy fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Astronomy>(map));
  }

  static Astronomy fromJson(String json) {
    return _guard((c) => c.fromJson<Astronomy>(json));
  }
}

mixin AstronomyMappable {
  String toJson() {
    return AstronomyMapper._guard((c) => c.toJson(this as Astronomy));
  }

  Map<String, dynamic> toMap() {
    return AstronomyMapper._guard((c) => c.toMap(this as Astronomy));
  }

  AstronomyCopyWith<Astronomy, Astronomy, Astronomy> get copyWith =>
      _AstronomyCopyWithImpl(this as Astronomy, $identity, $identity);
  @override
  String toString() {
    return AstronomyMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AstronomyMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AstronomyMapper._guard((c) => c.hash(this));
  }
}

extension AstronomyValueCopy<$R, $Out> on ObjectCopyWith<$R, Astronomy, $Out> {
  AstronomyCopyWith<$R, Astronomy, $Out> get $asAstronomy =>
      $base.as((v, t, t2) => _AstronomyCopyWithImpl(v, t, t2));
}

abstract class AstronomyCopyWith<$R, $In extends Astronomy, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? fxTime,
      String? value,
      String? name,
      String? illumination,
      String? icon,
      String? status,
      String? message,
      String? inputDate,
      String? city,
      String? weatherCode,
      String? longitude,
      String? latitude,
      String? dayLength,
      String? nightLength,
      String? goldenHourAMStart,
      String? goldenHourAMEnd,
      String? goldenHourPMStart,
      String? goldenHourPMEnd,
      String? blueHourAMStart,
      String? blueHourAMEnd,
      String? blueHourPMStart,
      String? blueHourPMEnd,
      String? moonRiseTime,
      String? moonMidTime,
      String? moonSetTime,
      String? sunRiseTime,
      String? sunSetTime,
      String? sunMidTime,
      String? sunrise,
      String? sunset,
      String? moonrise,
      String? moonset,
      String? civiDawnStart,
      String? civiDawnEnd,
      String? nautDawnStart,
      String? nautDawnEnd,
      String? astroDawnStart,
      String? astroDawnEnd});
  AstronomyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AstronomyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Astronomy, $Out>
    implements AstronomyCopyWith<$R, Astronomy, $Out> {
  _AstronomyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Astronomy> $mapper =
      AstronomyMapper.ensureInitialized();
  @override
  $R call(
          {String? fxTime,
          String? value,
          String? name,
          String? illumination,
          String? icon,
          String? status,
          String? message,
          String? inputDate,
          String? city,
          String? weatherCode,
          String? longitude,
          String? latitude,
          String? dayLength,
          String? nightLength,
          String? goldenHourAMStart,
          String? goldenHourAMEnd,
          String? goldenHourPMStart,
          String? goldenHourPMEnd,
          String? blueHourAMStart,
          String? blueHourAMEnd,
          String? blueHourPMStart,
          String? blueHourPMEnd,
          String? moonRiseTime,
          String? moonMidTime,
          String? moonSetTime,
          String? sunRiseTime,
          String? sunSetTime,
          String? sunMidTime,
          String? sunrise,
          String? sunset,
          String? moonrise,
          String? moonset,
          String? civiDawnStart,
          String? civiDawnEnd,
          String? nautDawnStart,
          String? nautDawnEnd,
          String? astroDawnStart,
          String? astroDawnEnd}) =>
      $apply(FieldCopyWithData({
        if (fxTime != null) #fxTime: fxTime,
        if (value != null) #value: value,
        if (name != null) #name: name,
        if (illumination != null) #illumination: illumination,
        if (icon != null) #icon: icon,
        if (status != null) #status: status,
        if (message != null) #message: message,
        if (inputDate != null) #inputDate: inputDate,
        if (city != null) #city: city,
        if (weatherCode != null) #weatherCode: weatherCode,
        if (longitude != null) #longitude: longitude,
        if (latitude != null) #latitude: latitude,
        if (dayLength != null) #dayLength: dayLength,
        if (nightLength != null) #nightLength: nightLength,
        if (goldenHourAMStart != null) #goldenHourAMStart: goldenHourAMStart,
        if (goldenHourAMEnd != null) #goldenHourAMEnd: goldenHourAMEnd,
        if (goldenHourPMStart != null) #goldenHourPMStart: goldenHourPMStart,
        if (goldenHourPMEnd != null) #goldenHourPMEnd: goldenHourPMEnd,
        if (blueHourAMStart != null) #blueHourAMStart: blueHourAMStart,
        if (blueHourAMEnd != null) #blueHourAMEnd: blueHourAMEnd,
        if (blueHourPMStart != null) #blueHourPMStart: blueHourPMStart,
        if (blueHourPMEnd != null) #blueHourPMEnd: blueHourPMEnd,
        if (moonRiseTime != null) #moonRiseTime: moonRiseTime,
        if (moonMidTime != null) #moonMidTime: moonMidTime,
        if (moonSetTime != null) #moonSetTime: moonSetTime,
        if (sunRiseTime != null) #sunRiseTime: sunRiseTime,
        if (sunSetTime != null) #sunSetTime: sunSetTime,
        if (sunMidTime != null) #sunMidTime: sunMidTime,
        if (sunrise != null) #sunrise: sunrise,
        if (sunset != null) #sunset: sunset,
        if (moonrise != null) #moonrise: moonrise,
        if (moonset != null) #moonset: moonset,
        if (civiDawnStart != null) #civiDawnStart: civiDawnStart,
        if (civiDawnEnd != null) #civiDawnEnd: civiDawnEnd,
        if (nautDawnStart != null) #nautDawnStart: nautDawnStart,
        if (nautDawnEnd != null) #nautDawnEnd: nautDawnEnd,
        if (astroDawnStart != null) #astroDawnStart: astroDawnStart,
        if (astroDawnEnd != null) #astroDawnEnd: astroDawnEnd
      }));
  @override
  Astronomy $make(CopyWithData data) => Astronomy(
      fxTime: data.get(#fxTime, or: $value.fxTime),
      value: data.get(#value, or: $value.value),
      name: data.get(#name, or: $value.name),
      illumination: data.get(#illumination, or: $value.illumination),
      icon: data.get(#icon, or: $value.icon),
      status: data.get(#status, or: $value.status),
      message: data.get(#message, or: $value.message),
      inputDate: data.get(#inputDate, or: $value.inputDate),
      city: data.get(#city, or: $value.city),
      weatherCode: data.get(#weatherCode, or: $value.weatherCode),
      longitude: data.get(#longitude, or: $value.longitude),
      latitude: data.get(#latitude, or: $value.latitude),
      dayLength: data.get(#dayLength, or: $value.dayLength),
      nightLength: data.get(#nightLength, or: $value.nightLength),
      goldenHourAMStart:
          data.get(#goldenHourAMStart, or: $value.goldenHourAMStart),
      goldenHourAMEnd: data.get(#goldenHourAMEnd, or: $value.goldenHourAMEnd),
      goldenHourPMStart:
          data.get(#goldenHourPMStart, or: $value.goldenHourPMStart),
      goldenHourPMEnd: data.get(#goldenHourPMEnd, or: $value.goldenHourPMEnd),
      blueHourAMStart: data.get(#blueHourAMStart, or: $value.blueHourAMStart),
      blueHourAMEnd: data.get(#blueHourAMEnd, or: $value.blueHourAMEnd),
      blueHourPMStart: data.get(#blueHourPMStart, or: $value.blueHourPMStart),
      blueHourPMEnd: data.get(#blueHourPMEnd, or: $value.blueHourPMEnd),
      moonRiseTime: data.get(#moonRiseTime, or: $value.moonRiseTime),
      moonMidTime: data.get(#moonMidTime, or: $value.moonMidTime),
      moonSetTime: data.get(#moonSetTime, or: $value.moonSetTime),
      sunRiseTime: data.get(#sunRiseTime, or: $value.sunRiseTime),
      sunSetTime: data.get(#sunSetTime, or: $value.sunSetTime),
      sunMidTime: data.get(#sunMidTime, or: $value.sunMidTime),
      sunrise: data.get(#sunrise, or: $value.sunrise),
      sunset: data.get(#sunset, or: $value.sunset),
      moonrise: data.get(#moonrise, or: $value.moonrise),
      moonset: data.get(#moonset, or: $value.moonset),
      civiDawnStart: data.get(#civiDawnStart, or: $value.civiDawnStart),
      civiDawnEnd: data.get(#civiDawnEnd, or: $value.civiDawnEnd),
      nautDawnStart: data.get(#nautDawnStart, or: $value.nautDawnStart),
      nautDawnEnd: data.get(#nautDawnEnd, or: $value.nautDawnEnd),
      astroDawnStart: data.get(#astroDawnStart, or: $value.astroDawnStart),
      astroDawnEnd: data.get(#astroDawnEnd, or: $value.astroDawnEnd));

  @override
  AstronomyCopyWith<$R2, Astronomy, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AstronomyCopyWithImpl($value, $cast, t);
}
