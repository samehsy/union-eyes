import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Add your token payload to the request headers
    print(options);
    if (options.path.contains('login')) {
      String token = await getToken();
      options.headers['Authorization'] = 'Bearer $token';
    }
    // Proceed with the request
    super.onRequest(options, handler);
  }

  static getToken() async {
    final storage = FlutterSecureStorage();

    String? token = await storage.read(key: 'auth_token');
    // Retrieving the token

    return token ?? '';
  }
}
