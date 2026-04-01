import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(
            Icons.shopping_bag_outlined,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
        onTap: onTap,
      ),
    );
  }
}
