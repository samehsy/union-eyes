import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:secondapp/services/glasses_service.dart';
import '../api/dio_client.dart';
import '../services/auth_service.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(AuthService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(GlassesService(dioClient: getIt<DioClient>()));
}
