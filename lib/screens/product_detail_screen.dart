import 'package:flutter/material.dart';
import '../widget/header.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/ProductDetailScreen';
  final index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Card(
              child: IndexedStack(
                index: index,
                children: <Widget>[
                  Container(
                      child: Center(
                          child: Image.asset(
                    "assets/images/j.jpg",
                  ))),
                  Container(
                      child: Center(
                          child: Image.asset(
                    "assets/images/h.jpg",
                  ))),
                  Container(
                      child: Center(
                          child: Image.asset(
                    "assets/images/w.jpg",
                  ))),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 3),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(2),
                      child: Image.asset(
                        'assets/images/j.jpg',
                        alignment: Alignment.center,
                      )),
                  onTap: () {
                    // setState(() {
                    //   this.index = 0;
                    // });
                  },
                ),
                InkWell(
                  child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 3),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(2),
                      child: Image.asset(
                        'assets/images/h.jpg',
                        alignment: Alignment.center,
                      )),
                  onTap: () {
                    // setState(() {
                    //   index = 1;
                    // });
                  },
                ),
                InkWell(
                  child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 3),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(2),
                      child: Image.asset(
                        'assets/images/w.jpg',
                        alignment: Alignment.center,
                      )),
                  onTap: () {
                    // setState(() {
                    //   index = 2;
                    // });
                  },
                ),
              ],
            ),
            InkWell(
              child: Image.asset(
                'assets/images/carrera-logo.png',
                width: 100,
                height: 100,
              ),
              onTap: () {},
            ),
            Container(
              child: Text(
                "CARRERA FRAME FOR UNISEX ROUND GOLD - 245 J5G",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
            ),
            Container(
              child: Text(
                "SAR 984",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 2,
                    color: Colors.cyan),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              //width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/tabby.jpg',
                    width: 100,
                  ),
                  Text(
                    'or 4 interest-free payments of 984.00 SAR.',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "شحن مجاني وإعادته واستبداله",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "يقدر موعد التسليم: 3-5",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                ),
              ),
            ),
            Divider(),
            Container(
              child: Scrollbar(
                child: Column(
                  children: [
                    Text(
                      "تفاصيل المنتج",
                      style: TextStyle(fontSize: 20, color: Colors.cyan),
                      textAlign: TextAlign.start,
                    ),
                    Text("Materials: METAL"),
                    Text("Size: 50"),
                    Text("Arm:140"),
                    Text("Bridge:22"),
                    Text("Frame shape:ROUND")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
