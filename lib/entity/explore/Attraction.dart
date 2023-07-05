import 'package:dart_mappable/dart_mappable.dart';
import 'package:stellar_town/constant/ConstUrl.dart';

part 'Attraction.mapper.dart';

/// 景点实体类
/// @author tt
/// @date 2023-07-05

@MappableClass()
class Attraction with AttractionMappable {
  String image; // 图片
  String name; // 名称
  String address; // 地址
  String introduction; // 介绍

  Attraction({
    this.image = ConstUrl.defaultAvatar,
    this.name = '---',
    this.address = '---',
    this.introduction = '---',
  });

  static const fromMap = AttractionMapper.fromMap;
  static const fromJson = AttractionMapper.fromJson;
}
