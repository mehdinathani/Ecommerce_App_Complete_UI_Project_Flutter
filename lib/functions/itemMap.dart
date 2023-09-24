import 'package:uimehdinathani/components/Items.dart';
import 'package:uimehdinathani/widgets/functions.dart';

class itemDetail {
  static List getItemDetails(String itemName) {
    List ListedItems = [];
    for (int i = 0; i < Items().itemList.length; i++) {
      if (Items().itemList[i]['name'] == itemName) {
        ListedItems.add(Items().itemList[i]);
      }
    }
    return ListedItems;
  }
}
