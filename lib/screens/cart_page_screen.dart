import 'package:flutter/material.dart';
import '../widget/header.dart';
import '../dummy_data.dart';

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
          child: Column(
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
                  itemBuilder: (context, index) {
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        Dummy_Data[index].imageUrl?.first ?? '',
                                        scale: 8,
                                      )),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        Dummy_Data[index].noModel.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('الكمية' +
                                              Dummy_Data[index]
                                                  .price
                                                  .toString()),
                                          Chip(
                                              label: Text(Dummy_Data[0]
                                                  .price
                                                  .toString()),
                                              backgroundColor: Theme.of(context)
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text('4'),
                                  IconButton(
                                    icon: Icon(
                                      Icons.do_not_disturb_on_outlined,
                                    ),
                                    onPressed: () {},
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete_outline,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ])));
                  },
                  itemCount: Dummy_Data.length,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'قيمة الفاتورة',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Card(
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 30,
                        child: Text(
                          '12540',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
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
                  onPressed: () {},
                  child: const Text('إرسال الطلب'),
                ),
              ),
            ],
          ),
        )),
      ),
      icon: const Icon(Icons.shopping_cart),
      tooltip: 'السلة',
    );
  }
}
