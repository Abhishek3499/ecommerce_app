import 'package:flutter/material.dart';

class OrderChip extends StatelessWidget {
  final String title;
  final bool active;
  final bool showDot;

  const OrderChip({
    super.key,
    required this.title,
    this.active = false,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFE5EBFC),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w600,
              color: Color(0xFF004CFF),
            ),
          ),
        ),

        // 🟢 Green dot (upar corner me)
        if (showDot)
          const Positioned(
            top: -2,
            right: 3,
            child: CircleAvatar(radius: 7, backgroundColor: Color(0xFF4CD964)),
          ),
      ],
    );
  }
}
