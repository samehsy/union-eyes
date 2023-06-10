import 'package:flutter/material.dart';
import '../widget/warehouse_header.dart';
import 'basicScreen/order_Management_Screen/order_management_screen.dart';
import 'basicScreen/product_Management_Screen/product_management_screen.dart';
import 'basicScreen/add_Order_Screen/add_order_screen.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';
  final categoryItem = [
    {
      'namecategory': 'إدارة الطلبات',
      'imageUrl': 'assets/images/order_management.png',
      'routeName': OrderManagementScreen.routeName,
    },
    {
      'namecategory': 'إدارة المنتجات ',
      'imageUrl': 'assets/images/product_management.png',
      'routeName': ProductManagementScreen.routeName
    },
    {
      'namecategory': 'إضافة طلب',
      'imageUrl': 'assets/images/add_order.png',
      'routeName': AddOrder.routeName,
    },
  ];
  Widget buildCategory(String nameCategory, String imageUrl, String routeName,
      BuildContext context) {
    return Card(
      elevation: 20,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: Image.asset(
                imageUrl,
                height: 100,
                //color: Color.fromARGB(255, 169, 204, 227),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              nameCategory,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 27, 38, 49),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildListCatItem(
      List<Map<String, String>> categoryItem, BuildContext context) {
    return Column(
      children: [
        buildCategory(
          categoryItem[0]['namecategory'] ?? '',
          categoryItem[0]['imageUrl'] ?? '',
          categoryItem[0]['routeName'] ?? '',
          context,
        ),
        buildCategory(
          categoryItem[1]['namecategory'] ?? '',
          categoryItem[1]['imageUrl'] ?? '',
          categoryItem[1]['routeName'] ?? '',
          context,
        ),
        buildCategory(
          categoryItem[2]['namecategory'] ?? '',
          categoryItem[2]['imageUrl'] ?? '',
          categoryItem[2]['routeName'] ?? '',
          context,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Header(
            title: 'تطبيق المستودع',
          ),
          buildListCatItem(categoryItem, context),
        ],
      ),
    );
  }
}
