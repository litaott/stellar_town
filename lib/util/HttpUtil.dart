import 'package:dio/dio.dart';
import 'package:stellar_town/constant/ConstUrl.dart';

/// Http请求工具类
/// @author tt
/// @date 2023-06-20

class HttpUtil {
  // Initialize the default options
  static final BaseOptions defaultOptions = BaseOptions(
    baseUrl: ConstUrl.baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );

  static String token = '';

  // Create a new instance of Dio with custom options
  static Dio noTokenInstance() {
    final dio = Dio(defaultOptions);
    dio.options.contentType = Headers.jsonContentType;
    return dio;
  }

  static Dio jsonInstance() {
    final dio = Dio(defaultOptions);
    dio.options.contentType = Headers.jsonContentType;
    dio.options.headers['Authorization'] = token;
    return dio;
  }

  static Dio formDataInstance() {
    final dio = Dio(defaultOptions);
    dio.options.contentType = 'multipart/form-data';
    dio.options.headers['Authorization'] = token;
    return dio;
  }

  /// 无token请求
  static Future<Response> post(String path, Map data) async {
    final dio = noTokenInstance();
    return dio.post(path, data: data);
  }

  /// Json类型请求
  static Future<Response> getJson(String path) async {
    final dio = jsonInstance();
    return dio.get(path);
  }

  static Future<Response> postJson(String path, Map data) async {
    final dio = jsonInstance();
    return dio.post(path, data: data);
  }

  static Future<Response> putJson(String path, dynamic data) async {
    final dio = jsonInstance();
    return dio.put(path, data: data);
  }

  static Future<Response> deleteJson(String path) async {
    final dio = jsonInstance();
    return dio.delete(path);
  }

  /// FormData类型请求
  static Future<Response> getForm(String path) async {
    final dio = formDataInstance();
    return dio.get(path);
  }

  static Future<Response> postForm(String path, Map data) async {
    final dio = formDataInstance();
    return dio.post(path, data: data);
  }

  static Future<Response> putForm(String path, dynamic data) async {
    final dio = formDataInstance();
    return dio.put(path, data: data);
  }

  static Future<Response> deleteForm(String path) async {
    final dio = formDataInstance();
    return dio.delete(path);
  }
}
