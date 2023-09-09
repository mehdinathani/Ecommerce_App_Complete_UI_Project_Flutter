import 'package:uimehdinathani/components/Items.dart';

List<String> getUniqueCategories() {
  Set<String> uniqueCategories = Set<String>();
  Items items = Items();

  // Iterate through itemList and add category names to the set
  for (var item in items.itemList) {
    if (item.containsKey('category')) {
      uniqueCategories.add(item['category']);
    }
  }

  // Convert the set to a list
  return uniqueCategories.toList();
}

getUniqueCategoryNames() {
  // Items items = Items(); // Create an instance of the Items class
  List<String> uniqueCategories = getUniqueCategories();
  // Now, uniqueCategories contains the unique category names.
  print(uniqueCategories);
}
