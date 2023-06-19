import 'package:flutter/material.dart';
import '../widget/header.dart';
import 'package:intl/intl.dart';
import '../screens/order_details_screen.dart';

class MyOrderScreen extends StatelessWidget {
  static const routeName = '/menu/my-orders';

  List<Map<String, dynamic>> myOrder = [
    {'id': 1, 'date': DateTime.now(), 'state': 'Underway', 'bill': 5000},
    {
      'id': 2,
      'date': DateTime.now().subtract(Duration(days: 10)),
      'state': 'Done',
      'bill': 1250,
    },
    {
      'id': 3,
      'date': DateTime.now().subtract(Duration(days: 3)),
      'state': 'failure',
      'bill': 3000,
    },
    {
      'id': 4,
      'date': DateTime.now().subtract(Duration(days: 2)),
      'state': 'failure',
      'bill': 6000,
    },
    {
      'id': 5,
      'date': DateTime.now().subtract(Duration(days: 20)),
      'state': 'Done',
      'bill': 25000
    },
    {
      'id': 6,
      'date': DateTime.now().subtract(Duration(days: 1)),
      'state': 'Done',
      'bill': 3000,
    },
  ];

  Widget buildStateOrder(String state, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: FittedBox(
        child: Text(
          state,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildAttributesOrder(String attribute) {
    return Text(
      attribute,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget buildValueOfAttributes(String value) {
    return Text(
      value,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              //
              child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildAttributesOrder(
                                myOrder[index].keys.elementAt(0),
                                //'رقم الطلب',
                              ),
                              buildAttributesOrder(
                                myOrder[index].keys.elementAt(1),
                                //'تاريخ الطلب',
                              ),
                              buildAttributesOrder(
                                myOrder[index].keys.elementAt(2),
                                //'حالة الطلب',
                              ),
                              buildAttributesOrder(
                                myOrder[index].keys.elementAt(3),
                                //'مبلغ الفاتورة',
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildValueOfAttributes(
                                myOrder[index].values.elementAt(0).toString(),
                              ),
                              buildValueOfAttributes(
                                DateFormat.yMMMd()
                                    .format(myOrder[index].values.elementAt(1)),
                              ),
                              myOrder[index]['state'] == 'Underway'
                                  ? buildStateOrder(myOrder[index]['state'],
                                      Color.fromARGB(255, 144, 202, 249))
                                  : myOrder[index]['state'] == 'failure'
                                      ? buildStateOrder(myOrder[index]['state'],
                                          Color.fromARGB(255, 244, 67, 54))
                                      : buildStateOrder(myOrder[index]['state'],
                                          Color.fromARGB(255, 67, 160, 71)),
                              buildValueOfAttributes(
                                myOrder[index].values.elementAt(3).toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            child: Text(
                              'التفاصيل',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 243, 156, 18),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(OrderdetailsScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ],
                  )));
        },
        itemCount: myOrder.length,
      ),
    ));
  }
}
