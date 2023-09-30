import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/components/appImagesPath.dart';
import 'package:uimehdinathani/components/cartItems.dart';
import 'package:uimehdinathani/components/orders.dart';
import 'package:uimehdinathani/components/strings.dart';
import 'package:uimehdinathani/screens/onBoarding/order_view.dart';
import 'package:uimehdinathani/styles/colors.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/backbutton_custom.dart';
import 'package:uimehdinathani/widgets/cardnumber_inputFormatter.dart';
import 'package:uimehdinathani/widgets/cart_bottomsheet.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart';
import 'package:uimehdinathani/widgets/customToast.dart';
import 'package:uimehdinathani/widgets/datainput_formatter.dart';

class CheckOutAddCard extends StatefulWidget {
  const CheckOutAddCard({super.key});

  @override
  State<CheckOutAddCard> createState() => _CheckOutAddCardState();
}

class _CheckOutAddCardState extends State<CheckOutAddCard> {
  void checkCard() {
    if (cardNumber.text == '') {
      cardExist = false;
    } else {
      for (int i = 0; i < cardNumber.text.length;) {
        if (cardNumber.text[i] == '2' || cardNumber.text[i] == '5') {
          card = AppImagesPath.Mastercard;
          for (int i = 0; i < cardNumber.text.length; i++) {}
          cardExist = true;
          break;
        } else if (cardNumber.text[i] == '4') {
          card = AppImagesPath.Visa;
          cardExist = true;
          break;
        } else if (cardNumber.text[i] == '3') {
          card = AppImagesPath.American;
          cardExist = true;
          break;
        } else {
          card = AppImagesPath.wrongCard;
          cardExist = false;
          break;
        }
      }
    }
  }

  num subTotal = 0;

  TextEditingController cardHolder = TextEditingController();
  late String card_holder = "";
  TextEditingController cardNumber = TextEditingController();
  late String card_Number = "";
  TextEditingController cardExp = TextEditingController();
  late String card_Exp = "";
  TextEditingController cardCVV = TextEditingController();
  late String card_CVV = "";
  String card = '';
  bool cardExist = false;
  FocusNode holder = FocusNode();
  FocusNode number = FocusNode();
  FocusNode cvv = FocusNode();
  FocusNode exp = FocusNode();

  @override
  void initState() {
    subTotal = CartProvider().calculateSubtotal();
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: Row(children: [
                  CustomBackButton(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Text(
                    "Add Card",
                    style: addCardStyle,
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: Text(
                  OnBoardingTextData.cardholdername,
                  style: addcardHeadingsStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: TextField(
                  focusNode: holder,
                  style: TextStyle(color: AppColors.black),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 23,
                      horizontal: 10,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        cardHolder.clear();
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: AppColors.black60,
                      ),
                    ),
                    hintText: "Card Holder Name",
                    hintStyle: hintTextAddCard,
                    filled: true,
                    fillColor: AppColors.black20,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: AppColors.black, width: 0.5),
                    ),
                  ),
                  controller: cardHolder,
                  onSubmitted: (String value) {
                    card_holder = cardHolder.text;
                    FocusScope.of(context).requestFocus(number);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: Text(
                  OnBoardingTextData.cardnumber,
                  style: addcardHeadingsStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: TextField(
                    keyboardType: TextInputType.number,
                    focusNode: number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      CardNumberInputFormatter(),
                    ],
                    style: TextStyle(color: AppColors.black),
                    decoration: InputDecoration(
                      prefixIcon: cardNumber.text == ''
                          ? null
                          : Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image(
                                image: Svg(card),
                              ),
                            ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 23,
                        horizontal: 10,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            cardNumber.clear();
                            card = '';
                          });
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: AppColors.black60,
                        ),
                      ),
                      hintText: "eg. 0987 0986 5543 0980",
                      hintStyle: hintTextAddCard,
                      filled: true,
                      fillColor: AppColors.black20,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(color: AppColors.black, width: 0.5),
                      ),
                    ),
                    controller: cardNumber,
                    onSubmitted: (String value) {
                      card_Number = cardNumber.text;
                      FocusScope.of(context).requestFocus(exp);
                    },
                    onChanged: (String value) {
                      setState(() {
                        checkCard();
                      });
                    }),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // EXPDATE TextField
                    Expanded(
                      // optional flex property if flex is 1 because the default flex is 1
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                OnBoardingTextData.eXPDATE,
                                style: addcardHeadingsStyle,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                  DateInputFormatter()
                                ],
                                keyboardType: TextInputType.datetime,
                                focusNode: exp,
                                style: TextStyle(color: AppColors.black),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 23, horizontal: 10),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cardExp.clear();
                                    },
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  hintStyle: hintTextAddCard,
                                  hintText: 'eg. 10/23',
                                  filled: true,
                                  fillColor: AppColors.black20,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: AppColors.black, width: 0.5),
                                  ),
                                ),
                                controller: cardExp,
                                onSubmitted: (String value) {
                                  card_Exp = cardExp.text;
                                  FocusScope.of(context).requestFocus(cvv);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    // CVV TextField
                    Expanded(
                      // optional flex property if flex is 1 because the default flex is 1
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'CVV',
                                style: addcardHeadingsStyle,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                keyboardType: TextInputType.number,
                                focusNode: cvv,
                                style: TextStyle(color: AppColors.black),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 23, horizontal: 10),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cardCVV.clear();
                                    },
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  hintStyle: hintTextAddCard,
                                  hintText: 'eg. 3456',
                                  filled: true,
                                  fillColor: AppColors.black20,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: AppColors.black, width: 0.5),
                                  ),
                                ),
                                controller: cardCVV,
                                onSubmitted: (String value) {
                                  card_CVV = cardCVV.text;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                padding: EdgeInsets.all(10),
                child: CartBottomSheet(
                  onPressed: () {
                    if (cardHolder.text == '' ||
                        cardNumber.text == '' ||
                        cardExp.text == '' ||
                        cardCVV.text == '') {
                      CustomToast.showToast("Fill the above textfields.");
                    } else if (cardExist == false) {
                      CustomToast.showToast(
                          "Please enter correct card number.");
                    } else {
                      Provider.of<Orders>(context, listen: false).clearOrders();

                      //  add cart items in order list
                      final cartProvider =
                          Provider.of<CartProvider>(context, listen: false);
                      final cartItems = cartProvider.cartItems;
                      // // Clear the cart items when the user proceeds to track the order
                      // Provider.of<CartItems>(context, listen: false)
                      //     .clearCart();
                      Provider.of<Orders>(context, listen: false)
                          .addCartItemsToOrders(cartItems);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrdersView(),
                          ));
                    }
                  },
                  buttonText: OnBoardingTextData.makeapayment,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
