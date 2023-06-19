import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/my_order_screen.dart';
import '../screens/lenses_order_screen.dart';
import '../screens/maintenance_order_screen.dart';
import '../screens/devices_screen.dart';

class MenuPageScreen extends StatelessWidget {
  static const routeName = 'menu';

  List<Map<String, dynamic>> wedgits = [
    {
      "label": 'طلباتي',
      "router": MyOrderScreen.routeName,
      "icon": Icons.assignment
    },
    {
      "label": 'طلب عدسات ',
      "router": LensesOrderScreen.routeName,
      "icon": Icons.face
    },
    {
      "label": 'طلب صيانة ',
      "router": MaintenanceOrderScreen.routeName,
      "icon": Icons.build_circle_outlined
    },
    {
      "label": 'الأجهزة',
      "router": MyOrderScreen.routeName,
      "icon": Icons.point_of_sale
    },
    {
      "label": 'تعليمات مساعدة',
      "router": MyOrderScreen.routeName,
      "icon": Icons.quiz_outlined
    },
    {
      "label": 'تعليمات مساعدة',
      "router": MyOrderScreen.routeName,
      "icon": Icons.quiz_outlined
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1),
        itemCount: wedgits.length,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: InkWell(
                onTap: () {
                  context.go(wedgits[index]['router']);
                },
                canRequestFocus: true,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        wedgits[index]['icon'],
                        size: 60.0,
                        color: Colors.black45,
                      ),
                      Spacer(),
                      Text(wedgits[index]['label']),
                    ],
                  ),
                )),
          );
        });
  }
}
