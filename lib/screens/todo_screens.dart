import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Map<String, dynamic>> tasks = [
    {'title': 'Complete Math Assignment', 'date': 'Due Tomorrow', 'done': false},
    {'title': 'Revise Physics Notes', 'date': 'Today', 'done': false},
    {'title': 'Chemistry Quiz Preparation', 'date': '24 May 2026', 'done': false},
    {'title': 'English Essay', 'date': '25 May 2026', 'done': false},
    {'title': 'Read Chapter 5 - Biology', 'date': '26 May 2026', 'done': false},
  ];

  Widget group(String title, List<int> indexes) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      Card(child: Column(children: indexes.map((i) => CheckboxListTile(
        value: tasks[i]['done'],
        onChanged: (v) => setState(() => tasks[i]['done'] = v ?? false),
        title: Text(tasks[i]['title']),
        subtitle: Text(tasks[i]['date']),
      )).toList())),
      const SizedBox(height: 12),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryPurple,
        foregroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, '/add-task'),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'all', label: Text('All')),
              ButtonSegment(value: 'pending', label: Text('Pending')),
              ButtonSegment(value: 'completed', label: Text('Completed')),
            ],
            selected: const {'pending'},
            onSelectionChanged: (_) {},
          ),
          const SizedBox(height: 20),
          group('Today', [0, 1]),
          group('Tomorrow', [2]),
          group('This Week', [3, 4]),
        ],
      ),
    );
  }
}

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Task')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Task Title', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const StudyField(hint: 'Enter task title', icon: Icons.edit_outlined),
          const SizedBox(height: 16),
          const Text('Description (Optional)', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const StudyField(hint: 'Add more details', icon: Icons.notes_outlined, lines: 4),
          const SizedBox(height: 16),
          const Text('Due Date', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const StudyField(hint: '24 May 2026', icon: Icons.calendar_today_outlined),
          const SizedBox(height: 16),
          const Text('Time', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const StudyField(hint: '10:00 AM', icon: Icons.access_time),
          const SizedBox(height: 16),
          const Text('Priority', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Wrap(spacing: 10, children: [
            Chip(label: Text('🟢 Low')),
            Chip(label: Text('🟠 Medium')),
            Chip(label: Text('🔴 High')),
          ]),
          const SizedBox(height: 26),
          PurpleButton(text: 'Save Task', onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
