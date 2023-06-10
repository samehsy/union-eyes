import 'package:flutter/material.dart';
import '../../../widget/warehouse_header.dart';
import './order_detail_screen.dart';

class NewOrderScreen extends StatelessWidget {
  static const routeName = '/NewOrderScreen';
   List<Map<String, dynamic>> orderData = [
    {
      'orderID': '1201',
      'centerName': 'باب مصلى',
      'dataOfOrder': '7/5/2023',
      'bill': 25000,
    },
    {
      'orderID': '3210',
      'centerName': ' الزاهرة',
      'dataOfOrder': '7/8/2023',
      'bill': 525000,
    },
    {
      'orderID': '4012',
      'centerName': 'الجمبل ',
      'dataOfOrder': '8/25/2023',
      'bill': 70000,
    },
    {
      'orderID': '3120',
      'centerName': 'باب مصلى',
      'dataOfOrder': '8/7/2023',
      'bill': 250000,
    },
    {
      'orderID': '4502',
      'centerName': ' جرمانا',
      'dataOfOrder': '5/10/2023',
      'bill': 300000,
    },
    {
      'orderID': '500',
      'centerName': 'باب مصلى',
      'dataOfOrder': '7/5/2023',
      'bill': 25000,
    },
    {
      'orderID': '1201',
      'centerName': 'باب مصلى',
      'dataOfOrder': '7/5/2023',
      'bill': 25000,
    },
    {
      'orderID': '1201',
      'centerName': 'باب مصلى',
      'dataOfOrder': '7/5/2023',
      'bill': 25000,
    },
    {
      'orderID': '1201',
      'centerName': 'باب مصلى',
      'dataOfOrder': '7/5/2023',
      'bill': 25000,
    },
  ];
  Widget buildOrder(
      {required String orderId,
      required String centerName,
      required String date,
      dynamic bill,
      required BuildContext context}) {
    return Container(
      child: Card(
          shape: Border.all(
            color: Color.fromARGB(255, 52, 73, 94),
            width: 2.0,
          ),
          elevation: 15,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 300,
                    child: Table(
                      columnWidths: {
                        0: FlexColumnWidth(0.5),
                        1: FlexColumnWidth(0.3)
                      },
                      children: [
                        TableRow(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 30,
                              child: FittedBox(
                                child: Text(
                                  orderId,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 52, 73, 94),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'رقم الطلب',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 30,
                              child: FittedBox(
                                child: Text(
                                  centerName,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 52, 73, 94),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            Text(
                              ' اسم المركز',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 30,
                              child: FittedBox(
                                child: Text(
                                  date,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 52, 73, 94),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Text(
                              'تاريخ الطلب ',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 30,
                              child: FittedBox(
                                child: Text(
                                  bill.toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 52, 73, 94),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              ' الفاتورة',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(OrderDetialScreen.routeName);
                    },
                    child: Text(
                      'تفاصيل الطلب',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 243, 156, 18),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Header(
            title: 'طلبات جديدة',
          ),
          Container(
            height: 550,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return buildOrder(
                    orderId: orderData[index]['orderID'],
                    centerName: orderData[index]['centerName'],
                    date: orderData[index]['dataOfOrder'],
                    bill: orderData[index]['bill'],
                    context: context);
              },
              itemCount: orderData.length,
            ),
          )
        ],
      ),
    );
  }
}
