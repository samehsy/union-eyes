import 'dart:convert';

import 'package:secondapp/models/glasses_frame.dart';

import '../api/dio_client.dart';

class GlassesService {
  final DioClient dioClient;

  GlassesService({required this.dioClient});

  List<GlassesFrame> products = [];

  Future<List<GlassesFrame>> getAll() async {
    try {
      final response = await dioClient.get(
        'product/getFrameProducts',
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data['data'];

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
