import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/cart_page_screen.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  Header({required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shadowColor: Theme.of(context).colorScheme.shadow,
      scrolledUnderElevation: 10.0,
      title: Text('العالمية'),
      
      leading:SvgPicture.asset('assets/images/logo.svg' ,width: 100, ),
      backgroundColor: Colors.amberAccent,
      actions: <Widget>[CartPageScreen()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
}
