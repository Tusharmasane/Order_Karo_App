
class AppConstants {
  /// ✅ CATEGORIES LIST
  static const List<Map<String, dynamic>> categories = [
    {
      'id': 'cat_veg',
      'name': 'Veg',
      'image':
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=900&q=80&auto=format&fit=crop',
    },
    {
      'id': 'cat_nonveg',
      'name': 'Non-Veg',
      'image':
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=900&q=80&auto=format&fit=crop',
    },
    {
      'id': 'cat_breakfast',
      'name': 'Breakfast',
      'image':
      'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=900&q=80&auto=format&fit=crop',
    },
    {
      'id': 'cat_desserts',
      'name': 'Desserts',
      'image':
      'https://images.unsplash.com/photo-1519861531473-9200262188bf?w=900&q=80&auto=format&fit=crop',
    },
    {
      'id': 'cat_biryani',
      'name': 'Biryani',
      'image':
      'https://images.unsplash.com/photo-1599487488170-92fa8f7f6ee5?w=900&q=80&auto=format&fit=crop',
    },
  ];

  /// ✅ RESTAURANTS LIST (Nagpur, Maharashtra)
  static const List<Map<String, dynamic>> restaurants = [
    {
      'id': 'res_1',
      'name': 'Barbecue Nation',
      'image':
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=900&q=80',
      'rating': 4.4,
      'deliveryTime': 35,
      'address': 'Dharampeth, Nagpur',
      'contact': '+91-9876543210',
    },
    {
      'id': 'res_2',
      'name': 'Haldiram’s',
      'image':
      'https://images.unsplash.com/photo-1519861531473-9200262188bf?w=900&q=80',
      'rating': 4.6,
      'deliveryTime': 25,
      'address': 'Sitabuldi, Nagpur',
      'contact': '+91-9876543211',
    },
    {
      'id': 'res_3',
      'name': 'Zuree Urban Kitchen',
      'image':
      'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=900&q=80',
      'rating': 4.5,
      'deliveryTime': 30,
      'address': 'Civil Lines, Nagpur',
      'contact': '+91-9876543212',
    },
    {
      'id': 'res_4',
      'name': 'Banzai Sushi & Asian',
      'image':
      'https://images.unsplash.com/photo-1516685018646-549c17b70702?w=900&q=80',
      'rating': 4.3,
      'deliveryTime': 40,
      'address': 'Ramdaspeth, Nagpur',
      'contact': '+91-9876543213',
    },
    {
      'id': 'res_5',
      'name': 'Biryani House',
      'image':
      'https://images.unsplash.com/photo-1599487488170-92fa8f7f6ee5?w=900&q=80',
      'rating': 4.1,
      'deliveryTime': 28,
      'address': 'Sadar, Nagpur',
      'contact': '+91-9876543214',
    },
  ];

  /// ✅ MENU ITEMS
  static const List<Map<String, dynamic>> menuItems = [
    {
      'id': 'item_1',
      'restaurantId': 'res_1',
      'name': 'Chicken BBQ Platter',
      'price': 399,
      'description': 'Grilled chicken, veggies & sauces',
      'image':
      'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=900&q=80',
    },
    {
      'id': 'item_2',
      'restaurantId': 'res_1',
      'name': 'Paneer Tikka',
      'price': 299,
      'description': 'Spicy grilled paneer',
      'image':
      'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=900&q=80',
    },
    {
      'id': 'item_3',
      'restaurantId': 'res_2',
      'name': 'Raj Kachori',
      'price': 149,
      'description': 'Crispy, stuffed & tangy snack',
      'image':
      'https://images.unsplash.com/photo-1605478031197-7b6cbfbac12f?w=900&q=80',
    },
    {
      'id': 'item_4',
      'restaurantId': 'res_2',
      'name': 'Chole Bhature',
      'price': 169,
      'description': 'Perfect Punjabi meal',
      'image':
      'https://images.unsplash.com/photo-1576402187878-974f70d21afa?w=900&q=80',
    },
    {
      'id': 'item_5',
      'restaurantId': 'res_3',
      'name': 'Italian Pasta',
      'price': 249,
      'description': 'Creamy pasta with herbs',
      'image':
      'https://images.unsplash.com/photo-1525755662778-989d0524087e?w=900&q=80',
    },
    {
      'id': 'item_6',
      'restaurantId': 'res_3',
      'name': 'Pizza Margherita',
      'price': 299,
      'description': 'Cheese, basil & tomato',
      'image':
      'https://images.unsplash.com/photo-1548365328-860a5275a458?w=900&q=80',
    },
    {
      'id': 'item_7',
      'restaurantId': 'res_4',
      'name': 'Sushi Platter',
      'price': 499,
      'description': 'Assorted Japanese sushi',
      'image':
      'https://images.unsplash.com/photo-1516685018646-549c17b70702?w=900&q=80',
    },
    {
      'id': 'item_8',
      'restaurantId': 'res_5',
      'name': 'Hyderabadi Biryani',
      'price': 229,
      'description': 'Aromatic & flavourful biryani',
      'image':
      'https://images.unsplash.com/photo-1599487488170-92fa8f7f6ee5?w=900&q=80',
    },
    {
      'id': 'item_9',
      'restaurantId': 'res_5',
      'name': 'Egg Biryani',
      'price': 199,
      'description': 'Rich biryani with eggs',
      'image':
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?w=900&q=80',
    },
  ];
}