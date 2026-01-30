import 'package:ecommerceapp/models/user_model.dart';
import 'package:flutter/material.dart';

import 'hello_card_screen.dart';
import 'ready_card_screen.dart';

/// Main onboarding screen that shows welcome cards
/// Displays a PageView with multiple onboarding screens and pagination dots
class OnboardingScreen extends StatefulWidget {
  final UserModel user;

  const OnboardingScreen({super.key, required this.user});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      body: Stack(
        children: [
          // 🔹 PageView - Swipeable onboarding screens
          PageView(
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              HelloCardScreen(user: widget.user),
              ReadyCardScreen(user: widget.user),
            ],
          ),

          // 🔹 DOTS INDICATOR - Shows current page
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                bool isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: isActive ? 15 : 13,
                  height: isActive ? 15 : 13,
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFF004CFF)
                        : Colors.blue.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
