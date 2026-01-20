import 'package:flutter/material.dart';

/// Minimal full-screen destination after onboarding.
/// Keeps UI stable and provides a real Scaffold-based screen for navigation.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF9FAFC),
      body: SafeArea(
        child: Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

