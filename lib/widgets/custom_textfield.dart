import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final Widget? prefix;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const CustomTextfield({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.prefix,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  @override
  Widget build(context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefix,

        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),

        suffixIcon: isPassword ? const Icon(Icons.visibility_off) : null,
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
