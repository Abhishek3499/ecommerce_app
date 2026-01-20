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
    final Color background =
        active ? const Color(0xFF004CFF) : const Color(0xFFEAF0FF);
    final Color textColor =
        active ? const Color(0xFFF3F3F3) : const Color(0xFF202020);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          if (showDot) ...[
            const SizedBox(width: 6),
            const CircleAvatar(
              radius: 4,
              backgroundColor: Color(0xFF4CD964),
            ),
          ],
        ],
      ),
    );
  }
}
