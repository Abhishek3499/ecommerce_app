import 'package:ecommerceapp/widgets/home/just_for_you_item_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/services/just_for_you_service.dart';

class JustForYouSection extends StatelessWidget {
  const JustForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = JustForYouService.items;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 TITLE
        Row(
          children: const [
            Text(
              "Just For You ",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                fontFamily: "raleway",
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.star, color: Color(0xFF004CFF), size: 18),
          ],
        ),

        const SizedBox(height: 16),

        // 🔹 GRID (2 per row)
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
            childAspectRatio: 0.56,
          ),
          itemBuilder: (context, index) {
            return JustForYouItemCard(item: items[index]);
          },
        ),
      ],
    );
  }
}
