import 'package:ecommerceapp/models/popular_product_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/product/product_details_screen.dart';

class PopularProductCard extends StatelessWidget {
  final PopularProductModel item;

  const PopularProductCard({super.key, required this.item});

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
              price: item.price.toDouble(),
              tag: item.tag,
            ),
          ),
        );
      },
      child: SizedBox(
      width: 150,
      child: Container(
        height: 210, // 👈 YAHAN se card size control hoga
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
        child: Column(
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                item.image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 10),
            // PRICE + HEART + TAG
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      item.price.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF202020),
                        fontFamily: "raleway",
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.favorite,
                      color: Color(0xFF004CFF),
                      size: 18,
                    ),
                  ],
                ),

                Text(
                  item.tag,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF202020),
                    fontFamily: "raleway",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}
