import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../dummy_data.dart';
import '../widget/product_item.dart';

class HomePage extends StatelessWidget {
  Widget buildFilterIcon(String titleFilter, String imagePath) {
    return Column(
      children: [
        InkWell(
          child: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 45,
            backgroundColor: Colors.red,
          ),
          onTap: () {},
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          titleFilter,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Cario',
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo3.jpeg',
          height: 125,
          width: 125,
        ),
        SizedBox(
          width: double.infinity,
          height: 5,
        ),
        Container(
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
        SizedBox(
          height: 7,
        ),
        Container(
          height: 410,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'تصفح الإطارات',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildFilterIcon('أطفال', 'assets/images/child.png'),
                    buildFilterIcon('نسائي', 'assets/images/woman.png'),
                    buildFilterIcon('رجالي', 'assets/images/man.png'),
                  ],
                ),
                Container(
                  height: 300,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (ctx, i) => ProductItem(
                      Dummy_Data[i].imageUrl?.first ?? '',
                      Dummy_Data[i].noModel ?? '',
                      Dummy_Data[i].price ?? 0,
                    ),
                    itemCount: Dummy_Data.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
