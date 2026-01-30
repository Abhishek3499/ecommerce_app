import 'package:ecommerceapp/models/just_for_you_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/product/product_details_screen.dart';

/// Card widget for displaying a "Just For You" product recommendation
/// Shows product image, title, and price
class JustForYouItemCard extends StatelessWidget {
  final JustForYouModel item;

  const JustForYouItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Navigate to product details when card is tapped
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              image: item.image,
              title: item.title,
              price: item.price,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE CARD
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                item.image,
                height: 210,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            item.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontFamily: "raleway"),
          ),

          const SizedBox(height: 6),

          Text(
            "\$${item.price.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: "raleway",
            ),
          ),
        ],
      ),
    );
  }
}
