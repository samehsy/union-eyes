import 'package:flutter/material.dart';
import '../services/glasses_service.dart';
import '../widget/header.dart';
import '../di/service_locator.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = '/home/details';

  final String id;
  ProductDetail(this.id);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  static const routeName = '/home/details';
  final glassesService = getIt<GlassesService>();

  String id = '';
  @override
  Widget build(BuildContext context) {
    // final item = glassesService.getOne(id);
    // print(item);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.amber,
                  width: 0.5,
                ),
              ),
              // child: Image.asset(
              //   widget.imageUrl[indexImage],
              //   scale: 3,
              // ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return InkWell(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 2.0,
                        ),
                      ),
                      // child: Image.asset(
                      //   // widget.imageUrl[i],
                      // ),
                    ),
                    onTap: () {
                      setState(
                        () {
                          // indexImage = i;
                        },
                      );
                    },
                  );
                },
                // itemCount:1 widget.imageUrl.length,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Card(
                elevation: 7,
                child: ExpansionTile(
                  textColor: Colors.green,
                  title: const Text('تفاصيل المنتج '),
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Table(
                        children: const [
                          TableRow(
                            children: [
                              Text(
                                'رقم الموديل ',
                                textAlign: TextAlign.center,
                              ),
                              Text('125', textAlign: TextAlign.start),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text(
                                'رقم اللون',
                                textAlign: TextAlign.center,
                              ),
                              Text('125', textAlign: TextAlign.start),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text(
                                'السعر',
                                textAlign: TextAlign.center,
                              ),
                              Text('125', textAlign: TextAlign.start),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text(
                                'الحجم',
                                textAlign: TextAlign.center,
                              ),
                              Text('125', textAlign: TextAlign.start),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text(
                                'الجسر',
                                textAlign: TextAlign.center,
                              ),
                              Text('125', textAlign: TextAlign.start),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text(
                                'الذراع',
                                textAlign: TextAlign.center,
                              ),
                              Text('125', textAlign: TextAlign.start),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text(
                                'شكل الاطار',
                                textAlign: TextAlign.center,
                              ),
                              Text('125', textAlign: TextAlign.start),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text(
                                'صنف الاطار',
                                textAlign: TextAlign.center,
                              ),
                              Text('125', textAlign: TextAlign.start),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text(
                                'الشركة المصنعة',
                                textAlign: TextAlign.center,
                              ),
                              Text('125', textAlign: TextAlign.start),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('اضف الى السلة'),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.amberAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
