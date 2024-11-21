import 'package:boookia/core/constants/endpoint.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio _dio;

  static init() async {
    _dio = await Dio(BaseOptions(
      baseUrl: Endpoint.baseUrl,
    ));
  }

  static Future<Response> get(
      {required String endpoint, Map<String, dynamic>? data}) {
    return _dio.get(endpoint, data: data);
  }

  static Future<Response> post(
      {required String endpoint, Map<String, dynamic>? data}) {
    return _dio.post(endpoint, data: data);
  }

  static Future<Response> put(
      {required String endpoint, Map<String, dynamic>? data}) {
    return _dio.put(endpoint, data: data);
  }

  static Future<Response> delete(
      {required String endpoint, Map<String, dynamic>? data}) {
    return _dio.delete(endpoint, data: data);
  }
}
