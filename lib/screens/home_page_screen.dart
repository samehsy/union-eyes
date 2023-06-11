import 'package:flutter/material.dart';
import './cart_page_screen.dart';
import './info_page_screen.dart';
import './menu_page_screen.dart';
import './user_profile_screen.dart';
import '../widget/home_page.dart';

class HomePageScreen extends StatefulWidget {
  static const routeName = 'homePageScreen';

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final List<Widget> _pages = [
    HomePage(),
    MenuPageScreen(),
    CartPageScreen(),
    UserProfileScreen(),
    InfoPageScreen(),
  ];
  int _selctedPageIndex = 0;

  void _selcetedPage(int index) {
    _selctedPageIndex = 0;
    setState(() {
      _selctedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          body: _pages[_selctedPageIndex],
          appBar: AppBar(
            centerTitle: true,
            shadowColor: Theme.of(context).colorScheme.shadow,
            scrolledUnderElevation: 10.0,
            title: Text('العالمية'),
            leading: Image.asset(
              'assets/images/logo-black.png',
              width: 120,
            ),
            backgroundColor: Colors.amberAccent,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                tooltip: 'السلة',
                onPressed: () => _selcetedPage,
              ),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: _selctedPageIndex,
            backgroundColor: Colors.amberAccent,
            elevation: 50,
            onDestinationSelected: _selcetedPage,
            indicatorColor: Colors.white60,
            destinations: const <Widget>[
              NavigationDestination(icon: Icon(Icons.home), label: 'الرئيسية'),
              NavigationDestination(icon: Icon(Icons.menu), label: 'القائمة'),
              NavigationDestination(icon: Icon(Icons.person), label: 'حسابي'),
              NavigationDestination(
                  icon: Icon(Icons.notifications), label: 'الإشعارات'),
            ],
          ),
        ));
  }
}
