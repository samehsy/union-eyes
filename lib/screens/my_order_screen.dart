import 'package:flutter/material.dart';
import '../widget/header.dart';
import 'package:intl/intl.dart';
import '../screens/order_details_screen.dart';

class MyOrderScreen extends StatelessWidget {
  static const routeName = '/MyOrderScreen';

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
      appBar: Header(title: ''),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Card(
                clipBehavior: Clip.hardEdge,
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            buildAttributesOrder(
                              myOrder[index].keys.elementAt(0),
                              //'رقم الطلب',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            buildAttributesOrder(
                              myOrder[index].keys.elementAt(1),
                              //'تاريخ الطلب',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            buildAttributesOrder(
                              myOrder[index].keys.elementAt(2),
                              //'حالة الطلب',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            buildAttributesOrder(
                              myOrder[index].keys.elementAt(3),
                              //'مبلغ الفاتورة',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            buildValueOfAttributes(
                              myOrder[index].values.elementAt(0).toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            buildValueOfAttributes(
                              DateFormat.yMMMd()
                                  .format(myOrder[index].values.elementAt(1)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            myOrder[index]['state'] == 'Underway'
                                ? buildStateOrder(myOrder[index]['state'],
                                    Color.fromARGB(255, 144, 202, 249))
                                : myOrder[index]['state'] == 'failure'
                                    ? buildStateOrder(myOrder[index]['state'],
                                        Color.fromARGB(255, 244, 67, 54))
                                    : buildStateOrder(myOrder[index]['state'],
                                        Color.fromARGB(255, 67, 160, 71)),
                            SizedBox(
                              height: 10,
                            ),
                            buildValueOfAttributes(
                              myOrder[index].values.elementAt(3).toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 320,
                        ),
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
                )),
          );
        },
        itemCount: myOrder.length,
      ),
    );
  }
}
