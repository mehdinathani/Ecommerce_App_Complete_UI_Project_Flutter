import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/components/globals.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/functions.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart'; // Import the CartProvider

class CartItemsTiles extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final double itemInitialPrice;
  final int itemQty;

  CartItemsTiles({
    Key? key,
    required this.imagePath,
    required this.itemName,
    required this.itemInitialPrice,
    required this.itemQty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;

    // Access the CartProvider using Provider.of
    final cartProvider = Provider.of<CartProvider>(context);

    return Column(
      children: [
        Padding(padding: EdgeInsets.only(left: 10, right: 10)),
        Container(
          width: mediaWidth * 1,
          height: mediaHeight * 0.1,
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imagePath,
                  width: mediaWidth * 0.2,
                  height: mediaHeight * 0.2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(itemName),
                    Text(
                      "\$ ${(itemInitialPrice * itemQty).toString()}",
                    ),
                  ],
                ),
                SizedBox(width: mediaWidth * 0.20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (itemQty > 1) {
                            // Use the CartProvider to decrement quantity
                            cartProvider.decrementQuantity(itemName);
                          } else {
                            cartProvider.removeFromCart(itemName);
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.black45,
                          radius: 15,
                          child: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mediaWidth * 0.03,
                      ),
                      Text(
                        itemQty.toString(),
                        style: cartItemCountStyle,
                      ),
                      SizedBox(
                        width: mediaWidth * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          // Use the CartProvider to increment quantity
                          cartProvider.incrementQuantity(itemName);
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.black45,
                          radius: 15,
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(color: AppColors.black, height: 2),
      ],
    );
  }
}
