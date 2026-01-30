import 'dart:io';

import 'package:ecommerceapp/screens/auth/password_screen.dart';
import 'package:ecommerceapp/widgets/common/otp_background.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  final File? image;
  final String name;

  const OtpScreen({super.key, required this.name, this.image});

  @override
  State<OtpScreen> createState() => Otpscreen();
}

class Otpscreen extends State<OtpScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // 🔥 IMPORTANT FIX
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus(); // desktop keyboard focus
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                if (!_focusNode.hasFocus) {
                  _focusNode.requestFocus();
                }
              },
              child: Opacity(
                opacity: 0,
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  showCursor: false,
                  enableInteractiveSelection: false,
                  onChanged: (value) {
                    setState(() {});
                    if (value.length == 4) {
                      _focusNode.unfocus();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Passwordscreen(
                            name: widget.name,
                            image: widget.image,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),

          // Background
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
                  "Enter your OTP",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontFamily: 'NunitoSans',
                  ),
                ),
              ],
            ),
          ),

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
                    padding: EdgeInsets.zero,
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
      ),
    );
  }
}
