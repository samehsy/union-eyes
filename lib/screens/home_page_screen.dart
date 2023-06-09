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
  BottomNavigationBarItem buildBottomNavigationBar(
    String pathImage,
    String title,
  ) {
    return BottomNavigationBarItem(
      icon: Container(
        height: 33,
        child: Image.asset(
          pathImage,
          fit: BoxFit.cover,
        ),
      ),
     
      label:title  
    );
  }

  void _selcetedPage(int index) {
    _selctedPageIndex = 0;
    print(index);
    print(_selctedPageIndex);
    setState(() {
      _selctedPageIndex = index;
      print(index);
      print(_selctedPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: _pages[_selctedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selcetedPage,
        selectedItemColor: Color.fromARGB(255, 243, 156, 18),
        elevation: 70,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selctedPageIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        items: [
          buildBottomNavigationBar(
            'assets/icons/home.png',
            'الرئيسية',
          ),
          buildBottomNavigationBar(
            'assets/icons/menu.png',
            'القائمة',
          ),
          buildBottomNavigationBar(
            'assets/icons/bag.png',
            'السلة',
          ),
          buildBottomNavigationBar(
            'assets/icons/user.png',
            'حسابي',
          ),
          buildBottomNavigationBar(
            'assets/icons/info.png',
            'حول',
          ),
        ],
      ),
    );
  }
}
