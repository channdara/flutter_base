import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../flutter_base_config.dart';
import 'dio_logger.dart';
import 'dio_method.dart';

class ApiRequest {
  factory ApiRequest() => _instance;

  ApiRequest._();

  static final ApiRequest _instance = ApiRequest._();

  Dio? _dio;

  Future<Response<dynamic>> post(
    String endpoint, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async =>
      _request(
        endpoint,
        DioMethod.POST,
        data: data,
        queryParameters: queryParameters,
      );

  Future<Response<dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async =>
      _request(
        endpoint,
        DioMethod.GET,
        queryParameters: queryParameters,
      );

  Future<Response<dynamic>> patch(
    String endpoint, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async =>
      _request(
        endpoint,
        DioMethod.PATCH,
        data: data,
        queryParameters: queryParameters,
      );

  Future<Response<dynamic>> put(
    String endpoint, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async =>
      _request(
        endpoint,
        DioMethod.PUT,
        data: data,
        queryParameters: queryParameters,
      );

  Future<Response<dynamic>> delete(
    String endpoint, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async =>
      _request(
        endpoint,
        DioMethod.DELETE,
        data: data,
        queryParameters: queryParameters,
      );

  Future<Response<dynamic>> _request(
    String endpoint,
    DioMethod method, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    _initializeDio();
    switch (method) {
      case DioMethod.POST:
        return _dio!.post(
          endpoint,
          data: data,
          queryParameters: queryParameters,
        );
      case DioMethod.GET:
        return _dio!.get(
          endpoint,
          queryParameters: queryParameters,
        );
      case DioMethod.PATCH:
        return _dio!.patch(
          endpoint,
          data: data,
          queryParameters: queryParameters,
        );
      case DioMethod.PUT:
        return _dio!.put(
          endpoint,
          data: data,
          queryParameters: queryParameters,
        );
      case DioMethod.DELETE:
        return _dio!.delete(
          endpoint,
          data: data,
          queryParameters: queryParameters,
        );
    }
  }

  void _initializeDio() {
    if (_dio == null) {
      _dio = Dio(BaseOptions(baseUrl: FlutterBaseConfig.instance.apiBaseUrl));
      if (kDebugMode) _dio?.interceptors.add(dioLoggerInterceptor);
    }
    final token = FlutterBaseConfig.instance.accessToken;
    _dio?.options.headers = _generateHeaders(token);
  }

  Map<String, dynamic> _generateHeaders(String token) => {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        if (token.isNotEmpty) HttpHeaders.authorizationHeader: 'Bearer $token'
      };
}
