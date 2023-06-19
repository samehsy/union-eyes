import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'basicScreen/order_Management_Screen/order_management_screen.dart';
import 'basicScreen/product_Management_Screen/product_management_screen.dart';
import 'basicScreen/add_Order_Screen/add_order_screen.dart';
import 'package:secondapp/widget/header.dart';

class WareHoseHomePage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  WareHoseHomePage({super.key, required this.navigationShell});
  @override
  static const routeName = 'warehouse';

  @override
  State<WareHoseHomePage> createState() => _WareHoseHomePageState();
}

class _WareHoseHomePageState extends State<WareHoseHomePage> {
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

  Widget builsd(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          buildListCatItem(categoryItem, context),
        ],
      ),
    );
  }

  int _selctedPageIndex = 0;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          body: widget.navigationShell,
          appBar: Header(title: ''),
          bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: Colors.amberAccent,
            elevation: 50,
            selectedIndex: widget.navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
            indicatorColor: Colors.white60,
            destinations: const <Widget>[
              NavigationDestination(
                  icon: Icon(Icons.home), label: 'إدارة الطلبات'),
              NavigationDestination(
                  icon: Icon(Icons.menu), label: 'إدارة المنتجات '),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'إضافة طلب',
              ),
            ],
          ),
        ));
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
