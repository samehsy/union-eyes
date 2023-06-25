import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controllers/products_controller.dart';
import '../models/cart_item.dart';
import '../dummy_data.dart';

final ProductController controller = Get.put(ProductController());

class CartPageScreen extends StatefulWidget {
  static const routeName = 'cart';
  @override
  _CartPageScreenState createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog.fullscreen(
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Obx(() {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('السلة'),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: controller.allProducts.length,
                        itemBuilder: (context, index) {
                          var item = controller.allProducts[index];
                          return Card(
                              clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              // color: Theme.of(context).colorScheme.primaryContainer,
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(children: [
                                    Row(
                                      // mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            '${API_URL}images/${item.product?.imageUrl?.first}',
                                            errorBuilder:
                                                ((context, error, stackTrace) {
                                              return Image.asset(
                                                  'assets/images/logo-black.png');
                                            }),
                                            scale: 8,
                                          ),
                                        ),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            Text(
                                              item.product?.noModel
                                                      .toString() ??
                                                  '',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('الكمية' +
                                                        item.product!.price
                                                            .toString() ??
                                                    ''),
                                                Chip(
                                                    label: Text(item
                                                            .product!.price
                                                            .toString() ??
                                                        ''),
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primaryContainer)
                                              ],
                                            )
                                          ],
                                        ))
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.add_circle_outline,
                                          ),
                                          onPressed: () =>
                                              controller.increase(index),
                                        ),
                                        Text(item.quantity.toString()),
                                        IconButton(
                                          icon: Icon(
                                            Icons.do_not_disturb_on_outlined,
                                          ),
                                          onPressed: () {
                                            controller.decrease(index);
                                          },
                                        ),
                                        Spacer(),
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete_outline,
                                          ),
                                          onPressed: () =>
                                              {controller.remove(index)},
                                        ),
                                      ],
                                    )
                                  ])));
                        },
                      )),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'قيمة الفاتورة',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Card(
                              child: Container(
                                alignment: Alignment.center,
                                width: 120,
                                height: 30,
                                child: Text(
                                  controller.price.toString(),
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            // maximumSize: Size.fromWidth(100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: controller.isCheckOutButtonEnabled(),
                          child: const Text('إرسال الطلب'),
                        ),
                      ),
                    ],
                  );
                }))),
      ),
      icon: const Icon(Icons.shopping_cart),
      tooltip: 'السلة',
    );
  }
}
