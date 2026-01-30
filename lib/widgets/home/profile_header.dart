import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/settings/settings_screen.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final ImageProvider image;

  const ProfileHeader({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(radius: 24, backgroundImage: image),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF004CFF),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Text(
            'My Activity',
            style: TextStyle(
              color: Color(0xFFF3F3F3),
              fontSize: 15,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        _CircleIconButton(icon: Icons.calendar_month_outlined),
        const SizedBox(width: 10),
        Stack(
          clipBehavior: Clip.none,
          children: const [
            _CircleIconButton(icon: Icons.notifications_none_rounded),
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Color(0xFF004CFF),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
          child: const _CircleIconButton(icon: Icons.settings_outlined),
        ),
      ],
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;

  const _CircleIconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, size: 20, color: const Color(0xFF202020)),
    );
  }
}
