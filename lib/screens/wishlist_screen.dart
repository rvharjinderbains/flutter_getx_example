import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_app/states/product_controller.dart';

class WishListScreen extends StatelessWidget {
  final ProductController _productController = Get.find<ProductController>();

  WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish List"),
      ),
      body: Obx(() => _productController.wishListItems.isEmpty
          ? const Center(
              child: Text("Empty list"),
            )
          : ListView.builder(
              itemCount: _productController.wishListItems.length,
              itemBuilder: (context, index) {
                final item = _productController.wishListItems[index];
                return Card(
                  key: ValueKey(item.id!),
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    title: Text(item.name!),
                    trailing: IconButton(
                        onPressed: (() {
                          item.inWishList!.value = false;
                          _productController.removeItem(item.id!);
                        }),
                        icon: const Icon(Icons.close)),
                  ),
                );
              },
            )),
    );
  }
}
