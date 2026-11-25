import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:order_karo_app/core/constants/app_constants.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> restaurant;

  const RestaurantDetailsScreen({super.key, required this.restaurant});

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  final Map<String, int> _cartItems = {};

  void _addToCart(Map<String, dynamic> menuItem) {
    setState(() {
      final id = menuItem['id'] as String;
      _cartItems[id] = (_cartItems[id] ?? 0) + 1;
    });
    _showCartSnackbar();
  }

  void _removeFromCart(Map<String, dynamic> menuItem) {
    setState(() {
      final id = menuItem['id'] as String;
      final currentQuantity = _cartItems[id] ?? 0;
      if (currentQuantity > 1) {
        _cartItems[id] = currentQuantity - 1;
      } else {
        _cartItems.remove(id);
      }
    });
  }

  void _showCartSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Item added to cart'),
        action: SnackBarAction(
          label: 'VIEW CART',
          onPressed: () {
            context.push(
              '/cart',
              extra: {'restaurant': widget.restaurant, 'cartItems': _cartItems},
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Ensure 'image' exists and is String
    final headerImage = (widget.restaurant['image'] ?? '') as String;

    final restaurantMenuItems = AppConstants.menuItems
        .where((item) => item['restaurantId'] == widget.restaurant['id'])
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant['name'] as String? ?? 'Restaurant'),
        actions: [
          if (_cartItems.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                context.push(
                  '/cart',
                  extra: {
                    'restaurant': widget.restaurant,
                    'cartItems': _cartItems,
                  },
                );
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== HEADER IMAGE with placeholder/error ======
            CachedNetworkImage(
              imageUrl: headerImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (_, __) => const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (_, __, ___) => const SizedBox(
                height: 200,
                child: Center(child: Icon(Icons.broken_image, size: 48)),
              ),
            ),

            // ====== HEADER DETAILS ======
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          (widget.restaurant['name'] as String?) ?? 'Restaurant',
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          Text(' ${widget.restaurant['rating'] ?? '-'}'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    (widget.restaurant['address'] as String?) ?? 'Nagpur',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Delivery time: ${widget.restaurant['deliveryTime'] ?? '-'} min',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Contact: ${widget.restaurant['contact'] ?? '-'}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            const Divider(),

            // ====== MENU TITLE ======
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Menu',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            // ====== MENU LIST ======
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: restaurantMenuItems.length,
              itemBuilder: (context, index) {
                final menuItem = restaurantMenuItems[index];
                final itemQuantity = _cartItems[menuItem['id'] as String] ?? 0;
                final imgUrl = (menuItem['image'] ?? '') as String;

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ====== ITEM IMAGE with placeholder/error ======
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: imgUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            placeholder: (_, __) => const SizedBox(
                              width: 80,
                              height: 80,
                              child: Center(
                                  child:
                                  CircularProgressIndicator(strokeWidth: 2)),
                            ),
                            errorWidget: (_, __, ___) => const SizedBox(
                              width: 80,
                              height: 80,
                              child:
                              Center(child: Icon(Icons.image_not_supported)),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // ====== ITEM DETAILS ======
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (menuItem['name'] as String?) ?? 'Item',
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                (menuItem['description'] as String?) ??
                                    'Delicious dish',
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '₹${((menuItem['price'] as num?) ?? 0).toStringAsFixed(0)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium,
                                  ),
                                  Row(
                                    children: [
                                      if (itemQuantity > 0) ...[
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () =>
                                              _removeFromCart(menuItem),
                                        ),
                                        Text(
                                          itemQuantity.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ],
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () => _addToCart(menuItem),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}