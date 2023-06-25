/// Url常量
/// @author tt
/// @date 2023-06-20

class ConstUrl {
  ConstUrl._();

  /// 服务器
  static const String baseUrl = 'http://127.0.0.1:4523/m1/2903291-0-default';

  /// 用户相关
  static const String defaultAvatar =
      'https://up.enterdesk.com/photo/2011-6-4/enterdesk.com-70CD5C7D85E0DD1D1E548CA0CF22FDF1.jpg';
  static const String userBaseUrl = '/user';
  static const String getUserInfoUrl = '$userBaseUrl/getUserInfo';
}
