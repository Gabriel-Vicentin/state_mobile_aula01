import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductService {
  ProductService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  final Uri _baseUri = Uri.parse('https://fakestoreapi.com/products');

  Future<List<Product>> fetchProducts() async {
    final response = await _client.get(_baseUri);

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar produtos.');
    }

    final List<dynamic> body = jsonDecode(response.body) as List<dynamic>;
    return body
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Product> addProduct(Product product) async {
    final response = await _client.post(
      _baseUri,
      headers: const {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Falha ao cadastrar produto.');
    }

    return Product.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<Product> updateProduct(Product product) async {
    final uri = Uri.parse('https://fakestoreapi.com/products/${product.id}');
    final response = await _client.put(
      uri,
      headers: const {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao atualizar produto.');
    }

    return Product.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<void> deleteProduct(String id) async {
    final uri = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await _client.delete(uri);

    if (response.statusCode != 200) {
      throw Exception('Falha ao remover produto.');
    }
  }
}
