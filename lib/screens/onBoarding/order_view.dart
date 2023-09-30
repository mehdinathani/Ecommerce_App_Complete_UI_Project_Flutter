import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/components/appImagesPath.dart';
import 'package:uimehdinathani/components/orders.dart';
import 'package:uimehdinathani/screens/onBoarding/TrackView.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/backbutton_custom.dart';
import 'package:uimehdinathani/widgets/backbutton_custom_home_page.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  var randomNumber = Random().nextInt(10000);
  String riderName = "Rakib Ul Hassan";

  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context, listen: false);
    // final cartItems = cartProvider.cartItems;
    // // // Clear the cart items when the user proceeds to track the order
    // // Provider.of<CartItems>(context, listen: false)
    // //     .clearCart();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Row(children: [
                const CustomBackButtonHome(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  "Orders",
                  style: addCardStyle,
                ),
              ]),
            ),
            Consumer<Orders>(
              builder: (context, ordersProvider, child) {
                final orders = ordersProvider.orders;
                if (orders.isEmpty) {
                  return Container(
                    child: Text("No Orders Record found."),
                  );
                } else {
                  return Expanded(
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1,
                                      color: AppColors.appBackgroundColor),
                                  borderRadius: BorderRadius.circular(10)),
                              leading: Container(
                                height: 45,
                                width: 45,
                                child: Image.asset(
                                  orders[index].img,
                                ),
                              ),
                              title: Text(
                                orders[index].name,
                                style: orderslistTitleStyle,
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "\$ ${orders[index].price}",
                                  style: orderslistpriceStyle,
                                ),
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'ID:  ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.amountColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '#$randomNumber',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.amountColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Quantity ${orders[index].quantity}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.amountColor),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
            Container(
              color: AppColors.whiteText,
              height: 200,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 175,
                          height: 175,
                          child: Image.asset(AppImagesPath.deliverytruck),
                        ),
                        Text(
                          "Meet our Rider $riderName",
                          style: meetOurRiderStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your Order',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: AppColors.amountColor),
                        ),
                        Text(
                          "is on the way",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.amountColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: AppColors.appBackgroundColor,
                            fixedSize: const Size(115, 56),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                curve: Curves.linear,
                                type: PageTransitionType.rightToLeft,
                                child: TrackView(
                                  orderNumber: randomNumber,
                                  riderName: riderName,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Track Order',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteText),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
