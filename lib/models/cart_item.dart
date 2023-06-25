import 'glasses_frame.dart';

class CartItem {
  GlassesFrame? product;
  String totalPrice;
  int quantity;

  CartItem({
    required this.product,
    required this.totalPrice,
    required this.quantity,
  });

  CartItem.fromMap(Map<dynamic, dynamic> data)
      : product = data['product'],
        totalPrice = data['totalPrice'],
        quantity = data['quantity'];

  Map<String, dynamic> toMap() {
    return {
      'product': product,
      'totalPrice': totalPrice,
      'quantity': quantity,
    };
  }
}
