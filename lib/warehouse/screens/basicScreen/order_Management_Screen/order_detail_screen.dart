import 'package:flutter/material.dart';
import '../../../widget/warehouse_header.dart';

class OrderDetialScreen extends StatelessWidget {
  static const routeName = '/OrderDetailScreen';
  List<Map<String, dynamic>> listOrder = [
    {
      'typeOrder': 'frame',
      'noOrder': 1250,
      'noModel': 'g1950',
      'noColor': '702',
      'amount': 2,
      'class': 'men',
      'imageUrl': 'assets/product/men/1/1.jpg',
    },
    {
      'typeOrder': 'lenses',
      'noOrder': 1250,
      'sph': 2.25,
      'cyl': -1.25,
      'amount': 2,
      'imageUrl': 'assets/images/logo3.jpeg',
    },
    {
      'typeOrder': 'lenses',
      'noOrder': 1250,
      'sph': 0.0,
      'cyl': -1.25,
      'amount': 2,
      'imageUrl': 'assets/images/logo3.jpeg',
    },
    {
      'typeOrder': 'lenses',
      'noOrder': 1250,
      'sph': 2.00,
      'cyl': 0.0,
      'amount': 2,
      'imageUrl': 'assets/images/logo3.jpeg',
    },
    {
      'typeOrder': 'device',
      'noOrder': 1250,
      'noModel': 'hg-1243_sk',
      'deviceName': 'lensomater',
      'amount': 1,
      'imageUrl': 'assets/images/device.jpg',
    }
  ];

  Widget buildFrameOrder({
    required int noOrder,
    required String noModel,
    required String noColor,
    required String cat,
    required int amount,
    required String imageUrl,
  }) {
    return Container(
      width: 160,
      height: 200,
      child: Card(
          elevation: 15,
          child: Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 200,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Text(
                          'طلب إطار',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          'نوع الطلب',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          noOrder.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          ' رقم الطلب',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          noModel,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          ' رقم الموديل',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          noColor,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          ' رقم اللون',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          cat,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          ' صنف الإطار',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          amount.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          '  الكمية',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 160,
                height: 145,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 44, 62, 80),
                    width: 2.0,
                  ),
                ),
                child: Image.asset(
                  imageUrl,
                  // scale: 8,
                ),
              )
            ],
          )),
    );
  }

  buildLensesOrder({
    String typeOrder = '',
    required int noOrder,
    required double sph,
    required double cyl,
    required int amount,
    required String imageUrl,
  }) {
    return Container(
      width: 160,
      height: 200,
      child: Card(
          elevation: 15,
          child: Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 200,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Text(
                          'طلب عدسة',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          'نوع الطلب',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          noOrder.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          ' رقم الطلب',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          sph == 0.0 ? 'غير مطلوب' : sph.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          ' SPH',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          cyl == 0.0 ? 'غير مطلوب' : cyl.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          ' CYL ',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          amount.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          '  الكمية',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 160,
                height: 145,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 44, 62, 80),
                    width: 2.0,
                  ),
                ),
                child: Image.asset(
                  imageUrl,
                  // scale: 8,
                ),
              )
            ],
          )),
    );
  }

  buildDeviceOrder({
    String typeOrder = '',
    required int noOrder,
    required String noModel,
    required String deviceName,
    required int amount,
    required String imageUrl,
  }) {
    return Container(
      width: 160,
      height: 200,
      child: Card(
          elevation: 15,
          child: Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 200,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Text(
                          'طلب جهاز',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          'نوع الطلب',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          noOrder.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          ' رقم الطلب',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          noModel,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          ' noModel',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          deviceName,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          ' اسم الجهاز ',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          amount.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 211, 84, 0),
                          ),
                        ),
                        Text(
                          '  الكمية',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 55, 71),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 160,
                height: 145,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 44, 62, 80),
                    width: 2.0,
                  ),
                ),
                child: Image.asset(
                  imageUrl,
                  // scale: 8,
                ),
              )
            ],
          )),
    );
    ;
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
            title: 'تفاصيل الطلب',
          ),
          Container(
            height: 500,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                if (listOrder[index]['typeOrder'] == 'frame') {
                  return buildFrameOrder(
                    noOrder: listOrder[index]['noOrder'],
                    noModel: listOrder[index]['noModel'],
                    noColor: listOrder[index]['noColor'],
                    cat: listOrder[index]['class'],
                    amount: listOrder[index]['amount'],
                    imageUrl: listOrder[index]['imageUrl'],
                  );
                }
                if (listOrder[index]['typeOrder'] == 'lenses') {
                  return buildLensesOrder(
                    noOrder: listOrder[index]['noOrder'] ?? '',
                    sph: listOrder[index]['sph'],
                    cyl: listOrder[index]['cyl'],
                    amount: listOrder[index]['amount'],
                    imageUrl: listOrder[index]['imageUrl'],
                  );
                } else {
                  return buildDeviceOrder(
                    noOrder: listOrder[index]['noOrder'],
                    noModel: listOrder[index]['noModel'],
                    deviceName: listOrder[index]['deviceName'],
                    amount: listOrder[index]['amount'],
                    imageUrl: listOrder[index]['imageUrl'],
                  );
                }
              },
              itemCount: listOrder.length,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              print('done');
            },
            child: Card(
              elevation: 7,
              child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'تنفيذ الطلب ',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Color.fromARGB(255, 243, 156, 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
