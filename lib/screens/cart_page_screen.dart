import 'package:flutter/material.dart';
import '../widget/header.dart';
import '../dummy_data.dart';

class CartPageScreen extends StatefulWidget {
  @override
  _CartPageScreenState createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Header(
          title: 'السلة',
        ),
        SizedBox(
          height: 20,
        ),
        Card(
          elevation: 5,
          child: Container(
            height: 375,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 7,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 86, 101, 115),
                            width: 2)),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                size: 25,
                                color: Color.fromARGB(255, 192, 57, 43),
                              ),
                              onPressed: () {},
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: 25,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.minimize_outlined,
                                    size: 25,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 150,
                          child: Table(
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    'طلب إطار',
                                    textAlign: TextAlign.start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'نوع الطلب',
                                    textAlign: TextAlign.end,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 20,
                                    child: FittedBox(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        Dummy_Data[index].noModel ?? '',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'الموديل',
                                    textAlign: TextAlign.end,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text(
                                    Dummy_Data[index].arm.toString(),
                                    textAlign: TextAlign.start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'الكمية',
                                    textAlign: TextAlign.end,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text(
                                    Dummy_Data[index].price.toString(),
                                    textAlign: TextAlign.start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'السعر',
                                    textAlign: TextAlign.end,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 220, 118, 51),
                                width: 1),
                          ),
                          child: Image.asset(
                            Dummy_Data[index].imageUrl?.first ?? '',
                            scale: 8,
                          ),
                        )
                      ],
                    ),
                  ),
                );
                ;
              },
              itemCount: Dummy_Data.length,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              child: Container(
                alignment: Alignment.center,
                width: 120,
                height: 30,
                child: Text(
                  '12540',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text(
              'قيمة الفاتورة',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 243, 156, 18)),
              ),
              child: Text(
                'إرسال الطلب',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {}),
        ),
      ],
    );
  }
}
