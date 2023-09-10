import 'package:uimehdinathani/components/Items.dart';

List getItemsByCategory(String category) {
  Items items = Items();
  return items.itemList.where((item) => item['category'] == category).toList();
}

getItemsDealnew() {
  String desiredCategory = 'Fruits'; // Specify the category you want
  List itemsInCategory = getItemsByCategory(desiredCategory);

  // Now, itemsInCategory contains only items with the specified category.
  return itemsInCategory;
}

getItemsDeal({category}) {
  List itemsInCategory = getItemsByCategory(category);
  return itemsInCategory;
}

todaysDeals(String categoryName) {
  String textLine = "Deals on $categoryName";
  List dealsItems = getItemsByCategory(categoryName);
  return [textLine, dealsItems];
}
