import 'package:secondapp/widget/header.dart';
import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String noModel;
  final double price;
  ProductItem(this.imageUrl, this.noModel, this.price);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Card(
        elevation: 10,
        child: GridTile(
          header: Container(),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName);
            },
            child: Image.asset(imageUrl),
          ),
          footer: Container(
            height: 50,
            color: Color.fromARGB(255, 242, 243, 244),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price.toString() + '   SP',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 243, 156, 18),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Color.fromARGB(255, 243, 156, 18),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*GridTileBar(
            trailing: IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Color.fromARGB(255, 243, 156, 18),
              ),
              onPressed: () {},
            ),
            title: Text(''),
            leading: Text(
              price.toString() + '   SP',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 243, 156, 18),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 248, 249, 249),
          ),*/
