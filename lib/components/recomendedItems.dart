import 'package:uimehdinathani/components/Items.dart';

class RecomendedItems {
  List recomendedItem = [
    Items().itemList[0],
    Items().itemList[2],
    Items().itemList[4],
    Items().itemList[6],
    Items().itemList[8],
  ];

  addtoRecomendation(Map map) {
    recomendedItem.add(map);
  }
}
