import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/widgets/checkout_address.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart';
import 'package:uimehdinathani/widgets/checkout_appbar.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      final cartItems = cartProvider.cartItems;
      return const SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  CheckoutAppBar(),
                  Expanded(child: SelectAddressCheckOut()),
                ],
              )));
    });
  }
  // dispay cart items.
}
