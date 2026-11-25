import 'package:flutter/material.dart';

import 'package:order_karo_app/presentation/screens/home/tabs/home_tab.dart';
import 'package:order_karo_app/presentation/screens/home/tabs/orders_tab.dart';
import 'package:order_karo_app/presentation/screens/home/tabs/profile_tab.dart';
import 'package:order_karo_app/presentation/screens/home/tabs/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final String _currentLocation = 'Nandanvan, Nagpur';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const HomeTab(),
      const OrdersTab(),
      const ProfileTab(),
      const SettingsTab(),
    ];

    return Scaffold(
      appBar:
          _currentIndex == 0
              ? AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.food_bank),
                  onPressed: () {
                    // TODO: Implement menu drawer
                  },
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DELIVER TO',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      _currentLocation,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      setState(() => _currentIndex = 2);
                    },
                  ),
                ],
              )
              : AppBar(
                title: Text(
                  _currentIndex == 1
                      ? 'My Orders'
                      : _currentIndex == 2
                      ? 'Profile'
                      : 'Settings',
                ),
              ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Orders',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
