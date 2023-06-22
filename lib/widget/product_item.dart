import 'package:go_router/go_router.dart';
import 'package:secondapp/widget/header.dart';
import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String noModel;
  final int price;
  ProductItem(this.id, this.imageUrl, this.noModel, this.price);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          context.go(
            ProductDetail.routeName + '/' + id.toString(),
          );

          print('navigator');
        },
        child: ClipRect(
          child: GridTile(
            child: Image.network('http://192.168.43.180/api/images/$imageUrl'),
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
                        color: Theme.of(context).primaryColor),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
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
