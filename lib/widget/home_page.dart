import 'package:flutter/material.dart';
import 'package:secondapp/models/glasses_frame.dart';
import 'package:secondapp/services/glasses_service.dart';
import '../di/service_locator.dart';

import '../widget/product_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final glassesService = getIt<GlassesService>();
  String typeFliter = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                InkWell(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/child.png'),
                    radius: 45,
                  ),
                  onTap: () {
                    setState(() {
                      print('child');
                      typeFliter = 'child';
                    });
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  ' أطفال',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Column(
              children: [
                InkWell(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/woman.png'),
                    radius: 45,
                  ),
                  onTap: () {
                    setState(() {
                      print('woman');
                      typeFliter = 'woman';
                    });
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  ' نسائي',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Column(
              children: [
                InkWell(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/man.png'),
                    radius: 45,
                  ),
                  onTap: () {
                    setState(() {
                      print('men');
                      typeFliter = 'men';
                    });
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  ' رجالي',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Column(
              children: [
                InkWell(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/allProduct.png'),
                    radius: 45,
                  ),
                  onTap: () {
                    setState(() {
                      print('allproduct');
                      typeFliter = 'allProduct';
                    });
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  ' جميع الإطارات',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 400,
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'ابحث باستخدام رقم الموديل',
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
        SizedBox(
          height: 10,
        ),
        FutureBuilder<List<GlassesFrame>>(
          future: glassesService.getAll(typeFliter),
          builder: (BuildContext context,
              AsyncSnapshot<List<GlassesFrame>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final List<GlassesFrame> products = snapshot.data!;

              return Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (ctx, i) => ProductItem(
                    products[i].imageUrl?.first ?? '',
                    products[i].noModel ?? '',
                    products[i].price ?? 0,
                  ),
                  itemCount: products.length,
                ),
              );
            }
          },
        )
      ],
    );
  }
}
