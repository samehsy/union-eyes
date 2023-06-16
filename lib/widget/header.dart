import 'package:flutter/material.dart';

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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
}
