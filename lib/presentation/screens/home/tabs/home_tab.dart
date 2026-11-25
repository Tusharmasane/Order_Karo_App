import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:order_karo_app/core/constants/app_constants.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = AppConstants.categories;
    final restaurants = AppConstants.restaurants;

    return SingleChildScrollView(
      child: Column(
        children: [
          // ✅ CATEGORIES
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Add category tap filter if needed
                        },
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            category["image"] as String,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        category["name"] as String,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 15),

          // ✅ RESTAURANTS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Restaurants in Nagpur",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),

          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];

              return GestureDetector(
                onTap: () {
                  context.push(
                    "/restaurant/${restaurant["id"]}",
                    extra: restaurant,
                  );
                },
                child: Card(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(8)),
                        child: Image.network(
                          restaurant["image"] as String,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              restaurant["name"] as String,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 18),
                                Text(
                                  " ${restaurant["rating"]}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              restaurant["address"] as String,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Delivery: ${restaurant["deliveryTime"]} min",
                              style: Theme.of(context).textTheme.bodySmall,
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
    );
  }
}