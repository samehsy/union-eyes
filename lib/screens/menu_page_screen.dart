import 'package:flutter/material.dart';
import '../widget/header.dart';
import '../screens/my_order_screen.dart';
import '../screens/lenses_order_screen.dart';
import '../screens/maintenance_order_screen.dart';
import '../screens/devices_screen.dart';

class MenuPageScreen extends StatelessWidget {
  Widget buildMenuItem(
      {String nameItem = '',
      String pathImage = '',
      String routeName = '',
      required BuildContext context}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      canRequestFocus: true,
      autofocus: true,
      splashColor: Color.fromARGB(255, 236, 239, 241),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              nameItem,
              style: TextStyle(
                  fontFamily: 'Cario',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 33,
              child: Image.asset(
                pathImage,
                fit: BoxFit.cover,
                color: Color.fromARGB(255, 245, 127, 23),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Header(title: 'القائمة'),
        SizedBox(
          height: 50,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 15,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              buildMenuItem(
                  nameItem: 'طلباتي',
                  pathImage: 'assets/icons/notification.png',
                  context: context,
                  routeName: MyOrderScreen.routeName),
              Divider(
                color: Color.fromARGB(255, 144, 164, 174),
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              buildMenuItem(
                  nameItem: 'طلب عدسات ',
                  pathImage: 'assets/icons/lens.png',
                  context: context,
                  routeName: LensesOrderScreen.routeName),
              Divider(
                color: Color.fromARGB(255, 144, 164, 174),
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              buildMenuItem(
                  nameItem: 'طلب صيانة ',
                  pathImage: 'assets/icons/maintenance.png',
                  context: context,
                  routeName: MaintenanceOrderScreen.routeName),
              Divider(
                color: Color.fromARGB(255, 144, 164, 174),
                height: 15,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              buildMenuItem(
                nameItem: 'الأجهزة',
                pathImage: 'assets/icons/devices.png',
                context: context,
                routeName: DevicesScreen.routeName,
              ),
              Divider(
                color: Color.fromARGB(255, 144, 164, 174),
                height: 15,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              buildMenuItem(
                  nameItem: 'تعليمات مساعدة',
                  pathImage: 'assets/icons/support.png',
                  context: context,
                  routeName: MyOrderScreen.routeName),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )
      ],
    );
  }
}
