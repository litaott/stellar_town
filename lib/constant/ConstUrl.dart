/// Url常量
/// @author tt
/// @date 2023-06-20

class ConstUrl {
  ConstUrl._();

  static const String defaultAvatar =
      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F66057a01-1ab3-4d6e-9c3c-da2fe735053c%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1690596693&t=427364d864034d761d03d646d0fdf6af';

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
