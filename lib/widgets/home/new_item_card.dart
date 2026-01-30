import 'package:flutter/material.dart';
import 'package:ecommerceapp/models/item_model.dart';
import 'package:ecommerceapp/screens/product/product_details_screen.dart';

/// Card widget for displaying a new item product
/// Shows product image, title, and price
class NewItemCard extends StatelessWidget {
  final ItemModel item;

  const NewItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: SizedBox(
        width: 170,
        // ✅ width ok
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 1 / 1.2, // 🔥 image height control
                  child: Image.asset(item.image, fit: BoxFit.cover),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF202020),
                fontFamily: "raleway",
              ),
            ),

            const SizedBox(height: 6),

            Text(
              '\$${item.price}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "raleway",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
