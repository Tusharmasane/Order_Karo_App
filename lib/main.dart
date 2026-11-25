import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:order_karo_app/core/theme/app_theme.dart';
import 'package:order_karo_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:order_karo_app/presentation/blocs/user/user_bloc.dart';
import 'package:order_karo_app/presentation/screens/auth/login_screen.dart';
import 'package:order_karo_app/presentation/screens/auth/register_screen.dart';
import 'package:order_karo_app/presentation/screens/home/home_screen.dart';
import 'package:order_karo_app/presentation/screens/restaurant/restaurant_details_screen.dart';
import 'package:order_karo_app/presentation/screens/cart/cart_screen.dart';
import 'package:order_karo_app/presentation/widgets/auth_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => AuthWrapper(child: HomeScreen()),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => RegisterScreen(),
        ),
        GoRoute(
          path: '/restaurant/:id',
          name: 'restaurant',
          builder: (context, state) {
            // Prefer reading from state.extra; fall back to an error screen
            final extra = state.extra;
            if (extra is Map<String, dynamic>) {
              return RestaurantDetailsScreen(restaurant: extra);
            }
            return const ErrorScreen(message: 'Restaurant data not found');
          },
        ),
        GoRoute(
          path: '/cart',
          name: 'cart',
          builder: (context, state) {
            final extra = state.extra;
            if (extra is Map<String, dynamic>) {
              final restaurant = extra['restaurant'];
              final cartItems = extra['cartItems'];
              if (restaurant is Map<String, dynamic> &&
                  cartItems is Map<String, int>) {
                return CartScreen(
                  restaurant: restaurant,
                  cartItems: cartItems,
                );
              }
            }
            return const ErrorScreen(message: 'Cart data not found');
          },
        ),
      ],
      errorBuilder: (context, state) =>
          ErrorScreen(message: 'Page not found: ${state.uri.path}'),
      // Optional auth redirect stub (kept null to avoid loops unless you enable it)
      redirect: (context, state) {
        // Example if you enable later:
        // final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
        // final loggingIn = state.matchedLocation == '/login' || state.matchedLocation == '/register';
        // if (!isLoggedIn && !loggingIn) return '/login';
        return null;
      },
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(preferences: prefs)),
        BlocProvider(create: (_) => UserBloc(preferences: prefs)),
      ],
      child: MaterialApp.router(
        title: 'OrderKaro',
        theme: AppTheme.theme,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final String message;
  const ErrorScreen({super.key, this.message = 'An error occurred'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error'), backgroundColor: Colors.red),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 80, color: Colors.red),
              const SizedBox(height: 20),
              const Text(
                'Oops!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/'),
                  icon: const Icon(Icons.home),
                  label: const Text('Go to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}