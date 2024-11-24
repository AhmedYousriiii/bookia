import 'package:boookia/core/constants/endpoint.dart';

import 'package:dio/dio.dart';

class DioProvider {
  static late Dio _dio;

  static init() async {
    _dio = await Dio(BaseOptions(
      baseUrl: Endpoint.baseUrl,
    ));
  }

  static Future<Response> get({required String endpoint, Map<String, dynamic>? data, Map<String, dynamic>? header}) {
    return _dio.get(endpoint, data: data, options: Options(headers: header));
  }

  static Future<Response> post({required String endpoint, Map<String, dynamic>? data, Map<String, dynamic>? header}) {
    return _dio.post(endpoint, data: data, options: Options(headers: header));
  }

  static Future<Response> put({required String endpoint, Map<String, dynamic>? data, Map<String, dynamic>? header}) {
    return _dio.put(endpoint, data: data, options: Options(headers: header));
  }

  static Future<Response> delete({required String endpoint, Map<String, dynamic>? data, Map<String, dynamic>? header}) {
    return _dio.delete(endpoint, data: data, options: Options(headers: header));
  }
}
