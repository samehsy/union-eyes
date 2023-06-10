import 'package:flutter/material.dart';
import '../../../widget/warehouse_header.dart';

class AddOrder extends StatelessWidget {
  static const routeName = '/AddOrder';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Header(
            title: 'إضافة طلب ',
          ),
        ],
      ),
    );
  }
}
