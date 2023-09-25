import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uimehdinathani/components/fav_items.dart';
import 'package:uimehdinathani/styles/colors.dart';

class FavItemsTiles extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final num itemInitialPrice;
  final int favItemIndex;

  const FavItemsTiles({
    Key? key,
    required this.imagePath,
    required this.itemName,
    required this.itemInitialPrice,
    required this.favItemIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(padding: EdgeInsets.only(left: 10, right: 10)),
        Container(
          width: mediaWidth * 1,
          height: mediaHeight * 0.1,
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imagePath,
                  width: mediaWidth * 0.2,
                  height: mediaHeight * 0.2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(itemName),
                    Text(
                      "\$ ${itemInitialPrice.toStringAsFixed(2)}",
                    ),
                  ],
                ),
                SizedBox(width: mediaWidth * 0.20),
                IconButton(
                  onPressed: () {
                    final favoriteProvider = Provider.of<FavoriteItemsProvider>(
                        context,
                        listen: false);
                    final selectedItem =
                        favoriteProvider.favoriteItems[favItemIndex];
                    favoriteProvider.toggleFavorite(selectedItem);

                    final snackBarText = selectedItem['isFavourite']
                        ? "Item added to favorites!"
                        : "Item removed from favorites!";

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(snackBarText),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  icon: Consumer<FavoriteItemsProvider>(
                      builder: (context, favoriteProvider, child) {
                    final selectedItem =
                        favoriteProvider.favoriteItems[favItemIndex];
                    final isFavorite =
                        favoriteProvider.isItemInFavorites(selectedItem);

                    return Icon(
                      selectedItem['isFavourite']
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: selectedItem['isFavourite']
                          ? Colors.red
                          : Colors.black,
                      size: 26,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        Divider(color: AppColors.black, height: 2),
      ],
    );
  }
}
