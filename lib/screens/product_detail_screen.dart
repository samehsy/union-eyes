import 'package:flutter/material.dart';
import '../widget/header.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/ProductDetailScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Header(
            title: 'تفاصيل المنتج',
          )
        ],
      ),
    );
  }
}
