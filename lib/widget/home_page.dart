import 'package:flutter/material.dart';
import 'package:secondapp/models/glasses_frame.dart';
import 'package:secondapp/services/glasses_service.dart';
import '../di/service_locator.dart';
import '../dummy_data.dart';
import '../widget/product_item.dart';

class HomePage extends StatelessWidget {
  final glassesService = getIt<GlassesService>();

  Widget buildFilterIcon(String titleFilter, String imagePath) {
    return Column(
      children: [
        InkWell(
          child: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 45,
          ),
          onTap: () {
            glassesService.getAll();
          },
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
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildFilterIcon('أطفال', 'assets/images/child.png'),
            buildFilterIcon('نسائي', 'assets/images/woman.png'),
            buildFilterIcon('رجالي', 'assets/images/man.png'),
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
          future: glassesService.getAll(),
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
