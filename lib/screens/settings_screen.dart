import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text('Account', style: TextStyle(fontWeight: FontWeight.bold)),
          const Card(child: Column(children: [
            ListTile(title: Text('Change Password'), trailing: Icon(Icons.chevron_right)),
            Divider(height: 1),
            ListTile(title: Text('Email Preferences'), trailing: Icon(Icons.chevron_right)),
          ])),
          const SizedBox(height: 18),
          const Text('App Preferences', style: TextStyle(fontWeight: FontWeight.bold)),
          Card(child: Column(children: [
            SwitchListTile(title: const Text('Dark Mode'), value: darkMode, onChanged: (v) => setState(() => darkMode = v)),
            SwitchListTile(title: const Text('Notifications'), value: notifications, onChanged: (v) => setState(() => notifications = v)),
            const ListTile(title: Text('Reminder Time'), trailing: Text('15 minutes before')),
            const ListTile(title: Text('Language'), trailing: Text('English')),
          ])),
          const SizedBox(height: 18),
          const Text('About', style: TextStyle(fontWeight: FontWeight.bold)),
          const Card(child: Column(children: [
            ListTile(title: Text('Privacy Policy'), trailing: Icon(Icons.chevron_right)),
            Divider(height: 1),
            ListTile(title: Text('Terms & Conditions'), trailing: Icon(Icons.chevron_right)),
          ])),
          const SizedBox(height: 20),
          const Center(child: Text('Version 1.0.0')),
        ],
      ),
    );
  }
}
