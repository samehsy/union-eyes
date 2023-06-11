import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieving the token
    String? authToken = prefs.getString('auth_token');

    return authToken ?? '';
  }
}
