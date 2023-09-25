import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/components/Items.dart';
import 'package:uimehdinathani/components/cartItems.dart';
import 'package:uimehdinathani/components/globals.dart';
import 'package:uimehdinathani/components/recomendedItems.dart';
import 'package:uimehdinathani/components/strings.dart';
import 'package:uimehdinathani/screens/onBoarding/ItemPage.dart';
import 'package:uimehdinathani/styles/typo.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart';
import 'package:uimehdinathani/widgets/functions.dart';
import 'package:uimehdinathani/widgets/recomendItemCard.dart';

class RecomendedTab extends StatefulWidget {
  const RecomendedTab({super.key});

//  List<RecomendedItems> recomendedItem = [];
  static RecomendedItems recomendedItems = RecomendedItems();

  @override
  State<RecomendedTab> createState() => _RecomendedTabState();
}

class _RecomendedTabState extends State<RecomendedTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              OnBoardingTextData.Recommended,
              style: recommendedStyle,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.011,
        ),
        Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 194,
            width: double.infinity,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final recomendedItem =
                      RecomendedItems().recomendedItem[index];
                  return RecomendedItemCard(
                    onTap: () {
                      itemIndex = findItemIndexByName(
                        recomendedItem['name'],
                      );
                      print(itemIndex.toString());
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ItemView(itemIndex: itemIndex),
                          ),
                        );
                      });
                    },
                    firstlineText: recomendedItem['name'],
                    secondLineText: recomendedItem['tagline'],
                    amount: recomendedItem['price'],
                    imagePath: recomendedItem['img'][0],
                    onTapAdd: () {
                      setState(() {
                        final cartProvider =
                            Provider.of<CartProvider>(context, listen: false);
                        final items =
                            Items(); // Create an instance of the Items class.

                        // // Get the selected item from your data using the itemIndex passed from the widget.
                        // final selectedItem =
                        //     items.itemList[widget.itemIndex];

                        // Convert the selected item to AddedItems.
                        final addedItem = AddedItems(
                          price: (recomendedItem['price'] as int).toDouble(),
                          name: recomendedItem['name'],
                          quantity: 1,
                          img: recomendedItem['img'][0],
                        );

                        // Convert the AddedItems object to a Map<String, dynamic>.
                        final addedItemMap = addedItem.toMap();

                        // Add it to the cart.
                        cartProvider.addToCart(addedItemMap);
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                itemCount: RecomendedItems().recomendedItem.length))
      ],
    );
  }
}
