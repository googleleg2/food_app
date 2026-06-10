import 'package:flutter/material.dart';

import '../models/cart_item.dart';
import '../models/menu_item.dart';

class CartController extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get total => _items.fold(0, (sum, item) => sum + item.total);

  void addItem(MenuItem menuItem) {
    final index = _items.indexWhere(
      (cartItem) => cartItem.item.name == menuItem.name,
    );

    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(item: menuItem));
    }

    notifyListeners();
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }

    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
