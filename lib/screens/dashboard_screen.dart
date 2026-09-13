import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget upcoming(BuildContext context, IconData icon, Color color, String title, String subtitle, String route) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, route),
      leading: CircleAvatar(backgroundColor: color.withValues(alpha: .12), child: Icon(icon, color: color)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  Widget quick(BuildContext context, IconData icon, String title, String route) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: lightPurple, borderRadius: BorderRadius.circular(13)),
              child: Icon(icon, color: primaryPurple),
            ),
            const SizedBox(height: 6),
            Text(title, style: const TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(children: [
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Hello, Safal 👋', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900)),
                Text("Let's make today productive!", style: TextStyle(color: secondaryText)),
              ])),
              IconButton(onPressed: () => Navigator.pushNamed(context, '/reminders'), icon: const Icon(Icons.notifications_none)),
            ]),
            const SizedBox(height: 18),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text("Today's Overview", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 18),
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    _Overview(icon: Icons.assignment_outlined, number: '3', label: 'Tasks Left', color: Colors.green),
                    _Overview(icon: Icons.school_outlined, number: '2', label: 'Classes', color: Colors.orange),
                    _Overview(icon: Icons.workspace_premium_outlined, number: '1', label: 'Exams', color: primaryPurple),
                  ]),
                ]),
              ),
            ),
            const SizedBox(height: 14),
            SectionTitle(title: 'Upcoming', action: 'View All', onAction: () => Navigator.pushNamed(context, '/todo')),
            Card(child: Column(children: [
              upcoming(context, Icons.menu_book, Colors.green, 'Mathematics Assignment', 'Due Tomorrow, 11:59 PM', '/task-detail'),
              const Divider(height: 1),
              upcoming(context, Icons.quiz_outlined, Colors.blue, 'Physics Quiz', '24 May 2026 • 10:00 AM', '/reminders'),
              const Divider(height: 1),
              upcoming(context, Icons.science_outlined, Colors.orange, 'Chemistry Study', 'Today • 2:00 PM', '/reminders'),
            ])),
            const SizedBox(height: 16),
            const SectionTitle(title: 'Quick Actions'),
            const SizedBox(height: 10),
            Row(children: [
              quick(context, Icons.calendar_month, 'Timetable', '/timetable'),
              quick(context, Icons.check_box_outlined, 'To-Do List', '/todo'),
              quick(context, Icons.note_alt_outlined, 'Notes', '/notes'),
              quick(context, Icons.add_box_outlined, 'Add Task', '/add-task'),
            ]),
          ],
        ),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final IconData icon;
  final String number, label;
  final Color color;
  const _Overview({required this.icon, required this.number, required this.label, required this.color});
  @override
  Widget build(BuildContext context) => Column(children: [
    Icon(icon, color: color),
    Text(number, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    Text(label, style: const TextStyle(fontSize: 11)),
  ]);
}
