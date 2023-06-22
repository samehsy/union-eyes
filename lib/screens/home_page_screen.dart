import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:secondapp/screens/lenses_order_screen.dart';
import 'package:secondapp/screens/login.dart';
import 'package:secondapp/screens/maintenance_order_screen.dart';
import 'package:secondapp/screens/my_order_screen.dart';
import 'package:secondapp/screens/product_detail_screen.dart';
import 'package:secondapp/screens/profile.dart';
import 'package:secondapp/widget/header.dart';
import './menu_page_screen.dart';
import './user_profile_screen.dart';
import '../widget/home_page.dart';

class HomePageScreen extends StatefulWidget {
  static const routeName = 'home';
  final StatefulNavigationShell navigationShell;

  const HomePageScreen({super.key, required this.navigationShell});
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selctedPageIndex = 0;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          body: widget.navigationShell,
          appBar: Header(
            title: '',
          ),
          bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: Colors.amberAccent,
            elevation: 50,
            selectedIndex: widget.navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
            indicatorColor: Colors.white60,
            destinations: const <Widget>[
              NavigationDestination(icon: Icon(Icons.home), label: 'الرئيسية'),
              NavigationDestination(icon: Icon(Icons.menu), label: 'القائمة'),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'حسابي',
              ),
              NavigationDestination(
                  icon: Icon(Icons.notifications), label: 'الإشعارات'),
            ],
          ),
        ));
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    var path = settings.name?.replaceAll('/', '');
    print(path);

    late Widget page;
    switch (path) {
      case HomePage.routeName:
        page = HomePage();
        break;
      case MenuPageScreen.routeName:
        page = MenuPageScreen();
        break;
      case Profile.routeName:
        page = Profile();
        break;
      case ProductDetail.routeName:
        // page = ProductDetail();
        break;
      case MyOrderScreen.routeName:
        page = MyOrderScreen();
        break;
      case LensesOrderScreen.routeName:
        page = LensesOrderScreen();
        break;
      case Maintenance.routeName:
        page = Maintenance();
        break;
      default:
        page = HomePage();
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
