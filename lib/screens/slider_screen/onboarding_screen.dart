import 'package:ecommerceapp/models/user_model.dart';
import 'package:flutter/material.dart';

import 'hello_card.dart';
import 'ready_card.dart';

class OnboardingScreen extends StatefulWidget {
  final UserModel user;

  const OnboardingScreen({super.key, required this.user});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      body: Stack(
        children: [
          // 🔹 PageView
          PageView(
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              HelloCard(user: widget.user),
              ReadyCard(user: widget.user),
            ],
          ),

          // 🔹 DOTS INDICATOR
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                bool active = index == currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: active ? 15 : 13,
                  height: active ? 15 : 13,
                  decoration: BoxDecoration(
                    color: active
                        ? const Color(0xFF004CFF)
                        : Colors.blue.withOpacity(0.2),
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
