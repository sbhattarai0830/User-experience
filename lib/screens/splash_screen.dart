import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (mounted) Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFCFBFF), Color(0xFFEAE3FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  height: 118,
                  width: 118,
                  decoration: const BoxDecoration(color: lightPurple, shape: BoxShape.circle),
                  child: const Icon(Icons.school_rounded, size: 64, color: primaryPurple),
                ),
                const SizedBox(height: 22),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
                    children: [
                      TextSpan(text: 'Study', style: TextStyle(color: darkText)),
                      TextSpan(text: 'Buddy', style: TextStyle(color: primaryPurple)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Plan Smarter,\nStudy Better, Achieve More.', textAlign: TextAlign.center),
                const Spacer(),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .65),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Icon(Icons.menu_book_rounded, size: 100, color: primaryPurple),
                  ),
                ),
                const SizedBox(height: 28),
                const SizedBox(width: 70, child: LinearProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
