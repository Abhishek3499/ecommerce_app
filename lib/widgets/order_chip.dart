import 'package:flutter/material.dart';

class OrderChip extends StatelessWidget {
  final String title;
  final bool active;

  const OrderChip({required this.title, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFEAF0FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(title),
    );
  }
}
