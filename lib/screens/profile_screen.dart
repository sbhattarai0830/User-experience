import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget item(BuildContext context, IconData icon, String title, {String? route}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: route == null ? () {} : () => Navigator.pushNamed(context, route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNav(currentIndex: 4),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 25),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [primaryPurple, Color(0xFF8D68EE)]),
              ),
              child: const Column(children: [
                CircleAvatar(radius: 47, backgroundColor: Colors.white, child: Icon(Icons.person, size: 58, color: primaryPurple)),
                SizedBox(height: 12),
                Text('Safal Bhattarai', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                Text('sample@example.com', style: TextStyle(color: Colors.white70)),
              ]),
            ),
            item(context, Icons.person_outline, 'Edit Profile'),
            item(context, Icons.favorite_border, 'Study Goals'),
            item(context, Icons.menu_book_outlined, 'Subjects'),
            item(context, Icons.settings_outlined, 'Settings', route: '/settings'),
            item(context, Icons.help_outline, 'Help & Support'),
            item(context, Icons.info_outline, 'About StudyBuddy'),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Log Out', style: TextStyle(color: Colors.red)),
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
            ),
          ],
        ),
      ),
    );
  }
}
