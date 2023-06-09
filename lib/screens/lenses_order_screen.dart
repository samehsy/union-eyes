import 'package:flutter/material.dart';
import '../widget/header.dart';

class LensesOrderScreen extends StatelessWidget {
  static const routeName = '/LensesOrderScreen';

  Widget buildTextFeild(String nameFeild) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameFeild,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        Card(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.black54),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Header(
              title: 'طلب عدسات',
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 450,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildTextFeild('spherical'),
                    buildTextFeild('cylinder'),
                    buildTextFeild('ADD'),
                    buildTextFeild('AXIS'),
                    buildTextFeild('IPD'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              child: Text('ارسال'),
              onPressed: () {
                /* Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return Right();
                  }),
                );*/
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 243, 156, 18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
