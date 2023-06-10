import 'package:flutter/material.dart';

import './screens/home_page_screen.dart';
import './screens/introduction_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/my_order_screen.dart';
import './screens/lenses_order_screen.dart';
import './screens/maintenance_order_screen.dart';
import './screens/devices_screen.dart';
import './screens/order_details_screen.dart';
import './screens/login_screen.dart';
import './screens/register_screen.dart';
// warehouse
import 'warehouse/screens/warehouse_home.dart';
import 'warehouse/screens/basicScreen/product_Management_Screen/product_management_screen.dart';
import 'warehouse/screens/basicScreen/order_Management_Screen/order_management_screen.dart';
import 'warehouse/screens/basicScreen/add_Order_Screen/add_order_screen.dart';

import 'warehouse/screens/basicScreen/product_Management_Screen/add_frame.dart';
import 'warehouse/screens/basicScreen/product_Management_Screen/devices_management_screen.dart';
import 'warehouse/screens/basicScreen/product_Management_Screen/frame_management_screen.dart';
import 'warehouse/screens/basicScreen/product_Management_Screen/lenses_management_screen.dart';
import 'warehouse/screens/basicScreen/order_Management_Screen/new_order_screen.dart';
import 'warehouse/screens/basicScreen/order_Management_Screen/excuted-order-screen.dart';
import 'warehouse/screens/basicScreen/order_Management_Screen/order_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 1',
      routes: {
        '/': (ctx) => IntroductionScren(),
        HomePageScreen.routeName: (ctx) => HomePageScreen(),
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        MyOrderScreen.routeName: (ctx) => MyOrderScreen(),
        LensesOrderScreen.routeName: (ctx) => LensesOrderScreen(),
        MaintenanceOrderScreen.routeName: (ctx) => MaintenanceOrderScreen(),
        DevicesScreen.routeName: (ctx) => DevicesScreen(),
        OrderdetailsScreen.routeName: (ctx) => OrderdetailsScreen(),
        LogIn.routeName: (ctx) => LogIn(),
        Register.routeName: (ctx) => Register(),
        // warehouse
        '/warehouse': (ctx) => HomePage(),
        AddOrder.routeName: (ctx) => AddOrder(),
        ProductManagementScreen.routeName: (ctx) => ProductManagementScreen(),
        OrderManagementScreen.routeName: (ctx) => OrderManagementScreen(),
        DevicesManagementScreen.routeName: (ctx) => DevicesManagementScreen(),
        FrameManagementScreen.routeName: (ctx) => FrameManagementScreen(),
        LensesManagementScreen.routeName: (ctx) => LensesManagementScreen(),
        AddFrame.routeName: (ctx) => AddFrame(),
        NewOrderScreen.routeName: (ctx) => NewOrderScreen(),
        ExcutedOrderScreen.routeName: (ctx) => ExcutedOrderScreen(),
        OrderDetialScreen.routeName: (ctx) => OrderDetialScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
