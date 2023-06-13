import 'package:flutter/material.dart';
import './cart_page_screen.dart';
import './menu_page_screen.dart';
import './user_profile_screen.dart';
import '../widget/home_page.dart';
import 'introduction_screen.dart';

class HomePageScreen extends StatefulWidget {
  static const routeName = 'homePageScreen';

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selctedPageIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final List<String> _screenRoutes = [
    '/homePageScreen',
    '/screen2',
    '/screen3',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          body: Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                settings: settings,
                builder: (context) {
                  return _buildCurrentScreen();
                },
              );
            },
          ),
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
                onPressed: () => Navigator.of(context)
                    .pushNamed('homePageScreen/' + CartPageScreen.routeName),
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

  Widget _buildCurrentScreen() {
    switch (_selctedPageIndex) {
      case 0:
        return HomePage();
      case 1:
        return MenuPageScreen();
      case 2:
        return UserProfileScreen();

      default:
        return Container();
    }
  }

  void _selcetedPage(int index) {
    setState(() {
      _selctedPageIndex = index;
    });
    // _navigateToScreen(_screenRoutes[index]);
  }

  void _navigateToScreen(String route) {
    if (_navigatorKey.currentState!.canPop()) {
      _navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
    _navigatorKey.currentState!.pushNamed(route);
  }
}
