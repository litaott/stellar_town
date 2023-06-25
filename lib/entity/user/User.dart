import 'package:dart_mappable/dart_mappable.dart';
import 'package:stellar_town/constant/ConstUrl.dart';

part 'User.mapper.dart';

/// 用户实体类
/// @author tt
/// @date 2023-06-20

@MappableClass()
class User with UserMappable {
  String username; //用户名
  String password; //密码
  String phoneNumber; //手机号
  String avatar; //头像
  String address; //地址
  String gender; //性别
  String age; //年龄
  String signature; //个性签名
  int followNumber; //关注数
  int fansNumber; //粉丝数

  User({
    required this.password,
    required this.username,
    required this.phoneNumber,
    this.avatar = ConstUrl.defaultAvatar,
    this.address = '未填写',
    this.gender = '未填写',
    this.age = '未填写',
    this.signature = '未填写',
    this.followNumber = 0,
    this.fansNumber = 0,
  });

  /// 将map/json转换为User对象
  static const fromMap = UserMapper.fromMap;
  static const fromJson = UserMapper.fromJson;

  // /// 获取当前用户信息*async
  // /// @param null
  // /// @return User
  // static Future<User?> getCurrentUser() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userInfo = prefs.getString('userInfo');
  //   if (userInfo != null) {
  //     return User.fromJson(userInfo);
  //   } else {
  //     return null;
  //   }
  // }
}
