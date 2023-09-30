import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uimehdinathani/components/cartItems.dart';

class OrderItem {
  double price;
  String name;
  int quantity;
  String img;

  OrderItem({
    required this.price,
    required this.name,
    required this.quantity,
    required this.img,
  });

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'name': name,
      'quantity': quantity,
      'img': img,
    };
  }
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(OrderItem orderItem) async {
    final prefs = await SharedPreferences.getInstance();
    final ordersData = prefs.getString('orders');
    List<Map<String, dynamic>> existingOrders = [];

    if (ordersData != null) {
      existingOrders = (json.decode(ordersData) as List<dynamic>)
          .map((itemData) => itemData as Map<String, dynamic>)
          .toList();
    }

    existingOrders.add(orderItem.toMap());
    await prefs.setString('orders', json.encode(existingOrders));
    _orders.add(orderItem);
    notifyListeners();
  }

  Future<void> fetchOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final ordersData = prefs.getString('orders');

    if (ordersData != null) {
      final List<dynamic> decodedData =
          json.decode(ordersData) as List<dynamic>;
      final List<OrderItem> loadedOrders = decodedData
          .map((itemData) => OrderItem(
                price: itemData['price'] as double,
                name: itemData['name'] as String,
                quantity: itemData['quantity'] as int,
                img: itemData['img'] as String,
              ))
          .toList();

      _orders = loadedOrders;
      notifyListeners();
    }
  }

  void addCartItemsToOrders(cartItems) {
    // Create an empty list to store OrderItem objects
    final List<OrderItem> orderItemsList = [];

    // Loop through each AddedItems object in the cartItems list
    for (final cartItem in cartItems) {
      // Access the price property for each item and create an OrderItem
      final orderItem = OrderItem(
        name: cartItem['name'],
        price: cartItem['price'], // Access the price property of cartItem
        quantity: cartItem['quantity'],
        img: cartItem['img'],
      );

      // Add the orderItem to the orderItemsList
      orderItemsList.add(orderItem);
    }

    // Add the orderItemsList to the _orders list
    _orders.addAll(orderItemsList);

    // Notify listeners
    notifyListeners();
  }

  void clearOrders() async {
    _orders.clear();
    // You might want to remove the orders from SharedPreferences as well
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('orders');
    notifyListeners();
  }
}
