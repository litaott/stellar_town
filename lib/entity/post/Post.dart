import 'package:dart_mappable/dart_mappable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'Post.mapper.dart';

/// 帖子实体类
/// @author ww
/// @date 2023-06-21

@MappableClass()
class Post with PostMappable {
  String title;
  String description;
  String site;
  String tag;
  int likeNumber;

  Post({
    required this.title,
    required this.description,
    required this.site,
    required this.tag,
    required this.likeNumber,
  });
}