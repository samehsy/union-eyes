import 'package:flutter/material.dart';
import '../../../widget/warehouse_header.dart';

class LensesManagementScreen extends StatelessWidget {
  static const routeName = '/LensesManagementScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Header(
          title: 'إدارة العدسات',
        ),
      ],
    ));
  }
}
