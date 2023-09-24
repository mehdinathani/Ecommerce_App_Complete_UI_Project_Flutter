import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  CartProvider() {
    // Initialize cart items from SharedPreferences when the provider is created.
    loadCartFromPrefs();
  }

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> item) {
    print("Adding item to cart: $item"); // Add this line to log the item.

    final existingItem = _cartItems.firstWhere(
      (cartItem) => cartItem['name'] == item['name'],
      orElse: () => {},
    );

    if (existingItem.isNotEmpty) {
      existingItem['quantity']++;
    } else {
      item['quantity'] = 1;
      _cartItems.add(item);
    }

    saveCartToPrefs();
    notifyListeners();
  }

  void removeFromCart(String itemName) {
    _cartItems.removeWhere((item) => item['name'] == itemName);
    saveCartToPrefs();
    notifyListeners();
  }

  double calculateSubtotal() {
    double subtotal = 0.0;
    for (var item in _cartItems) {
      subtotal += (item['price'] is String)
          ? double.parse(item['price']) * item['quantity']
          : (item['price'] as double) * item['quantity'];
    }
    return subtotal;
  }

  Future<void> loadCartFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartData = prefs.getStringList('cart');
    if (cartData != null) {
      _cartItems = cartData.map((item) {
        Map<String, dynamic> map = Map<String, dynamic>.from(json.decode(item));
        return map;
      }).toList();
      notifyListeners();
    }
  }

  Future<void> saveCartToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartData =
        _cartItems.map((item) => json.encode(item)).toList();
    prefs.setStringList('cart', cartData);
  }

  // Increment quantity for a given item
  void incrementQuantity(String itemName) {
    final cartItem = _cartItems.firstWhere(
      (item) => item['name'] == itemName,
      orElse: () => {},
    );

    if (cartItem != null) {
      cartItem['quantity']++;
      saveCartToPrefs();
      notifyListeners();
    }
  }

  // Decrement quantity for a given item
  void decrementQuantity(String itemName) {
    final cartItem = _cartItems.firstWhere(
      (item) => item['name'] == itemName,
      orElse: () => {},
    );

    if (cartItem != null && cartItem['quantity'] > 1) {
      cartItem['quantity']--;
      saveCartToPrefs();
      notifyListeners();
    }
  }
}
