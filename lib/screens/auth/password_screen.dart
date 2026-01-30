import 'dart:io';

import 'package:ecommerceapp/models/user_model.dart';

import 'package:ecommerceapp/screens/onboarding/onboarding_screen.dart';
import 'package:ecommerceapp/widgets/common/otp_background.dart';
import 'package:flutter/material.dart';

class Passwordscreen extends StatefulWidget {
  final File? image;
  final String name;

  const Passwordscreen({super.key, required this.name, this.image});

  @override
  State<Passwordscreen> createState() => _PasswordscreenState();
}

class _PasswordscreenState extends State<Passwordscreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(_focusNode);
              },
              child: Opacity(
                opacity: 0,
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,

                  maxLength: 6,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {});
                    if (value.length == 6) {
                      _focusNode.unfocus();
                      final user = UserModel(
                        name: widget.name,
                        profileImage:
                            widget.image?.path ?? UserModel.defaultProfileImage,
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OnboardingScreen(user: user),
                        ),
                        (route) => false,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          const OtpBackground(),
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 46,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 42,
                    backgroundImage: widget.image != null
                        ? FileImage(widget.image!)
                        : null,
                  ),
                ),
                const SizedBox(height: 65),
                Text(
                  "Hello, ${widget.name}!!",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'raleway',
                  ),
                ),
                const SizedBox(height: 35),

                const Text(
                  "Type your password ",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black54,
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                final bool filled = index < _controller.text.length;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: filled
                        ? const Color(0xFF004CFF) // 🔵 blue dot
                        : const Color(0xFFDDE5FF),
                  ),
                );
              }),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
