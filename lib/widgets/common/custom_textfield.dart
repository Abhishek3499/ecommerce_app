import 'package:flutter/material.dart';

/// Custom text input field widget for the app
/// Supports password input with visibility toggle, custom keyboard types, and prefix icons
class CustomTextfield extends StatefulWidget {
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
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: widget.prefix,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
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
