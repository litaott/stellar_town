/// Url常量
/// @author tt
/// @date 2023-06-20

class ConstUrl {
  ConstUrl._();

  static const String defaultAvatar =
      'https://up.enterdesk.com/photo/2011-6-4/enterdesk.com-70CD5C7D85E0DD1D1E548CA0CF22FDF1.jpg';

  /// 服务器
  static const String baseUrl = 'http://49ilim5biema.xiaomiqiu.com';
  //static const String baseUrl = 'http://10.128.131.255:8080';

  /// 用户相关
  static const String userBaseUrl = '/api/v1/user';
  static const String register = '$userBaseUrl/register';
  static const String login = '$userBaseUrl/login';
  static const String getUserInfo = '$userBaseUrl/getUserInfo';
  static const String logout = '$userBaseUrl/logout';
  static const String updateUserInfo = '$userBaseUrl/updateUserInfo';
  static const String getUserInfoById = '$userBaseUrl/getUserInfoById';
  static const String followUser = '$userBaseUrl/followUser';
  static const String unFollowUser = '$userBaseUrl/unFollowUser';
  static const String getUserFollow = '$userBaseUrl/getUserFollow';
  static const String getOthersFollow = '$userBaseUrl/getOthersFollow';
  static const String getFans = '$userBaseUrl/getFans';
  static const String getOthersFans = '$userBaseUrl/getFans';

  /// 帖子相关

  /// 图片相关
  static const String imageBaseUrl = '/api/v1/minio/upload';
  static const String uploadAvatar = '$imageBaseUrl/avatar';
  static const String uploadPost = '$imageBaseUrl/post';
}
