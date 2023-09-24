import 'package:flutter/material.dart';
import 'package:uimehdinathani/widgets/cartItems_builder.dart';
import 'package:uimehdinathani/widgets/cartItems_tiles.dart';
import 'package:uimehdinathani/widgets/cart_appbar.dart';
import 'package:uimehdinathani/widgets/cart_bottomsheet.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CartAppBar(),
          SingleChildScrollView(child: CartItemBuilder()),
          Expanded(child: SizedBox()),
          CartBottomSheet(),
        ],
      ),
    ));
  }
}
