import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            children: [
              const Spacer(),
              const Text('Welcome to\nStudyBuddy!', textAlign: TextAlign.center,
                style: TextStyle(fontSize: 31, fontWeight: FontWeight.w900)),
              const SizedBox(height: 12),
              const Text('Your all-in-one study planner,\nnotes, and productivity tracker.',
                textAlign: TextAlign.center, style: TextStyle(color: secondaryText)),
              const SizedBox(height: 28),
              Container(
                height: 245,
                decoration: BoxDecoration(color: lightPurple, borderRadius: BorderRadius.circular(28)),
                child: const Center(child: Icon(Icons.laptop_mac_rounded, size: 115, color: primaryPurple)),
              ),
              const SizedBox(height: 18),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, size: 9, color: primaryPurple),
                  SizedBox(width: 8),
                  Icon(Icons.circle, size: 9, color: Color(0xFFD8D4DF)),
                ],
              ),
              const Spacer(),
              PurpleButton(text: 'Get Started', onTap: () => Navigator.pushNamed(context, '/signup')),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: const Text('Already have an account? Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
