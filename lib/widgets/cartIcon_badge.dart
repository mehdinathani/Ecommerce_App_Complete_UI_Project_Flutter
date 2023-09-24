import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uimehdinathani/components/globals.dart';
import 'package:uimehdinathani/screens/onBoarding/cart_View.dart';
import 'package:uimehdinathani/styles/colors.dart';

class CartIconBadge extends StatefulWidget {
  const CartIconBadge({super.key});

  @override
  State<CartIconBadge> createState() => _CartIconBadgeState();
}

class _CartIconBadgeState extends State<CartIconBadge> {
  int cartItemsCount = cartItems.length;
  late bool showCartBadge;

  @override
  Widget build(BuildContext context) {
    showCartBadge = cartItemsCount > 0;

    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: badges.BadgeAnimation.slide(),
      showBadge: showCartBadge,
      badgeStyle: badges.BadgeStyle(badgeColor: AppColors.orange1),
      badgeContent: Text(
        cartItemsCount.toString(),
        style: TextStyle(color: AppColors.whiteText),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartView(),
            ),
          );
        },
        icon: Icon(
          Icons.shopping_cart,
        ),
      ),
    );
  }
}
