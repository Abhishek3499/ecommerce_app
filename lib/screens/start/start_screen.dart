import 'package:ecommerceapp/screens/auth/create_account_screen.dart';
import 'package:ecommerceapp/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

/// Initial screen that users see when they first open the app
/// Shows app branding and buttons to either register or login
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.16),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/start_screen_logo/start_screen_logo.png",
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ],
              ),

              const SizedBox(height: 24),
              const Text(
                "Shoppe",
                style: TextStyle(
                  fontSize: 52,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Beautiful eCommerce UI Kit\nfor your online store",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  color: Color(0xFF202020),
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Spacer(flex: 1),
              SizedBox(
                width: double.infinity,
                height: 72,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004CFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Let's get started",
                    style: TextStyle(
                      color: Color(0xFFF3F3F3),
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'NunitoSans',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I already have an account",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(
                            email: "guest@shoppe.com",
                            image: null,
                          ),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundColor: Color(0xFF004CFF),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
