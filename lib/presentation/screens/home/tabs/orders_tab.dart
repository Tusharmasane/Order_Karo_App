import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_karo_app/presentation/blocs/user/user_bloc.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.orders.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.receipt_long, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text('No orders yet'),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: state.orders.length,
          itemBuilder: (context, index) {
            final order = state.orders[index];
            final restaurant = order['restaurant'] as Map<String, dynamic>;
            final items = order['items'] as Map<String, int>;
            final total = order['total'] as double;
            final timestamp = order['timestamp'] as String;

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          restaurant['name'] as String,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '\$${total.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Items: ${items.values.reduce((a, b) => a + b)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ordered on: $timestamp',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    const LinearProgressIndicator(),
                    const SizedBox(height: 8),
                    Text(
                      'Estimated delivery: ${restaurant['deliveryTime']} minutes',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
