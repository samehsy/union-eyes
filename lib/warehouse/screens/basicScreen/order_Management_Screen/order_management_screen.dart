import 'package:flutter/material.dart';
import '../../../widget/warehouse_header.dart';
import './excuted-order-screen.dart';
import './new_order_screen.dart';

class OrderManagementScreen extends StatelessWidget {
  static const routeName = '/OrderManagement';
  final categoiesOfOrder = [
    {
      'nameCategory': ' طلبات جددية',
      'imageUrl': 'assets/images/new_order.png',
      'routeName': NewOrderScreen.routeName,
    },
    {
      'nameCategory': ' طلبات منفذة',
      'imageUrl': 'assets/images/order_excuted.png',
      'routeName': ExcutedOrderScreen.routeName,
    },
  ];
  Widget buildOrderCategory({
    String imageUrl = '',
    String nameProduct = '',
    required Color imageColor,
    required BuildContext context,
    String routeName = '',
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 95, 106, 106),
            width: 3,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 3,
            ),
            Image.asset(
              imageUrl,
              scale: 7,
              color: imageColor,
            ),
            Text(
              nameProduct,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 23, 32, 42),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Header(
            title: 'إدارة الطلبات',
          ),
          SizedBox(
            height: 70,
          ),
          Container(
            height: 300,
            child: GridView(
              padding: EdgeInsets.all(25),
              children: [
                buildOrderCategory(
                  imageUrl: categoiesOfOrder[1]['imageUrl'] ?? '',
                  nameProduct: categoiesOfOrder[1]['nameCategory'] ?? '',
                  imageColor: Color.fromARGB(255, 133, 193, 233),
                  context: context,
                  routeName: categoiesOfOrder[1]['routeName'] ?? '',
                ),
                buildOrderCategory(
                  imageUrl: categoiesOfOrder[0]['imageUrl'] ?? '',
                  nameProduct: categoiesOfOrder[0]['nameCategory'] ?? '',
                  imageColor: Color.fromARGB(255, 217, 136, 128),
                  context: context,
                  routeName: categoiesOfOrder[0]['routeName'] ?? '',
                ),
              ],
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
              ),
            ),
          )
        ],
      ),
    );
  }
}
