import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = [
      ['Mathematics Notes', '20 May 2026 • 12 Pages', Icons.menu_book, Colors.green],
      ['Physics Formulas', '18 May 2026 • 2 Pages', Icons.science, Colors.blue],
      ['Chemistry Reactions', '15 May 2026 • 10 Pages', Icons.biotech, Colors.orange],
      ['Biology Important Points', '10 May 2026 • 5 Pages', Icons.eco, Colors.teal],
      ['English Essay Tips', '8 May 2026 • 3 Pages', Icons.edit_note, primaryPurple],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('My Notes')),
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryPurple,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const StudyField(hint: 'Search notes...', icon: Icons.search),
          const SizedBox(height: 14),
          ...notes.map((note) {
            final color = note[3] as Color;
            return Card(
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, '/note-detail'),
                leading: CircleAvatar(
                  backgroundColor: color.withValues(alpha: .12),
                  child: Icon(note[2] as IconData, color: color),
                ),
                title: Text(note[0] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(note[1] as String),
                trailing: const Icon(Icons.chevron_right),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mathematics Notes'), actions: const [Icon(Icons.more_horiz)]),
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
          Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.edit_outlined), Text('Edit')]),
          Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.share_outlined), Text('Share')]),
          Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.delete_outline), Text('Delete')]),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(children: const [
              Text('Quadratic Equations', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
              SizedBox(height: 20),
              Text('Standard Form:', style: TextStyle(fontSize: 18, color: Colors.red)),
              SizedBox(height: 8),
              Text('ax² + bx + c = 0', style: TextStyle(fontSize: 21, color: Colors.blue)),
              SizedBox(height: 18),
              Text('Where a ≠ 0'),
              SizedBox(height: 20),
              Text('Solutions:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 8),
              Text('x = (-b ± √(b² - 4ac)) / 2a', style: TextStyle(fontSize: 18)),
              SizedBox(height: 22),
              Text('Discriminant (D):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 10),
              Text('D = b² - 4ac\n\nIf D > 0 → two real roots\nIf D = 0 → one real root\nIf D < 0 → two imaginary roots'),
            ]),
          ),
        ),
      ),
    );
  }
}
