import 'dart:io';

import 'package:dio/dio.dart';
import 'auth_interceptor.dart';

class DioClient {
  final Dio dio;

  final _baseUrl = 'https://reqres.in/api/';
  // static final _baseUrl = 'http://10.0.2.2:8000/api';

  DioClient(this.dio) {
    dio
      ..options.baseUrl = _baseUrl
      ..options.contentType = ContentType.json.value
      ..options.responseType = ResponseType.json;
      setupInterceptors();
  }

  void setupInterceptors() {
    dio.interceptors.add(AuthInterceptor());
  }

  Future<Response> getData({
    String url = '',
  }) {
    return dio.get(_baseUrl + url);
  }

  Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      _baseUrl + url,
      data: data,
    );
  }
  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
