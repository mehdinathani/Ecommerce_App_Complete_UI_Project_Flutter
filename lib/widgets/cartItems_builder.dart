import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/cartItems_tiles.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart';

class CartItemBuilder extends StatefulWidget {
  const CartItemBuilder({super.key});

  @override
  State<CartItemBuilder> createState() => _CartItemBuilderState();
}

class _CartItemBuilderState extends State<CartItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      final cartItems = cartProvider.cartItems;
      if (cartProvider.cartItems.isEmpty) {
        // display message on empty cart
        return Center(
          child: Text(
            "Your Cart is Empty.",
            style: emptystyle,
          ),
        );
      } else {
        // dispay cart items.

        return Container(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartProvider.cartItems[index];
              // final Map<String, dynamic> item = cartItems[index];
              print(
                cartItems,
              );

              return CartItemsTiles(
                itemName: item['name'],
                itemInitialPrice: item['price'],
                imagePath: item['img'],
                itemQty: item['quantity'],
              );
            },
          ),
        );
      }
    });
  }
}
