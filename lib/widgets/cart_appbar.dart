import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/components/strings.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/backbutton_custom.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart';

class CartAppBar extends StatefulWidget {
  const CartAppBar({super.key});

  @override
  State<CartAppBar> createState() => _CartAppBarState();
}

class _CartAppBarState extends State<CartAppBar> {
  var lastlineText = RichText(
    text: const TextSpan(
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
      children: <TextSpan>[
        TextSpan(text: 'Use code '),
        TextSpan(
            text: '#HalalFood', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: ' at Checkouut'),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        double mediaWidth = MediaQuery.of(context).size.width;
        double mediaHieght = MediaQuery.of(context).size.height;

        return Container(
          width: mediaWidth * 1,
          height: kIsWeb ? mediaHieght * 0.4 : mediaHieght * 0.3,
          color: AppColors.orange2,
          child: Stack(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: const Text(
                    "#",
                    style: TextStyle(
                        fontSize: 300,
                        fontWeight: FontWeight.w200,
                        color: Colors.amber),
                  )),
            ),
            Row(
              children: [
                SizedBox(
                  height: mediaHieght * 0.12,
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
            Container(
              padding: const EdgeInsets.only(left: 135, top: 55),
              child: Column(
                children: [
                  Text(
                    "        OFF!!",
                    style: offStyle,
                  ),
                  Text(
                    OnBoardingTextData.cartOffer,
                    style: cartOfferStyle,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                height: mediaHieght * 0.05,
                width: mediaWidth * 1,
                color: AppColors.orange1,
                child: Center(child: lastlineText),
              ),
            ),
          ]),
        );
      },
    );
  }
}
