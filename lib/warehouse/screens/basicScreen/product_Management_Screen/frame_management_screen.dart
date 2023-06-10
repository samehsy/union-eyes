import 'package:flutter/material.dart';
import '../../../widget/warehouse_header.dart';
import 'add_frame.dart';

class FrameManagementScreen extends StatelessWidget {
  static const routeName = '/FrameManagementScreen';
   List<Map<String, dynamic>>  frameList = [
    {
      'id': 1,
      'noModel': 'CARRERINO68',
      ' noColor': '807',
      'price': 427,
      'frameType': 'plastic',
      ' size': 50,
      'arm': 135,
      'bridge': 16,
      ' frameshape': 'Square',
      'frameClass': 'Child',
      ' manufactureCompany': 'CARRERA',
      'imageUrl': [
        'assets/product/child/1/1.jpg',
        'assets/product/child/1/2.jpg',
        'assets/product/child/1/3.jpg',
      ],
    },
    {
      'id': 2,
      'noModel': '5002',
      'noColor': '41',
      'price': 174,
      ' frameType': 'ACETATE',
      'size': 43,
      'arm': 115,
      'bridge': 18,
      'frameshape': 'Circular',
      'frameClass': 'Child',
      'manufactureCompany': 'OEX',
      'imageUrl': [
        'assets/product/child/2/1.jpg',
        'assets/product/child/2/2.jpg',
      ],
    },
    {
      'id': 3,
      'noModel': '5004',
      'noColor': '33',
      'price': 174,
      'frameType': 'ACETATE',
      'size': 42,
      'arm': 115,
      'bridge': 17,
      'frameshape': 'Rectangular',
      'frameClass': 'Child',
      'manufactureCompany': 'OEX',
      'imageUrl': [
        'assets/product/child/3/1.jpg',
        'assets/product/child/3/2.jpg',
      ],
    },
    {
      'id': 4,
      'noModel': '7010',
      'noColor': '6',
      'price': 174,
      'frameType': 'plastic',
      'size': 46,
      'arm': 136,
      'bridge': 21,
      'frameshape': 'Circular',
      'frameClass': 'Child',
      'manufactureCompany': 'OEX',
      'imageUrl': [
        'assets/product/child/4/1.jpg',
        'assets/product/child/4/2.jpg',
      ],
    },
    {
      'id': 5,
      'noModel': '5003',
      'noColor': '14',
      'price': 174,
      'frameType': 'ACETATE',
      'size': 44,
      'arm': 115,
      'bridge': 17,
      'frameshape': 'Rectangular',
      'frameClass': 'Child',
      'manufactureCompany': 'OEX',
      'imageUrl': [
        'assets/product/child/5/1.jpg',
        'assets/product/child/5/2.jpg',
      ],
    },
    {
      'id': 6,
      'noModel': '245',
      'noColor': 'J5G',
      'price': 984,
      'frameType': 'Metal',
      'size': 50,
      'arm': 140,
      'bridge': 22,
      'frameshape': 'Circular',
      'frameClass': 'Man',
      'manufactureCompany': 'CARRERA',
      'imageUrl': [
        'assets/product/men/1/1.jpg',
        'assets/product/men/1/2.jpg',
        'assets/product/men/1/3.jpg',
      ],
    },
    {
      'id': 7,
      'noModel': '1066',
      'noColor': 'BLX',
      'price': 949,
      'frameType': 'Metal&plastic',
      'size': 55,
      'arm': 145,
      'bridge': 19,
      'frameshape': 'Rectangular',
      'frameClass': 'Man',
      'manufactureCompany': 'BOSS',
      'imageUrl': [
        'assets/product/men/2/1.jpg',
        'assets/product/men/2/2.jpg',
        'assets/product/men/2/3.jpg',
      ],
    },
    {
      'id': 8,
      'noModel': 'PLDD363G',
      'noColor': 'YL718',
      'price': 347,
      'frameType': 'من الأمام بلاستيك ،الأذرعة معدني',
      'size': 50,
      'arm': 145,
      'bridge': 18,
      'frameshape': 'Square',
      'frameClass': 'Man',
      'manufactureCompany': 'POLAROID',
      'imageUrl': [
        'assets/product/men/3/1.jpg',
        'assets/product/men/3/2.jpg',
        'assets/product/men/3/3.jpg',
        'assets/product/men/3/4.jpg',
      ],
    },
    {
      'id': 9,
      'noModel': '1096',
      'noColor': 'FLL',
      'price': 1260,
      'frameType': 'METAL',
      'size': 54,
      'arm': 145,
      'bridge': 18,
      'frameshape': 'Square',
      'frameClass': 'Man',
      'manufactureCompany': 'HUGO',
      'imageUrl': [
        'assets/product/men/4/1.jpg',
        'assets/product/men/4/2.jpg',
      ],
    },
    {
      'id': 10,
      'noModel': 'CA2010T',
      'noColor': 'J5G',
      'price': 656,
      'frameType': 'METAL',
      'size': 51,
      'arm': 135,
      'bridge': 19,
      'frameshape': 'Square',
      'frameClass': 'Man',
      'manufactureCompany': 'CARRERA',
      'imageUrl': [
        'assets/product/men/5/1.jpg',
        'assets/product/men/5/2.jpg',
        'assets/product/men/5/3.jpg',
      ],
    },
    {
      'id': 11,
      'noModel': 'MK3048',
      'noColor': '1108',
      'price': 876,
      'frameType': 'METAL',
      'size': 54,
      'arm': 140,
      'bridge': 17,
      'frameshape': 'Oval',
      'frameClass': 'Woman',
      'manufactureCompany': 'CARRERA',
      'imageUrl': [
        'assets/product/women/1/1.jpg',
        'assets/product/women/1/2.jpg',
        'assets/product/women/1/3.jpg',
      ],
    },
    {
      'id': 12,
      'noModel': 'PLDD363G',
      'noColor': 'YL718',
      'price': 347,
      'frameType': 'من الأمام بلاستيك ،الأذرعة معدني',
      'size': 50,
      'arm': 145,
      'bridge': 18,
      'frameshape': 'Square',
      'frameClass': 'Woman',
      'manufactureCompany': 'POLARIOD',
      'imageUrl': [
        'assets/product/women/2/1.jpg',
        'assets/product/women/2/2.jpg',
        'assets/product/women/2/3.jpg',
        'assets/product/women/2/4.jpg',
      ],
    },
    {
      'id': 13,
      'noModel': 'DG3335',
      'noColor': '502',
      'price': 1236,
      'frameType': 'plastic',
      'size': 54,
      'arm': 145,
      'bridge': 19,
      'frameshape': 'Oval',
      'frameClass': 'Woman',
      'manufactureCompany': 'DOLCE &GABBANA',
      'imageUrl': [
        'assets/product/women/3/1.jpg',
        'assets/product/women/3/2.jpg',
        'assets/product/women/3/3.jpg',
      ],
    },
    {
      'id': 14,
      'noModel': 'TH1684',
      'noColor': '2M216',
      'price': 839,
      'frameType': 'METAL',
      'size': 54,
      'arm': 140,
      'bridge': 16,
      'frameshape': 'Rectangular',
      'frameClass': 'Woman',
      'manufactureCompany': 'TOMMY HILFGER',
      'imageUrl': [
        'assets/product/women/4/1.jpg',
        'assets/product/women/4/2.jpg',
        'assets/product/women/4/3.jpg',
      ],
    },
    {
      'id': 14,
      'noModel': 'TH1684',
      'noColor': '2M216',
      'price': 839,
      'frameType': 'METAL',
      'size': 54,
      'arm': 140,
      'bridge': 16,
      'frameshape': 'Rectangular',
      'frameClass': 'Woman',
      'manufactureCompany': 'TOMMY HILFGER',
      'imageUrl': [
        'assets/product/women/4/1.jpg',
        'assets/product/women/4/2.jpg',
        'assets/product/women/4/3.jpg',
      ],
    },
    {
      'id': 15,
      'noModel': 'EA1118',
      'noColor': '3011',
      'price': 854,
      'frameType': 'METAL',
      'size': 51,
      'arm': 140,
      'bridge': 18,
      'frameshape': 'Circular',
      'frameClass': 'Woman',
      'manufactureCompany': 'EMPORIO ARMANI',
      'imageUrl': [
        'assets/product/women/5/1.jpg',
        'assets/product/women/5/2.jpg',
        'assets/product/women/5/3.jpg',
      ],
    },
  ];

  Widget buildGridFrame({
   required List<String> imageUrl,
  required  String noModel ,
  required  String frameClass,
  required  String amount ,
  }) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color.fromARGB(255, 95, 106, 106),
          width: 3,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  splashColor: Colors.grey,
                  icon: Icon(
                    Icons.delete_outline_sharp,
                    color: Color.fromARGB(255, 192, 57, 43),
                  ),
                  onPressed: () {}),
              IconButton(
                  splashColor: Colors.grey,
                  icon: Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 118, 215, 196),
                  ),
                  onPressed: () {}),
            ],
          ),
          Image.asset(
            imageUrl[0],
            scale: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noModel,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 243, 156, 18),
                    ),
                  ),
                  Text(
                    frameClass,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 243, 156, 18),
                    ),
                  ),
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 243, 156, 18),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'رقم الموديل ',
                    style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'صنف الإطار',
                    style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'الكمية',
                    style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Header(
            title: 'إدارة الإطارات',
          ),
          SizedBox(
            height: 25,
          ),
          Card(
            elevation: 15,
            child: Container(
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                //controller: shController,
                onSubmitted: (_) {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 430,
            child: GridView.builder(
              padding: const EdgeInsets.all(2),
              itemCount: frameList.length,
              itemBuilder: (ctx, i) => buildGridFrame(
                imageUrl: frameList[i]['imageUrl'],
                noModel: frameList[i]['noModel'] ,
                frameClass: frameList[i]['frameClass'],
                amount: frameList[i]['arm'].toString(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //childAspectRatio: 3 / 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 44, 62, 80),
        child: Icon(
          Icons.add,
          size: 35,
        ),
        onPressed: () {
          print('test');
          Navigator.of(context).pushNamed(AddFrame.routeName);
        },
      ),
    );
  }
}
