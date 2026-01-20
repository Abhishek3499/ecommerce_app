import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final ImageProvider image;

  const ProfileHeader({super.key, required this.name, required this.image});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 22, backgroundImage: image),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF004CFF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "My Activity",
            style: TextStyle(color: Color(0xFFF3F3F3)),
          ),
        ),
        const Spacer(),
        Icon(Icons.calendar_month),
        SizedBox(width: 12),
        Icon(Icons.notifications),
        SizedBox(width: 12),
        Icon(Icons.settings),
      ],
    );
  }
}
