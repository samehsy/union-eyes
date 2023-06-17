import 'package:flutter/material.dart';
import '../di/service_locator.dart';
import '../widget/header.dart';
import '../services/auth_service.dart';

class LogInOld extends StatefulWidget {
  static const routeName = '/LogInScreen';

  @override
  State<LogInOld> createState() => _LogInState();
}

class _LogInState extends State<LogInOld> {
  String _userName = '';
  String _passWord = ' ';

  final authService = getIt<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Header(title: 'تسجيل الدخول'),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text(
                  'اسم المستخدم',
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
                      labelText: 'اسم المستخدم',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 44, 62, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    //controller: _userName,
                    onChanged: (val) {
                      _userName = val;
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
                    //controller: _passWord,
                    onChanged: (val) {
                      _passWord = val;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                print(_userName);
                print(_passWord);
                Map<String, dynamic> userData = {
                  'email': _userName,
                  'password': _passWord,
                };

                var response = authService
                    .login(_userName,_passWord)
                    .then(
                  (value) {
                    //print(value.data['user']['role']);
                    // if (value.data['status'] == 'success') {
                    //   Navigator.of(context).pushNamed('homePageScreen');
                    // } else {
                    //   print(value.data['status']);
                    // }
                    // var res = value.data['status'];
                    // print('res' + res);
                  },
                );
              },
              child: Text(
                'تسجيل الدخول',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 186, 74, 0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
