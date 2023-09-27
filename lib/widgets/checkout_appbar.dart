import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/components/globals.dart';
import 'package:uimehdinathani/components/strings.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/backbutton_custom.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart';

class CheckoutAppBar extends StatefulWidget {
  const CheckoutAppBar({super.key});

  @override
  State<CheckoutAppBar> createState() => _CheckoutAppBarState();
}

class _CheckoutAppBarState extends State<CheckoutAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        double mediaWidth = MediaQuery.of(context).size.width;
        double mediaHieght = MediaQuery.of(context).size.height;

        return Container(
          width: mediaWidth * 1,
          height: mediaHieght * 0.09,
          color: AppColors.whiteText,
          child: Column(children: [
            Row(
              children: [
                SizedBox(
                  height: mediaHieght * 0.08,
                  width: mediaWidth * 0.05,
                ),
                const CustomBackButton(),
                SizedBox(
                  width: mediaWidth * 0.2,
                ),
                Text(
                  "Shopping Cart (${cartProvider.cartItems.length})",
                  style: cartAppBarTilteStyle,
                ),
              ],
            ),
          ]),
        );
      },
    );
  }
}
