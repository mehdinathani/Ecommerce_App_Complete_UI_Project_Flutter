import 'package:flutter/material.dart';
import 'package:uimehdinathani/components/strings.dart';
import 'package:uimehdinathani/screens/onBoarding/checkout_view.dart';
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
            Expanded(
              child: SingleChildScrollView(
                child: CartItemBuilder(),
              ),
            ),
            CartBottomSheet(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const CheckOutView()),
                  ),
                );
              },
              buttonText: OnBoardingTextData.checkoutText,
            ),
          ],
        ),
      ),
    );
  }
}
