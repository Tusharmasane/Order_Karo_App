import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool _notificationsEnabled = true;
  bool _locationEnabled = true;
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'App Settings',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SwitchListTile(
                title: const Text('Push Notifications'),
                subtitle: const Text('Receive order updates and offers'),
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() => _notificationsEnabled = value);
                },
              ),
              SwitchListTile(
                title: const Text('Location Services'),
                subtitle: const Text('Allow access to your location'),
                value: _locationEnabled,
                onChanged: (value) {
                  setState(() => _locationEnabled = value);
                },
              ),
              ListTile(
                title: const Text('Theme'),
                subtitle: Text(_themeMode.name.toUpperCase()),
                trailing: DropdownButton<ThemeMode>(
                  value: _themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _themeMode = value);
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text('System'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('Light'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Dark'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'About',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ListTile(
                title: const Text('Version'),
                subtitle: const Text('1.0.0'),
              ),
              ListTile(
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Open terms of service
                },
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Open privacy policy
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
