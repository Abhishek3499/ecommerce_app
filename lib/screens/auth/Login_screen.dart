import 'dart:io';

import 'package:ecommerceapp/screens/auth/otp_screen.dart';
import 'package:ecommerceapp/widgets/common/login_background.dart';
import 'package:ecommerceapp/widgets/common/custom_textfield.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String email;
  final File? image;

  const LoginScreen({super.key, required this.email, this.image});

  String get name => email.split('@').first;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const LoginBackground(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, bottomInset),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 280),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'raleway',
                      color: const Color(0xFF202020),
                    ),
                  ),
                  const SizedBox(height: 8),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: image != null ? FileImage(image!) : null,
                  ),
                  const SizedBox(height: 12),
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
                      color: const Color(0xFF202020),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const CustomTextfield(hint: "Email"),
                  const SizedBox(height: 22),
                  const Spacer(),
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
                            builder: (_) => OtpScreen(name: name, image: image),
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
                  const SizedBox(height: 10),
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
