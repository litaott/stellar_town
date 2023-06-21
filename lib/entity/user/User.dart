import 'package:dart_mappable/dart_mappable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'User.mapper.dart';

/// 用户实体类
/// @author tt
/// @date 2023-06-20

@MappableClass()
class User with UserMappable {
  String account; //账号
  String password; //密码
  String username; //昵称
  String phoneNumber; //手机号
  String address; //地址
  String gender; //性别
  String age; //年龄
  String signature; //个性签名
  int followNumber; //关注数
  int fansNumber; //粉丝数

  User({
    required this.account,
    required this.password,
    required this.username,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.age,
    required this.signature,
    required this.followNumber,
    required this.fansNumber,
  });

  /// 将map/json转换为User对象
  static const fromMap = UserMapper.fromMap;
  static const fromJson = UserMapper.fromJson;

  /// 获取当前用户信息*async
  /// @param null
  /// @return User
  static Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userInfo = prefs.getString('userInfo');
    if (userInfo != null) {
      return User.fromJson(userInfo);
    } else {
      return null;
    }
  }
}
