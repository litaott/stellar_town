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
    this.title='这是一个很长很长很长很长很长很长很长很长很长很长很长很长的标题',
    this.image='assets/image/login.png',
    this.content='这里有很多很多很多很多很多很很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多多很多很多很很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多多很多很多很多很多很多很多很多很多很多很多很多很多很多很多很多回电话1好内容',
    this.address='湖北省武汉市武昌区珞珈山街道八一路299号',
    this.tag='星野摄影',
  });

  static const fromMap = PostMapper.fromMap;
  static const fromJson = PostMapper.fromJson;

}
