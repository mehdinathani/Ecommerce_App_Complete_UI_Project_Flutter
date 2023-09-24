import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/components/strings.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;

    return Container(
      height: mediaHeight * 0.30,
      width: mediaWidth * 0.95,
      decoration: ShapeDecoration(
        color: AppColors.black20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: mediaHeight * 0.00002,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Subtotal",
                style: bottomSheetlabelStyle,
              ),
              Text(cartProvider.calculateSubtotal().toStringAsFixed(2),
                  style: bottomSheetValuesStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Subtotal",
                style: bottomSheetlabelStyle,
              ),
              Text(
                "data",
                style: bottomSheetValuesStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Subtotal",
                style: bottomSheetlabelStyle,
              ),
              Text(
                "data",
                style: bottomSheetValuesStyle,
              ),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {},
            child: Text(OnBoardingTextData.checkoutText),
          ),
        ],
      ),
    );
  }
}
