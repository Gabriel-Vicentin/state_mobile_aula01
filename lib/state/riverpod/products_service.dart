import 'dart:convert';

import 'package:http/http.dart' as http;

import 'product.dart';

class ProductsService {
  Future<List<Product>> fetchProducts() async {
    final uri = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar produtos.');
    }

    final List<dynamic> body = jsonDecode(response.body) as List<dynamic>;

    return body
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
