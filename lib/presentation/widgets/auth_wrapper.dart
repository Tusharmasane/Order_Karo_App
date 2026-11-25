import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_karo_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:order_karo_app/presentation/blocs/auth/auth_state.dart';
import 'package:order_karo_app/presentation/screens/auth/login_screen.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;

  const AuthWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        // Show child (HomeScreen) if authenticated
        if (state is Authenticated) {
          return child;
        }

        // Show loading indicator while checking auth
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading...'),
                ],
              ),
            ),
          );
        }

        // Show login screen for unauthenticated users
        return const LoginScreen();
      },
    );
  }
}