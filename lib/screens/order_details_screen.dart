import 'package:flutter/material.dart';

class OrderdetailsScreen extends StatelessWidget {
  static const routeName = '/OrderDetailaScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Card(
            child: Table(
              // border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Text('Cell 1'),
                    ),
                    TableCell(
                      child: Text('Cell 2'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Text('Cell 3'),
                    ),
                    TableCell(
                      child: Text('Cell 4'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
