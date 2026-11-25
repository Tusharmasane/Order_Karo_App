// lib/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:order_karo_app/core/constants/app_constants.dart';

class CartScreen extends StatelessWidget {
  final Map<String, dynamic> restaurant;
  final Map<String, int> cartItems;

  const CartScreen({
    super.key,
    required this.restaurant,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    final items = AppConstants.menuItems
        .where((m) =>
    m['restaurantId'] == restaurant['id'] &&
        cartItems.containsKey(m['id']))
        .toList();

    final total = items.fold<double>(
      0.0,
          (sum, item) =>
      sum + (item['price'] as num).toDouble() * (cartItems[item['id']]!),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart · ${restaurant['name']}'),
      ),
      body: items.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length + 1,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == items.length) {
            return Card(
              child: ListTile(
                title: const Text('Total'),
                trailing: Text(
                  '₹${total.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            );
          }
          final it = items[index];
          final qty = cartItems[it['id']]!;
          return Card(
            child: ListTile(
              title: Text(it['name']),
              subtitle: Text('Qty: $qty'),
              trailing: Text(
                '₹${((it['price'] as num) * qty).toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: items.isEmpty
          ? null
          : SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Order placed successfully')),
              );
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.payment),
            label: const Text('Checkout'),
          ),
        ),
      ),
    );
  }
}