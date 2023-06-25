import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:secondapp/models/glasses_frame.dart';
import '../models/cart_item.dart';

class ProductController extends GetxController {
  RxList<CartItem> allProducts = RxList.empty();
  Rx<int> itemCount = 0.obs;
  Rx<double> price = 0.0.obs;

  add(GlassesFrame productItem) {
    CartItem item =
        CartItem(product: productItem, quantity: 0, totalPrice: '0');

    allProducts.add(item); // Add the item to the cart
    allProducts.refresh();
    countAllItems();
    calculatePrice();
  }

  remove(int index) {
    allProducts.removeAt(index);
    allProducts.refresh();
    countAllItems();
    calculatePrice();
  }

  countAllItems() {
    itemCount.value = 0;
    for (var element in allProducts) {
      itemCount.value += element.quantity;
    }
  }

  calculatePrice() {
    price.value = 0.0;
    for (var element in allProducts) {
      if (element.quantity > 0) {
        price.value =
            (double.parse(element.totalPrice.replaceAll("\$", "").trim()) *
                    element.quantity) +
                price.value;
      }
    }
    price.refresh();
    print(price);
  }

  void increase(int index) {
    allProducts[index].quantity++;
    allProducts.refresh();
    countAllItems();
    calculatePrice();
  }

  void decrease(int index) {
    if (allProducts[index].quantity > 0) {
      allProducts[index].quantity--;
      allProducts.refresh();
      countAllItems();
      calculatePrice();
    }
  }

  void removeItems() {
    for (var item in allProducts) item.quantity = 0;
    allProducts.refresh();
    itemCount.value = 0;
    calculatePrice();
  }

  VoidCallback? isCheckOutButtonEnabled() {
    if (itemCount > 0) return () {};
    return null;
  }
}
