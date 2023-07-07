// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'Post.dart';

class PostMapper extends ClassMapperBase<Post> {
  PostMapper._();

  static PostMapper? _instance;
  static PostMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Post';

  static int _$id(Post v) => v.id;
  static const Field<Post, int> _f$id = Field('id', _$id, opt: true, def: 1);
  static int _$userId(Post v) => v.userId;
  static const Field<Post, int> _f$userId =
      Field('userId', _$userId, opt: true, def: 12345);
  static int _$likeCount(Post v) => v.likeCount;
  static const Field<Post, int> _f$likeCount =
      Field('likeCount', _$likeCount, opt: true, def: 0);
  static String _$title(Post v) => v.title;
  static const Field<Post, String> _f$title =
      Field('title', _$title, opt: true, def: '这是一个很短的标题');
  static String _$image(Post v) => v.image;
  static const Field<Post, String> _f$image =
      Field('image', _$image, opt: true, def: '');
  static String _$content(Post v) => v.content;
  static const Field<Post, String> _f$content =
      Field('content', _$content, opt: true, def: '');
  static String _$address(Post v) => v.address;
  static const Field<Post, String> _f$address =
      Field('address', _$address, opt: true, def: '湖北省武汉市武昌区珞珈山街道八一路299号');
  static String _$tag(Post v) => v.tag;
  static const Field<Post, String> _f$tag =
      Field('tag', _$tag, opt: true, def: '');

  @override
  final Map<Symbol, Field<Post, dynamic>> fields = const {
    #id: _f$id,
    #userId: _f$userId,
    #likeCount: _f$likeCount,
    #title: _f$title,
    #image: _f$image,
    #content: _f$content,
    #address: _f$address,
    #tag: _f$tag,
  };

  static Post _instantiate(DecodingData data) {
    return Post(
        id: data.dec(_f$id),
        userId: data.dec(_f$userId),
        likeCount: data.dec(_f$likeCount),
        title: data.dec(_f$title),
        image: data.dec(_f$image),
        content: data.dec(_f$content),
        address: data.dec(_f$address),
        tag: data.dec(_f$tag));
  }

  @override
  final Function instantiate = _instantiate;

  static Post fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Post>(map));
  }

  static Post fromJson(String json) {
    return _guard((c) => c.fromJson<Post>(json));
  }
}

mixin PostMappable {
  String toJson() {
    return PostMapper._guard((c) => c.toJson(this as Post));
  }

  Map<String, dynamic> toMap() {
    return PostMapper._guard((c) => c.toMap(this as Post));
  }

  PostCopyWith<Post, Post, Post> get copyWith =>
      _PostCopyWithImpl(this as Post, $identity, $identity);
  @override
  String toString() {
    return PostMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PostMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PostMapper._guard((c) => c.hash(this));
  }
}

extension PostValueCopy<$R, $Out> on ObjectCopyWith<$R, Post, $Out> {
  PostCopyWith<$R, Post, $Out> get $asPost =>
      $base.as((v, t, t2) => _PostCopyWithImpl(v, t, t2));
}

abstract class PostCopyWith<$R, $In extends Post, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      int? userId,
      int? likeCount,
      String? title,
      String? image,
      String? content,
      String? address,
      String? tag});
  PostCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Post, $Out>
    implements PostCopyWith<$R, Post, $Out> {
  _PostCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Post> $mapper = PostMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          int? userId,
          int? likeCount,
          String? title,
          String? image,
          String? content,
          String? address,
          String? tag}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (userId != null) #userId: userId,
        if (likeCount != null) #likeCount: likeCount,
        if (title != null) #title: title,
        if (image != null) #image: image,
        if (content != null) #content: content,
        if (address != null) #address: address,
        if (tag != null) #tag: tag
      }));
  @override
  Post $make(CopyWithData data) => Post(
      id: data.get(#id, or: $value.id),
      userId: data.get(#userId, or: $value.userId),
      likeCount: data.get(#likeCount, or: $value.likeCount),
      title: data.get(#title, or: $value.title),
      image: data.get(#image, or: $value.image),
      content: data.get(#content, or: $value.content),
      address: data.get(#address, or: $value.address),
      tag: data.get(#tag, or: $value.tag));

  @override
  PostCopyWith<$R2, Post, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PostCopyWithImpl($value, $cast, t);
}
