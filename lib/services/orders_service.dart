import 'package:secondapp/models/glasses_frame.dart';

import '../api/dio_client.dart';

class OrdersService {
  final DioClient dioClient;

  OrdersService({required this.dioClient});

  List<GlassesFrame> products = [];

  Future<List<GlassesFrame>> getAll(String typeFilter) async {
    String endPoint = '';
    if (typeFilter == 'child') {
      endPoint = 'getKidsProduct';
    } else if (typeFilter == 'woman') {
      endPoint = 'getWomenProduct';
    } else if (typeFilter == 'men') {
      endPoint = 'getMenProduct';
    } else {
      endPoint = 'getFrameProducts';
    }
    try {
      final response = await dioClient.get(
        'product/$endPoint',
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = [];
        if (endPoint == 'getFrameProducts') {
          jsonData = response.data['data'];
        } else {
          jsonData = response.data['products'];
        }

        return jsonData.map((json) => GlassesFrame.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      // Handle login failure
      throw Exception(e);
    }
  }
}
