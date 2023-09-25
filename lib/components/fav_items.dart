import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoriteItemsProvider with ChangeNotifier {
  List<Map<String, dynamic>> _favoriteItems = [];

  FavoriteItemsProvider() {
    // Initialize favorite items from SharedPreferences when the provider is created.
    loadFavoriteItemsFromPrefs();
  }

  List<Map<String, dynamic>> get favoriteItems => _favoriteItems;

  Future<void> loadFavoriteItemsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favItemsData = prefs.getStringList('favorite_items');
    if (favItemsData != null) {
      _favoriteItems = favItemsData.map((item) {
        Map<String, dynamic> map = Map<String, dynamic>.from(json.decode(item));
        return map;
      }).toList();
      notifyListeners();
    }
  }

  Future<void> saveFavoriteItemsToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favItemsData =
        _favoriteItems.map((item) => json.encode(item)).toList();
    prefs.setStringList('favorite_items', favItemsData);
  }

  void toggleFavorite(Map<String, dynamic> item) {
    final isFavorite = _isItemInFavorites(item);

    if (isFavorite) {
      _favoriteItems.removeWhere((favItem) => favItem['name'] == item['name']);
    } else {
      _favoriteItems.add(item);
    }

    // Update the 'isFavourite' property of the provided 'item' to reflect the current state
    item['isFavourite'] = !isFavorite;

    saveFavoriteItemsToPrefs();
    notifyListeners();
  }

  bool _isItemInFavorites(Map<String, dynamic> item) {
    return _favoriteItems.any((favItem) => favItem['name'] == item['name']);
  }

  bool isItemInFavorites(Map<String, dynamic> item) {
    return _favoriteItems.any((favItem) => favItem['name'] == item['name']);
  }
}
