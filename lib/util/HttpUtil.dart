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

  // Create a new instance of Dio with custom options
  static Dio createInstance() {
    final dio = Dio(defaultOptions);
    dio.options.contentType = Headers.jsonContentType;
    return dio;
  }

  // Perform an HTTP GET request
  static Future<Response> get(String path) async {
    final dio = createInstance();
    return dio.get(path);
  }

  // Perform an HTTP POST request
  static Future<Response> post(String path, dynamic data) async {
    final dio = createInstance();
    return dio.post(path, data: data);
  }

  // Perform an HTTP PUT request
  static Future<Response> put(String path, dynamic data) async {
    final dio = createInstance();
    return dio.put(path, data: data);
  }

  // Perform an HTTP DELETE request
  static Future<Response> delete(String path) async {
    final dio = createInstance();
    return dio.delete(path);
  }
}
