import 'package:flutter/material.dart';
import '../../../widget/warehouse_header.dart';

class ExcutedOrderScreen extends StatelessWidget {
  static const routeName = '/ExcutedOrderScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Header(
            title: 'طلبات منفذة',
          ),
        ],
      ),
    );
  }
}
