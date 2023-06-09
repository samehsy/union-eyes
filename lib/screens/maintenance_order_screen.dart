import 'package:flutter/material.dart';
import '../widget/header.dart';

class MaintenanceOrderScreen extends StatelessWidget {
  static const routeName = '/MaintenanceOrderScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Header(
            title: 'طلب صيانة',
          )
        ],
      ),
    );
  }
}
