import 'dart:io';

import 'package:ecommerceapp/screens/auth/password.dart';
import 'package:ecommerceapp/widgets/background%20color/loginbg.dart';
import 'package:ecommerceapp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String email;
  final File? image;

  const LoginScreen({super.key, required this.email, this.image});
  String get name => email.split('@').first;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final bool isKeyboardOpen = bottomInset > 0;

    return Scaffold(
      // We handle insets manually to avoid random jumps
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9FAFC),
      body: Stack(
        children: [
          const Loginbg(), // 👈 background

          SafeArea(
            child: SingleChildScrollView(
              physics: isKeyboardOpen
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                20,
                20,
                20,
                20 + bottomInset,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 400),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'raleway',
                      color: Color(0xFF202020),
                    ),
                  ),

                  const SizedBox(height: 8),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: image != null ? FileImage(image!) : null,
                  ),
                  SizedBox(height: 12),

                  Text(
                    "Hello, $name!!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'raleway',
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    "Good to see you back! ❤️",
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'NunitoSans',
                      color: Color(0xFF202020),
                    ),
                  ),

                  const SizedBox(height: 32),

                  /// 👇 CUSTOM TEXTFIELD (reuse)
                  CustomTextfield(hint: "Email"),

                  const SizedBox(height: 27),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
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
                            builder: (_) => Password(name: name, image: image),
                          ),
                        );
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFF3F3F3),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
