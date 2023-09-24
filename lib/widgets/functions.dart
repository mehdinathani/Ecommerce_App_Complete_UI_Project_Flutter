import 'package:uimehdinathani/components/Items.dart';
import 'package:uimehdinathani/components/globals.dart';

Items items = Items();

int findItemIndexByName(String itemName) {
  for (int i = 0; i < items.itemList.length; i++) {
    if (items.itemList[i]['name'] == itemName) {
      return i;
    }
  }
  return -1; // Return -1 if the item is not found
}

Map<String, dynamic> addItemQuantity(Map<String, dynamic> item) {
  // Check if the 'quantity' key already exists
  if (item.containsKey('quantity')) {
    // 'quantity' key exists, increment its value by 1
    item['quantity'] += 1;
  } else {
    // 'quantity' key doesn't exist, add it with a value of 1
    item['quantity'] = 1;
  }
  return item;
}

// Function to add an item to the cart or update its quantity
void addToCart(Map<String, dynamic> newItem) {
  bool itemExists = false;
  for (int i = 0; i < cartItems.length; i++) {
    if (cartItems[i]['name'] == newItem['name']) {
      // Item already exists in cart, update its quantity
      cartItems[i]['quantity'] += 1;
      print("Total Item qty is ${cartItems[i]['quantity']}");
      itemExists = true;
      break;
    }
  }

  if (!itemExists) {
    // Item doesn't exist in cart, add it with quantity 1
    newItem['quantity'] = 1;
    cartItems.add(newItem);
  }
}

double calculateSubtotal(List cartItems) {
  double subtotal = 0.0;

  for (var item in cartItems) {
    // Check if the 'price' and 'quantity' keys exist in the item map
    if (item.containsKey('price') && item.containsKey('quantity')) {
      int intprice = item['price'];
      double price = intprice.toDouble();
      int quantity = item['quantity'];

      // Calculate the subtotal for this item and add it to the total
      subtotal += price * quantity;
    }
  }

  return subtotal;
}

// double subtotal = calculateSubtotal(cartItems);
// print('Subtotal: \$${subtotal.toStringAsFixed(2)}'); // Display the subtotal with 2 decimal places

// Function to update the quantity of an item in the cart
void updateCartItems(String itemName, int newQuantity) {
  for (int i = 0; i < cartItems.length; i++) {
    if (cartItems[i]['name'] == itemName) {
      // Item found in the cart, update its quantity
      cartItems[i]['quantity'] = newQuantity;
      break; // Exit the loop once the item is updated
    }
  }
}

// Function to remove an item from the cart
void removeCartItem(String itemName) {
  cartItems.removeWhere((item) => item['name'] == itemName);
}
