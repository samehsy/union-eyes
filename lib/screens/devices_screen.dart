import 'package:flutter/material.dart';
import '../widget/header.dart';

class DevicesScreen extends StatelessWidget {
  static const routeName = '/DevicesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Header(
            title: 'الأجهزة',
          ),
        ],
      ),
    );
  }
}
