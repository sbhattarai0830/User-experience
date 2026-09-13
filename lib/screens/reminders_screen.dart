import 'package:flutter/material.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  Widget reminder(String day, String title, String time, Color color) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
      Card(child: ListTile(
        leading: Icon(Icons.notifications_active_outlined, color: color),
        title: Text(title),
        subtitle: Text(time),
        trailing: const Icon(Icons.notifications_none),
      )),
      const SizedBox(height: 10),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reminders')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'upcoming', label: Text('Upcoming')),
              ButtonSegment(value: 'completed', label: Text('Completed')),
            ],
            selected: const {'upcoming'},
            onSelectionChanged: (_) {},
          ),
          const SizedBox(height: 20),
          reminder('Today', 'Chemistry Study Session', '2:00 PM', Colors.orange),
          reminder('Tomorrow', 'Math Assignment Deadline', '11:59 PM', Colors.orange),
          reminder('24 May 2026', 'Physics Quiz', '10:00 AM', Colors.blue),
          reminder('26 May 2026', 'Biology Test', '9:00 AM', Colors.green),
        ],
      ),
    );
  }
}
