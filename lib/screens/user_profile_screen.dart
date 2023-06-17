import 'package:flutter/material.dart';
import '../widget/header.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Header(
          title: ' حسابي',
        ),
        SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Register.routeName);
          },
          child: Container(
            width: 300,
            height: 75,
            child: Card(
              //color: Color.fromARGB(255, 230, 126, 34),
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
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(LogInOld.routeName);
          },
          child: Container(
            width: 300,
            height: 75,
            child: Card(
              color: Color.fromARGB(255, 230, 126, 34),
              child: Text(
                'تسجيل دخول',
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
    );
  }
}
