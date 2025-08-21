//final left_drawer_screen.dart
import 'package:flutter/material.dart';

class LeftDrawerScreen extends StatelessWidget {
  const LeftDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Profile Section
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              accountName: const Text('Swati.Personal'),
              accountEmail: const Text('swati@cstech.in'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/gir_avatar.jpg'),
              ),
            ),

            // First part options
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.play_circle_fill_outlined),
                    title: const Text('Getting Started'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.sync),
                    title: const Text('Sync Data'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.emoji_events),
                    title: const Text('Gamification'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.send),
                    title: const Text('Send Logs'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: const Text('Help?'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.cancel),
                    title: const Text('Cancel Subscription'),
                    onTap: () {},
                  ),

                  // Divider for App Info section
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Text(
                      'App Info',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  // App Info options without icons
                  ListTile(
                    title: const Text('About Us'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Privacy Policy'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Version 1.01.52'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Share App'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Bottom bar with 5 icons
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.home),
                  Icon(Icons.person),
                  Icon(Icons.play_circle_fill, color: Colors.blue),
                  Icon(Icons.phone),
                  Icon(Icons.calendar_today),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

