import 'package:dio/dio.dart';

class DioH {
  static Dio dio = Dio();

  static Future<Response> getData({
    String url = '',
  }) {
    return dio.get(url);
  }

  static Future<Response> postData({
    required String url,
   required  Map<String, dynamic> data,
  }) async {
    return await dio.post(
      url,
      data: data,
    );
  }
}
