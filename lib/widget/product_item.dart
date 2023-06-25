import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/models/glasses_frame.dart';
import '../constant.dart';
import '../controllers/products_controller.dart';
import '../screens/product_detail_screen.dart';

final ProductController controller = Get.put(ProductController());

class ProductItem extends StatelessWidget {
  final GlassesFrame product;
  ProductItem(this.product);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          context.go(
            '${ProductDetail.routeName}/${product.id}',
          );
        },
        child: ClipRect(
          child: GridTile(
            footer: Container(
              height: 50,
              color: const Color.fromARGB(255, 242, 243, 244),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.price}   SP',
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
                    onPressed: () {
                      controller.add(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          behavior: SnackBarBehavior.floating,
                          content: const Text("تم الإضافة الى السلة "),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            child: Image.network(
              '${API_URL}images/${product.imageUrl?.first}',
              errorBuilder: ((context, error, stackTrace) {
                return Image.asset('assets/images/logo-black.png');
              }),
            ),
          ),
        ),
      ),
    );
  }
}
