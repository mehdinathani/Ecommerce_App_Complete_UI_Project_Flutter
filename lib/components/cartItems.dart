import 'package:flutter/foundation.dart';

class AddedItems {
  double price;
  String name;
  int quantity;
  String img;

  AddedItems({
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

class CartItems with ChangeNotifier {
  List<AddedItems> _items = [];

  void addToCart(AddedItems item) {
    _items.add(item);
    notifyListeners();
  }

  void removeFromCart(AddedItems item) {
    _items.remove(item);
    notifyListeners();
  }

  List<AddedItems> get items {
    return [..._items];
  }

  // Function to clear cart items
  Future<void> clearCart() async {
    if (_items != null) {
      _items.clear();
    }

    notifyListeners();
  }
}
