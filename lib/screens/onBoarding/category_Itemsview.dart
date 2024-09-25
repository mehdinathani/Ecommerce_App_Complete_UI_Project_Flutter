import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/components/Items.dart';
import 'package:uimehdinathani/components/cartItems.dart';
import 'package:uimehdinathani/components/globals.dart';
import 'package:uimehdinathani/screens/onBoarding/ItemPage.dart';
import 'package:uimehdinathani/widgets/cart_provider.dart';
import 'package:uimehdinathani/widgets/dealsItemCard.dart';
import 'package:uimehdinathani/widgets/functions.dart';
import 'package:uimehdinathani/widgets/topbarCategorypage.dart';

class CategoryWiseItemsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List categoryItems = getItemsByCategory(
        selectedCategory); // Use the selectedCategory from global.dart

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            TopBarCategory(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                  ),
                  itemCount: categoryItems.length,
                  itemBuilder: (context, index) {
                    final categoryItem = categoryItems[index];
                    return DealsIteamCard(
                      onTap: () {
                        itemIndex = findItemIndexByName(
                          categoryItem['name'],
                        );
                        print(itemIndex.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ItemView(itemIndex: itemIndex),
                          ),
                        );
                      },
                      textdata: categoryItem['name'],
                      amount: categoryItem['price'],
                      imagepath: categoryItem['img'][0],
                      onTapAdd: () {
                        final cartProvider =
                            Provider.of<CartProvider>(context, listen: false);

                        // Convert the selected item to AddedItems.
                        final addedItem = AddedItems(
                          price: (categoryItem['price'] as int).toDouble(),
                          name: categoryItem['name'],
                          quantity: 1,
                          img: categoryItem['img'][0],
                        );

                        // Convert the AddedItems object to a Map<String, dynamic>.
                        final addedItemMap = addedItem.toMap();

                        // Add it to the cart.
                        cartProvider.addToCart(addedItemMap);
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List getItemsByCategory(String category) {
    Items items = Items();
    return items.itemList
        .where((item) => item['category'] == category)
        .toList();
  }
}
