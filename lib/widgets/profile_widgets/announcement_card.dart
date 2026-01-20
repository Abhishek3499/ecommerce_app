import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF004CFF)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Announcement",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text("Lorem ipsum dolor sit amet..."),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: Color(0xFF004CFF),
            child: Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
