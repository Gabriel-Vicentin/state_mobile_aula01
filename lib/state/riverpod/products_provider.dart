import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product.dart';
import 'products_service.dart';

final productsServiceProvider = Provider<ProductsService>((ref) {
  return ProductsService();
});

final productsProvider = FutureProvider<List<Product>>((ref) async {
  return ref.read(productsServiceProvider).fetchProducts();
});