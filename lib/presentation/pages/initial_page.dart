import 'package:flutter/material.dart';

import '../../screens/product_list_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loja Virtual')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.storefront, size: 86),
              const SizedBox(height: 16),
              const Text(
                'Bem-vindo! Explore os produtos da Fake API.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 28),
              FilledButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProductListScreen()),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Ver Produtos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
