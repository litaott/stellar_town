// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'Attraction.dart';

class AttractionMapper extends ClassMapperBase<Attraction> {
  AttractionMapper._();

  static AttractionMapper? _instance;
  static AttractionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttractionMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Attraction';

  static String _$image(Attraction v) => v.image;
  static const Field<Attraction, String> _f$image =
      Field('image', _$image, opt: true, def: ConstUrl.defaultAvatar);
  static String _$name(Attraction v) => v.name;
  static const Field<Attraction, String> _f$name =
      Field('name', _$name, opt: true, def: '---');
  static String _$address(Attraction v) => v.address;
  static const Field<Attraction, String> _f$address =
      Field('address', _$address, opt: true, def: '---');
  static String _$distance(Attraction v) => v.distance;
  static const Field<Attraction, String> _f$distance =
      Field('distance', _$distance, opt: true, def: '---');
  static String _$introduction(Attraction v) => v.introduction;
  static const Field<Attraction, String> _f$introduction =
      Field('introduction', _$introduction, opt: true, def: '---');

  @override
  final Map<Symbol, Field<Attraction, dynamic>> fields = const {
    #image: _f$image,
    #name: _f$name,
    #address: _f$address,
    #distance: _f$distance,
    #introduction: _f$introduction,
  };

  static Attraction _instantiate(DecodingData data) {
    return Attraction(
        image: data.dec(_f$image),
        name: data.dec(_f$name),
        address: data.dec(_f$address),
        distance: data.dec(_f$distance),
        introduction: data.dec(_f$introduction));
  }

  @override
  final Function instantiate = _instantiate;

  static Attraction fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Attraction>(map));
  }

  static Attraction fromJson(String json) {
    return _guard((c) => c.fromJson<Attraction>(json));
  }
}

mixin AttractionMappable {
  String toJson() {
    return AttractionMapper._guard((c) => c.toJson(this as Attraction));
  }

  Map<String, dynamic> toMap() {
    return AttractionMapper._guard((c) => c.toMap(this as Attraction));
  }

  AttractionCopyWith<Attraction, Attraction, Attraction> get copyWith =>
      _AttractionCopyWithImpl(this as Attraction, $identity, $identity);
  @override
  String toString() {
    return AttractionMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttractionMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AttractionMapper._guard((c) => c.hash(this));
  }
}

extension AttractionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Attraction, $Out> {
  AttractionCopyWith<$R, Attraction, $Out> get $asAttraction =>
      $base.as((v, t, t2) => _AttractionCopyWithImpl(v, t, t2));
}

abstract class AttractionCopyWith<$R, $In extends Attraction, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? image,
      String? name,
      String? address,
      String? distance,
      String? introduction});
  AttractionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AttractionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Attraction, $Out>
    implements AttractionCopyWith<$R, Attraction, $Out> {
  _AttractionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Attraction> $mapper =
      AttractionMapper.ensureInitialized();
  @override
  $R call(
          {String? image,
          String? name,
          String? address,
          String? distance,
          String? introduction}) =>
      $apply(FieldCopyWithData({
        if (image != null) #image: image,
        if (name != null) #name: name,
        if (address != null) #address: address,
        if (distance != null) #distance: distance,
        if (introduction != null) #introduction: introduction
      }));
  @override
  Attraction $make(CopyWithData data) => Attraction(
      image: data.get(#image, or: $value.image),
      name: data.get(#name, or: $value.name),
      address: data.get(#address, or: $value.address),
      distance: data.get(#distance, or: $value.distance),
      introduction: data.get(#introduction, or: $value.introduction));

  @override
  AttractionCopyWith<$R2, Attraction, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttractionCopyWithImpl($value, $cast, t);
}
