import 'package:flutter/material.dart';
import '../../../widget/warehouse_header.dart';
import 'devices_management_screen.dart';
import 'frame_management_screen.dart';
import 'lenses_management_screen.dart';

class ProductManagementScreen extends StatelessWidget {
  static const routeName = '/ProuctManagementScreen';
   List<Map<String, dynamic>> categoriesOfProducts = [
    {
      'nameCategory': 'الإطارات',
      'imageUrl': 'assets/images/frame.png',
      'routeName': FrameManagementScreen.routeName,
    },
    {
      'nameCategory': 'العدسات',
      'imageUrl': 'assets/images/lenses.png',
      'routeName': LensesManagementScreen.routeName,
    },
    {
      'nameCategory': 'الأجهزة',
      'imageUrl': 'assets/images/devices.png',
      'routeName': DevicesManagementScreen.routeName,
    },
  ];
  Widget buildProductCategory({
    required String imageUrl,
   required  String nameProduct,
    required Color imageColor,
   required BuildContext context,
  required  String routeName,
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
          )),
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
            title: 'إدارة المنتجات ',
          ),
          SizedBox(
            height: 70,
          ),
          Container(
            height: 300,
            child: GridView(
              padding: EdgeInsets.all(25),
              children: [
                buildProductCategory(
                  imageUrl: categoriesOfProducts[0]['imageUrl'],
                  nameProduct: categoriesOfProducts[0]['nameCategory'],
                  imageColor: Color.fromARGB(255, 220, 118, 51),
                  context: context,
                  routeName: categoriesOfProducts[0]['routeName'],
                ),
                buildProductCategory(
                  imageUrl: categoriesOfProducts[1]['imageUrl'],
                  nameProduct: categoriesOfProducts[1]['nameCategory'],
                  imageColor: Color.fromARGB(255, 88, 214, 141),
                  context: context,
                  routeName: categoriesOfProducts[1]['routeName'],
                ),
                buildProductCategory(
                  imageUrl: categoriesOfProducts[2]['imageUrl'],
                  nameProduct: categoriesOfProducts[2]['nameCategory'],
                  imageColor: Color.fromARGB(255, 93, 173, 226),
                  context: context,
                  routeName: categoriesOfProducts[2]['routeName'],
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
