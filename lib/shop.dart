import 'package:flutter/material.dart';

import 'package:flutter_application_1/productbase.dart';

class Shop extends ChangeNotifier {
  final List<ProductBase> _details = [];
  final List<ProductBase> _cart = [];

  List<ProductBase> get details => _details;
  List<ProductBase> get cart => _cart;

  void addtoCart(ProductBase item, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(item);
    }
    notifyListeners();
  }

  void removefromCart(ProductBase prod) {
    cart.remove(prod);
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }

  int calculateTotalBill() {
    int total = 0;
    for (var product in _cart) {
      if (product is ProductRaw) {
        total += product.price1!;
      } else if (product is Products) {
        total += product.price;
      }
    }
    return total;
  }
}
