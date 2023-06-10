import 'package:flutter/material.dart';
import '../../../widget/warehouse_header.dart';

class DevicesManagementScreen extends StatelessWidget {
  static const routeName = '/DevicesManagementScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Header(
            title: 'إدارة الأجهزة',
          ),
        ],
      ),
    );
  }
}
