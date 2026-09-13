import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key});
  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Details'), actions: const [Icon(Icons.more_horiz)]),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CheckboxListTile(
            value: completed,
            onChanged: (v) => setState(() => completed = v ?? false),
            title: const Text('Complete Math Assignment ⭐', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const Divider(),
          const ListTile(leading: Icon(Icons.calendar_today), title: Text('Due Date'), subtitle: Text('25 May 2026')),
          const ListTile(leading: Icon(Icons.access_time), title: Text('Time'), subtitle: Text('11:59 PM')),
          const ListTile(leading: Icon(Icons.flag_outlined), title: Text('Priority'), subtitle: Text('🔴 High')),
          const SizedBox(height: 16),
          const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('Solve exercises from Chapter 4 and prepare summary notes.'),
          const SizedBox(height: 20),
          const Text('Subtasks', style: TextStyle(fontWeight: FontWeight.bold)),
          CheckboxListTile(value: false, onChanged: (v) {}, title: const Text('Read Chapter 4')),
          CheckboxListTile(value: false, onChanged: (v) {}, title: const Text('Solve Exercise 4.1')),
          CheckboxListTile(value: false, onChanged: (v) {}, title: const Text('Solve Exercise 4.2')),
          CheckboxListTile(value: false, onChanged: (v) {}, title: const Text('Prepare Summary')),
          const SizedBox(height: 20),
          PurpleButton(text: 'Mark as Completed', onTap: () => setState(() => completed = true)),
        ],
      ),
    );
  }
}
