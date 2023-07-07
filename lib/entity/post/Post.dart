import 'package:dart_mappable/dart_mappable.dart';
part 'Post.mapper.dart';

/// 帖子实体类
/// @author ww
/// @date 2023-07-03

@MappableClass()
class Post with PostMappable {
  int id;
  int userId;
  int likeCount;
  String title;
  String image;
  String content;
  String address;
  String tag;


  Post({
    this.id=1,
    this.userId=12345,
    this.likeCount=0,
    this.title='这是一个很短的标题',
    this.image='',
    this.content='',
    this.address='湖北省武汉市武昌区珞珈山街道八一路299号',
    this.tag='',
  });

  static const fromMap = PostMapper.fromMap;
  static const fromJson = PostMapper.fromJson;

}
