import 'dart:math';

import 'package:get/state_manager.dart';
import 'package:my_getx_app/models/product_item_model.dart';

class ProductController extends GetxController {
  // All products
  // In production, these things usually be loaded them from API or database or something like that
  final RxList<ProductItemModel> _items = List.generate(
      100,
      (index) => ProductItemModel(
          id: index,
          name: 'Product $index',
          price: Random().nextDouble() * 100,
          inWishList: false.obs)).obs;

  // Use this to retrieve all products
  List<ProductItemModel> get items {
    return [..._items];
  }

  // This will return the products that were added to wish list
  List<ProductItemModel> get wishListItems {
    return _items.where((item) => item.inWishList!.value == true).toList();
    return _items.toList();
  }

  // Add an item to the wish list
  void addItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList!.value = true;
    print("item added in wish list");
  }

  // Remove an item from the wish list
  void removeItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList!.value = false;
    print("item removed from wishlist");
  }
}
