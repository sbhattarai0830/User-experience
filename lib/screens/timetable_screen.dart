import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  Widget item(String time, String title, String subtitle, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(children: [
          SizedBox(width: 76, child: Text(time, style: const TextStyle(fontSize: 12))),
          Container(width: 4, height: 42, color: color),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(subtitle, style: const TextStyle(fontSize: 12, color: secondaryText)),
          ])),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timetable')),
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryPurple,
        foregroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, '/add-task'),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Center(child: Text('24 – 30 May 2026', style: TextStyle(fontWeight: FontWeight.bold))),
          const SizedBox(height: 16),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _Date('Sun', '24', true), _Date('Mon', '25', false), _Date('Tue', '26', false),
            _Date('Wed', '27', false), _Date('Thu', '28', false), _Date('Fri', '29', false), _Date('Sat', '30', false),
          ]),
          const SizedBox(height: 18),
          item('09:00 AM', 'Mathematics', 'Calculus & Functions', primaryPurple),
          item('11:00 AM', 'Physics', 'Mechanics', Colors.blue),
          item('01:00 PM', 'Lunch Break', '', Colors.grey),
          item('02:00 PM', 'Chemistry', 'Organic Reactions', Colors.deepOrange),
          item('04:00 PM', 'English', 'Essay Writing', Colors.green),
        ],
      ),
    );
  }
}

class _Date extends StatelessWidget {
  final String day, date;
  final bool active;
  const _Date(this.day, this.date, this.active);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
    decoration: BoxDecoration(color: active ? primaryPurple : Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Column(children: [
      Text(day, style: TextStyle(fontSize: 10, color: active ? Colors.white : darkText)),
      Text(date, style: TextStyle(fontWeight: FontWeight.bold, color: active ? Colors.white : darkText)),
    ]),
  );
}
