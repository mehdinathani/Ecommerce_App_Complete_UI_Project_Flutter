import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/components/cartItems.dart';
import 'package:uimehdinathani/components/globals.dart';
import 'package:uimehdinathani/screens/onBoarding/ItemPage.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart';
import 'package:uimehdinathani/widgets/dealsItemCard.dart';
import 'package:uimehdinathani/widgets/functions.dart';

import '../../components/deals.dart';
import '../../components/recomendedItems.dart';
import '../../components/strings.dart';
import '../../styles/typo.dart';

class DealsView extends StatefulWidget {
  static RecomendedItems recomendedItems = RecomendedItems();
  static List fruitsDeal = getItemsDeal(category: 'Vegetable');

  // static List fruitsDeal = getItemsDeal(category: todaysDeals('Fruits'));

  const DealsView({super.key});

  @override
  State<DealsView> createState() => _DealsViewState();
}

class _DealsViewState extends State<DealsView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(left: 20),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            OnBoardingTextData.dealsin,
            style: recommendedStyle,
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.011,
      ),
      Container(
        padding: const EdgeInsets.all(20),
        height: 194,
        width: double.infinity,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final fruitsDeal = DealsView.fruitsDeal[index];
              return DealsIteamCard(
                onTap: () {
                  itemIndex = findItemIndexByName(
                    fruitsDeal['name'],
                  );
                  print(itemIndex.toString());
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemView(itemIndex: itemIndex),
                      ),
                    );
                  });
                },
                textdata: fruitsDeal['name'],
                amount: fruitsDeal['price'],
                imagepath: fruitsDeal['img'][0],
                onTapAdd: () {
                  setState(() {
                    final cartProvider =
                        Provider.of<CartProvider>(context, listen: false);
                    // final items =
                    //     Items(); // Create an instance of the Items class.

                    // Get the selected item from your data using the itemIndex passed from the widget.
                    // final selectedItem = items.itemList[widget.itemIndex];

                    // Convert the selected item to AddedItems.
                    final addedItem = AddedItems(
                      price: (fruitsDeal['price'] as int).toDouble(),
                      name: fruitsDeal['name'],
                      quantity: 1,
                      img: fruitsDeal['img'][0],
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
                  width: 25,
                ),
            itemCount: DealsView.fruitsDeal.length),
      )
    ]);
  }
}
