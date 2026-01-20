import 'dart:io';

import 'package:ecommerceapp/models/user_model.dart';
import 'package:ecommerceapp/screens/slider_screen/onboarding_screen.dart';
import 'package:ecommerceapp/widgets/background color/passwordbg.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  final File? image;
  final String name;

  const Password({super.key, required this.name, this.image});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
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
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {});
                    if (value.length == 4) {
                      _focusNode.unfocus(); // dismiss keyboard

                      final user = UserModel(
                        name: widget.name,
                        profileImage:
                            widget.image?.path ?? UserModel.defaultProfileImage,
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OnboardingScreen(user: user),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          // 🔵 Background bubbles
          Passwordbg(),

          // 👤 Avatar + Hello text
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

                const SizedBox(height: 27),

                Text(
                  "Hello, ${widget.name}!!",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'raleway',
                  ),
                ),

                const SizedBox(height: 45),

                const Text(
                  "Type your password",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontFamily: 'NunitoSans',
                  ),
                ),
              ],
            ),
          ),

          // 🔢 Password boxes
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  String dot = "";
                  if (index < _controller.text.length) {
                    dot = "●";
                  }

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 54,
                    height: 54,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      dot,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // ➡️ Not you?
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not you?",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'NunitoSans',
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 14,
                  backgroundColor: const Color(0xFF004CFF),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
