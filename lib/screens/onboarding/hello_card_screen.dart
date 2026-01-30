import 'package:ecommerceapp/models/user_model.dart';
import 'package:flutter/material.dart';

/// Screen displayed during onboarding - first welcome card
/// Shows a hello message with product image and description
class HelloCardScreen extends StatelessWidget {
  final UserModel user;

  const HelloCardScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
      children: [
        // 🔵 TOP BLUE BACKGROUND
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 260,
            decoration: const BoxDecoration(
              color: Color(0xFF004CFF),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(160),
              ),
            ),
          ),
        ),

        // 📦 CENTER CARD
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🖼️ IMAGE
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  child: Image.asset(
                    "assets/hello_card/Image.png",
                    height: 390,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 24),

                // 📝 TITLE
                const Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'raleway',
                  ),
                ),

                const SizedBox(height: 12),

                // 📄 DESCRIPTION
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Lorem ipsum dolor sit amet,\n"
                    "consectetur adipiscing elit.\n"
                    "Sed non consectetur turpis.\n"
                    "Morbi eu eleifend lacus.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black54,
                      height: 1.5,
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ],
      ),
    );
  }
}
