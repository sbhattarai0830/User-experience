import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PurpleButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const PurpleButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onTap,
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class StudyField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;
  final int lines;
  const StudyField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      maxLines: obscure ? 1 : lines,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: secondaryText),
      ),
    );
  }
}

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  const AppBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    const routes = ['/dashboard', '/timetable', '/todo', '/notes', '/profile'];
    return NavigationBar(
      selectedIndex: currentIndex,
      indicatorColor: lightPurple,
      onDestinationSelected: (index) {
        if (index != currentIndex) {
          Navigator.pushReplacementNamed(context, routes[index]);
        }
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.calendar_today_outlined), selectedIcon: Icon(Icons.calendar_today), label: 'Timetable'),
        NavigationDestination(icon: Icon(Icons.check_box_outlined), selectedIcon: Icon(Icons.check_box), label: 'To-Do'),
        NavigationDestination(icon: Icon(Icons.note_outlined), selectedIcon: Icon(Icons.note), label: 'Notes'),
        NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onAction;
  const SectionTitle({super.key, required this.title, this.action, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const Spacer(),
        if (action != null)
          TextButton(onPressed: onAction, child: Text(action!)),
      ],
    );
  }
}
