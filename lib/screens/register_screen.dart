import 'package:flutter/material.dart';
import '../di/service_locator.dart';
import '../widget/header.dart';
import '../services/auth_service.dart';

class Register extends StatefulWidget {
  static const routeName = '/RegisterScren';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String firstName = '';
  String lastName = '';
  String centerName = '';
  String city = '';
  String phoneNumber = '';
  String mobileNumber = '';
  String address = '';
  String email = '';
  String password = '';

  final authService = getIt<AuthService>();

  /* Widget buildInputFeild(String nameInputField, var controller) {
    return Column(
      children: [
        Text(
          nameInputField,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        Card(
          elevation: 7,
          child: TextField(
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
              labelText: nameInputField,
              labelStyle: TextStyle(
                  color: Color.fromARGB(255, 44, 62, 80),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            //controller: _userName,
            onChanged: (val) {
              controller = val;
            },
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
            SizedBox(
              height: 30,
            ),
            Header(
              title: 'إنشاء حساب',
            ),
            Column(
              children: [
                Text(
                  'الاسم الاول',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                Card(
                  elevation: 7,
                  child: TextField(
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
                      labelText: 'الاسم الاول',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 44, 62, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    //controller: _userName,
                    onChanged: (val) {
                      firstName = val;
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'الاسم الاخير',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                Card(
                  elevation: 7,
                  child: TextField(
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
                      labelText: 'الاسم الاخير',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 44, 62, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    //controller: _userName,
                    onChanged: (val) {
                      lastName = val;
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'اسم المركز',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                Card(
                  elevation: 7,
                  child: TextField(
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
                      labelText: 'اسم المركز',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 44, 62, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    //controller: _userName,
                    onChanged: (val) {
                      centerName = val;
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'اسم المدينة ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                Card(
                  elevation: 7,
                  child: TextField(
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
                      labelText: 'اسم المدينة',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 44, 62, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    //controller: _userName,
                    onChanged: (val) {
                      city = val;
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'العنوان ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                Card(
                  elevation: 7,
                  child: TextField(
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
                      labelText: 'العنوان',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 44, 62, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    //controller: _userName,
                    onChanged: (val) {
                      address = val;
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'رقم الهاتف',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                Card(
                  elevation: 7,
                  child: TextField(
                    keyboardType: TextInputType.number,
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
                      labelText: 'رقم الهاتف',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 44, 62, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    //controller: _userName,
                    onChanged: (val) {
                      phoneNumber = val;
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'رقم الموبايل',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                Card(
                  elevation: 7,
                  child: TextField(
                    keyboardType: TextInputType.number,
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
                      labelText: 'رقم الموبايل',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 44, 62, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    //controller: _userName,
                    onChanged: (val) {
                      mobileNumber = val;
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'الإيميل',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                Card(
                  elevation: 7,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
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
                      labelText: 'الإيميل',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 44, 62, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    //controller: _userName,
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'كلمة السر',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                Card(
                  elevation: 7,
                  child: TextField(
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
                      labelText: 'كلمة السر',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 44, 62, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    //controller: _userName,
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                print('firstname' + firstName);
                print('lastname' + lastName);
                print('centernumber' + centerName);
                print('city' + city);
                print('address' + address);
                print('phonenumber' + phoneNumber);
                print('mobilenumber' + mobileNumber);
                print('email' + email);
                print('password' + password);
                authService.signup(email, password);
              },
              child: Container(
                width: 300,
                height: 75,
                child: Card(
                  color: Color.fromARGB(255, 230, 126, 34),
                  child: Text(
                    'إنشاء حساب',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
