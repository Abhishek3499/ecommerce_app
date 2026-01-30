import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String value;
  final bool isPassword;
  final bool isEditable;

  const ProfileTextField({
    super.key,

    required this.value,
    this.isPassword = false,
    this.isEditable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        if (isEditable)
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: isPassword ? '••••••••' : value,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontFamily: "raleway",
                color: Color(0xFF666666),
              ),
              filled: true,
              fillColor: Color(0xFFF1F4FE),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFFE5E5E5),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFFE5E5E5),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF004CFF),
                  width: 1,
                ),
              ),
            ),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: "raleway",
              color: Color(0xFF666666),
            ),
          )
        else
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
            ),
            child: Text(
              isPassword ? '••••••••' : value,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "raleway",
                color: Color(0xFF666666),
              ),
            ),
          ),
      ],
    );
  }
}
