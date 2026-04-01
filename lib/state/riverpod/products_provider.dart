import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product.dart';

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier()
      : super(
          const [
            Product(name: 'Notebook', price: 3500),
            Product(name: 'Mouse', price: 120),
            Product(name: 'Teclado', price: 250),
            Product(name: 'Monitor', price: 900),
          ],
        );

  void toggleFavorite(String productName) {
    state = [
      for (final product in state)
        if (product.name == productName)
          product.copyWith(favorite: !product.favorite)
        else
          product,
    ];
  }
}

final productsProvider =
    StateNotifierProvider<ProductsNotifier, List<Product>>(
  (ref) => ProductsNotifier(),
);