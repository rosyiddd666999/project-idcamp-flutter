import 'package:flutter/material.dart';

class QuantityNotifier extends ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }
}
