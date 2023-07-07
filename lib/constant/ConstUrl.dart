/// Url常量
/// @author tt
/// @date 2023-06-20

class ConstUrl {
  ConstUrl._();

  static const String defaultAvatar =
      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F66057a01-1ab3-4d6e-9c3c-da2fe735053c%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1690596693&t=427364d864034d761d03d646d0fdf6af';

  /// 服务器
  // static const String baseUrl = 'http://49ilim5biema.xiaomiqiu.com';
  static const String baseUrl = 'http://101.37.252.1:8080';
  //static const String baseUrl = 'http://10.128.147.181:8080';

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
  static const String isFollowed = '$userBaseUrl/isFollowed';

  /// 帖子相关
  static const String postBaseUrl = '/api/v1/forum';
  static const String post = '$postBaseUrl/post';
  static const String like = '$postBaseUrl/like';
  static const String getPost = '$postBaseUrl/getPost';
  static const String localRecommendation = '$postBaseUrl/localRecommendation';
  static const String recommendation = '$postBaseUrl/recommendation';
  static const String unLike = '$postBaseUrl/unLike';

  ///点赞相关
  static const String likeBaseUrl = '/api/v1/like';
  static const String isLiked = '$likeBaseUrl/isLiked';

  /// 图片相关
  static const String imageBaseUrl = '/api/v1/minio/upload';
  static const String uploadAvatar = '$imageBaseUrl/avatar';
  static const String uploadPost = '$imageBaseUrl/post';

  /// 天气相关
  static const String weatherBaseUrl = '/api/v2/weather';
  static const String getWeatherByCityName = '$weatherBaseUrl/now/cityName';
  static const String getWeatherByLocation = '$weatherBaseUrl/now/location';
  static const String getMoreWeatherByCityName = '$weatherBaseUrl/7d/cityName';
  static const String getMoreWeatherByLocation = '$weatherBaseUrl/7d/location';
  static const String getLocationByCityName =
      '$weatherBaseUrl/location/cityName';
  static const String getCityNameByLocation =
      '$weatherBaseUrl/cityName/location';

  /// 天文相关
  static const String astronomyBaseUrl = '/api/v2/astronomy';
  static const String getSpecialTimeByCityName =
      '$astronomyBaseUrl/specialTime/cityName';
  static const String getSpecialTimeByLocation =
      '$astronomyBaseUrl/specialTime/location';
  static const String getMoonPhaseByCityName =
      '$astronomyBaseUrl/moon/cityName';
  static const String getMoonPhaseByLocation =
      '$astronomyBaseUrl/moon/location';
  static const String getTwilightByCityName =
      '$astronomyBaseUrl/twilight/cityName';
  static const String getTwilightByLocation =
      '$astronomyBaseUrl/twilight/location';

  /// 风景相关
  static const String attractionBaseUrl = '/api/v1/attraction';
  static const String getAttractionByCityName =
      '$attractionBaseUrl/getAttraction';

  /// AI相关
  static const String skyTransferBaseUrl = 'http://i-2.gpushare.com:28927/api';
  static const String getSkyTransfer = '$skyTransferBaseUrl/sky-transfer';
}
