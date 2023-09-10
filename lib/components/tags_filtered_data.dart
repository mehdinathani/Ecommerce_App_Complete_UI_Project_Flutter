import 'package:uimehdinathani/components/Items.dart';

List<String> getUniqueTags() {
  Set<String> uniqueTags = Set<String>();
  Items items = Items();

  // Iterate through itemList and add category names to the set
  for (var item in items.itemList) {
    if (item.containsKey('tagline')) {
      uniqueTags.add(item['tagline']);
    }
  }

  // Convert the set to a list
  return uniqueTags.toList();
}

getUniqueTagsNames() {
  // Items items = Items(); // Create an instance of the Items class
  List<String> uniqueTags = getUniqueTags();
  // Now, uniqueTags contains the unique category names.
  print(uniqueTags);
}

List getItemsByTags(String tagline) {
  Items items = Items();
  return items.itemList.where((item) => item['tagline'] == tagline).toList();
}

getFilterItems() {
  String desiredtagline = 'Fruits'; // Specify the category you want
  List itemsInCategory = getItemsByTags(desiredtagline);

  // Now, itemsInCategory contains only items with the specified category.
  return itemsInCategory;
}
