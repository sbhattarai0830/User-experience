import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Center(child: Text('Create Account', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900))),
          const SizedBox(height: 5),
          const Center(child: Text("Let's get you started", style: TextStyle(color: secondaryText))),
          const SizedBox(height: 30),
          const StudyField(hint: 'Full Name', icon: Icons.person_outline),
          const SizedBox(height: 12),
          const StudyField(hint: 'Email Address', icon: Icons.email_outlined),
          const SizedBox(height: 12),
          const StudyField(hint: 'Password', icon: Icons.lock_outline, obscure: true),
          const SizedBox(height: 12),
          const StudyField(hint: 'Confirm Password', icon: Icons.lock_outline, obscure: true),
          const SizedBox(height: 22),
          PurpleButton(text: 'Sign Up', onTap: () => Navigator.pushReplacementNamed(context, '/dashboard')),
          const SizedBox(height: 18),
          const Center(child: Text('or continue with')),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.g_mobiledata), label: const Text('Google'))),
            const SizedBox(width: 10),
            Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.apple), label: const Text('Apple'))),
          ]),
          const SizedBox(height: 16),
          TextButton(onPressed: () => Navigator.pushReplacementNamed(context, '/login'), child: const Text('Already have an account? Log in')),
        ],
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Center(child: Text('Welcome Back!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900))),
          const SizedBox(height: 5),
          const Center(child: Text('Log in to continue', style: TextStyle(color: secondaryText))),
          const SizedBox(height: 32),
          const StudyField(hint: 'Email Address', icon: Icons.email_outlined),
          const SizedBox(height: 12),
          const StudyField(hint: 'Password', icon: Icons.lock_outline, obscure: true),
          Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: const Text('Forgot Password?'))),
          PurpleButton(text: 'Log In', onTap: () => Navigator.pushReplacementNamed(context, '/dashboard')),
          const SizedBox(height: 18),
          const Center(child: Text('or continue with')),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.g_mobiledata), label: const Text('Google'))),
            const SizedBox(width: 10),
            Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.apple), label: const Text('Apple'))),
          ]),
          const SizedBox(height: 16),
          TextButton(onPressed: () => Navigator.pushReplacementNamed(context, '/signup'), child: const Text("Don't have an account? Sign up")),
        ],
      ),
    );
  }
}
