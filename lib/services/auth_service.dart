import 'package:shared_preferences/shared_preferences.dart';
import '../api/dio_client.dart';

class AuthService {
  final DioClient dioClient;

  AuthService({required this.dioClient});

  Future<String> login(String username, String password) async {
    try {
      final response = await dioClient.post(
        'login',
        data: {
          'username': username,
          'password': password,
        },
      );

      final authToken = response
          .data['token']; // Assuming the API response contains a 'token' field
      print(authToken);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', authToken);

      // Store the auth token in shared preferences, secure storage, or any other storage mechanism
      // You can use a third-party package like shared_preferences or flutter_secure_storage for this purpose

      return authToken;
    } catch (e) {
      // Handle login failure
      throw Exception('Login failed');
    }
  }

  Future<String> signup(String email, String password) async {
    try {
      final response = await dioClient.post(
        'register',
        data: {
          'email': email,
          'password': password,
        },
      );

      final authToken = response
          .data['token']; // Assuming the API response contains a 'token' field
      print(authToken);
      // Store the auth token in shared preferences, secure storage, or any other storage mechanism
      // You can use a third-party package like shared_preferences or flutter_secure_storage for this purpose

      return authToken;
    } catch (e) {
      // Handle signup failure
      throw Exception('Signup failed');
    }
  }
}
