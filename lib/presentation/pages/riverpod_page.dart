
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../state/riverpod/products_provider.dart';

class RiverpodPage extends ConsumerWidget {
  const RiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.surface,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: products.length + 1,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  'Selecione seus produtos favoritos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              );
            }

            final product = products[index - 1];

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
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('R\$ ${product.price.toStringAsFixed(0)}'),
                trailing: IconButton(
                  key: ValueKey('favorite-${product.name}'),
                  onPressed: () => ref
                      .read(productsProvider.notifier)
                      .toggleFavorite(product.name),
                  icon: Icon(
                    product.favorite ? Icons.favorite : Icons.favorite_border,
                    color: product.favorite ? Colors.red : null,
                  ),
                  tooltip: product.favorite
                      ? 'Remover dos favoritos'
                      : 'Marcar como favorito',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
