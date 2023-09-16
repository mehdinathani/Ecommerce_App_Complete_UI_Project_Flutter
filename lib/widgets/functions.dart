import 'package:uimehdinathani/components/Items.dart';

Items items = Items();

int findItemIndexByName(String itemName) {
  for (int i = 0; i < items.itemList.length; i++) {
    if (items.itemList[i]['name'] == itemName) {
      return i;
    }
  }
  return -1; // Return -1 if the item is not found
}
