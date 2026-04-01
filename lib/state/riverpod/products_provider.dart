import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product.dart';
import '../../services/product_service.dart';

final productsServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

final productsProvider = FutureProvider<List<Product>>((ref) async {
  return ref.read(productsServiceProvider).fetchProducts();
});