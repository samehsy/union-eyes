import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  Header({required this.title});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 7,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(right: 25, top: 7),
        width: double.infinity,
        child: Text(
          title,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'Cario',
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
