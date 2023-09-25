import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/components/fav_items.dart';
import 'package:uimehdinathani/widgets/favItems_tiles.dart';

class FavItemsBuilder extends StatefulWidget {
  const FavItemsBuilder({super.key});

  @override
  State<FavItemsBuilder> createState() => _FavItemsBuilderState();
}

class _FavItemsBuilderState extends State<FavItemsBuilder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteItemsProvider>(
        builder: (context, FavoriteItemsProvider, child) {
      final favItems = FavoriteItemsProvider.favoriteItems;
      if (FavoriteItemsProvider.favoriteItems.isEmpty) {
        //display a message
        return Center(
          child: Text("You havn't Favorite any Items Yet."),
        );
      } else {
        // display fav items

        return Container(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: favItems.length,
            itemBuilder: (context, index) {
              final item = FavoriteItemsProvider.favoriteItems[index];
              print(favItems);
              return FavItemsTiles(
                favItemIndex: index,
                itemName: item['name'],
                imagePath: item['img'][0],
                itemInitialPrice: item['price'],
              );
            },
          ),
        );
      }
    });
  }
}
