import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_karo_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:order_karo_app/presentation/blocs/auth/auth_event.dart';
import 'package:order_karo_app/presentation/blocs/auth/auth_state.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is! Authenticated) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Information',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: const Text('Tushar Masane'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: const Text('9766161616'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account Actions',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: const Text('Edit Profile'),
                        onTap: () {
                          // TODO: Implement edit profile
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on_outlined),
                        title: const Text('Saved Addresses'),
                        onTap: () {
                          // TODO: Implement saved addresses
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  title: const Text('Logout'),
                                  content: const Text(
                                    'Are you sure you want to logout?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.read<AuthBloc>().add(
                                          LogoutRequested(),
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Logout',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
