import 'package:flutter/material.dart';
import 'package:secondapp/widget/header.dart';
import './menu_page_screen.dart';
import './user_profile_screen.dart';
import '../widget/home_page.dart';

class HomePageScreen extends StatefulWidget {
  static const routeName = 'homePageScreen';

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selctedPageIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final List<Widget> _screenRoutes = [
    HomePage(),
    MenuPageScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          body: _screenRoutes[_selctedPageIndex],
          
          appBar: Header(
            title: '',
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

  void _selcetedPage(int index) {
    setState(() {
      _selctedPageIndex = index;
    });
    // _navigateToScreen(_screenRoutes[index]);
  }
}
