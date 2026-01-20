import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/home_screen.dart';

class ReadyCard extends StatelessWidget {
  const ReadyCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🔵 TOP BLUE BACKGROUND
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 265,
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
                  color: Colors.black.withOpacity(0.12),
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
                    "assets/hello_card/Placeholder_01.png",
                    height: 390,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 30),

                // 📝 TITLE
                const Text(
                  "Ready?",
                  style: TextStyle(
                    fontSize: 28,
                    color: Color(0xFF202020),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'raleway',
                  ),
                ),

                const SizedBox(height: 12),

                // 📄 DESCRIPTION
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.",
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
                const SizedBox(height: 24),
                SizedBox(
                  width: 220,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF004CFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    },
                    child: const Text(
                      "Let's Start",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFFF3F3F3),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'nunitosans',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),
              ],
            ),
          ),
        ),

        // ⚪ PAGE INDICATOR DOTS
      ],
    );
  }
}
