import 'package:flutter/material.dart';
import 'package:uimehdinathani/components/Category.dart';
import 'package:uimehdinathani/components/Items.dart';
import 'package:uimehdinathani/components/globals.dart';
import 'package:uimehdinathani/screens/onBoarding/ItemPage.dart';
import 'package:uimehdinathani/screens/onBoarding/category_Itemsview.dart';
import 'package:uimehdinathani/widgets/category_card.dart';
import 'package:uimehdinathani/widgets/topbarCategorypage.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<String> uniqueCategories = getUniqueCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const TopBarCategory(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            crossAxisCount: 2),
                    itemCount: uniqueCategories.length,
                    itemBuilder: (context, index) {
                      String categoryName = uniqueCategories[index];

                      Map<String, dynamic>? categoryItem =
                          findItemByCategory(categoryName);
                      if (categoryItem != null) {
                        return GestureDetector(
                          onTap: () {
                            // itemIndex = findItemIndexByName(
                            //   fruitsDeal['name'],
                            // );
                            // print(itemIndex.toString());
                            selectedCategory = categoryName;
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryWiseItemsView(),
                                ),
                              );
                            });
                          },
                          child: CategoryCard(
                              categoryName: categoryName,
                              tag: categoryItem['tagline'],
                              imagePath: categoryItem['img'][0]),
                        );
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Function to find an item that matches the given category
Map<String, dynamic>? findItemByCategory(String category) {
  for (var item in Items().itemList) {
    if (item['category'] == category) {
      return item;
    }
  }
  return null; // Return null if no matching item is found
}
