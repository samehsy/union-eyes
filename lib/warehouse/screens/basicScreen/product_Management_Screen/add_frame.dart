import 'package:flutter/material.dart';
import '../../../widget/warehouse_header.dart';

class AddFrame extends StatelessWidget {
  static const routeName = '/AddFrame';
  Widget buildTextfield(String nameField, bool keyBoard) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          nameField,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        Card(
          elevation: 7,
          child: TextField(
            keyboardType: keyBoard ? TextInputType.text : TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 44, 62, 80),
                  width: 3.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 220, 118, 51),
                  width: 2.0,
                ),
              ),
              labelText: nameField,
              labelStyle: TextStyle(
                  color: Color.fromARGB(255, 44, 62, 80),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDropDown() {
    String dropDownValue = 'men';
    return DropdownButton<String>(
      value: dropDownValue,
      items: <String>['child', 'men', 'women']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 30),
          ),
        );
      }).toList(),
      onChanged: null,
    );
  }

  /* Widget buildTextFeild(String nameFeild) {
    return Column(
      children: [
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
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              title: 'إضافة إطار',
            ),
            SizedBox(
              height: 30,
            ),
            buildTextfield('ادخل رقم الموديل', true),
            SizedBox(
              height: 15,
            ),
            buildTextfield('ادخل الكمية ', false),
            SizedBox(
              height: 15,
            ),
            buildTextfield('ادخل رقم اللون ', false),
          ],
        ),
      ),
    );
  }
}
