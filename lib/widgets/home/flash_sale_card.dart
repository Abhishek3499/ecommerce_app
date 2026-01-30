import 'package:flutter/material.dart';
import 'package:ecommerceapp/models/flash_sale_model.dart';
import 'package:ecommerceapp/screens/product/product_details_screen.dart';

/// Card widget for displaying a flash sale product
/// Shows product image with discount badge overlay
class FlashSaleCardWidget extends StatelessWidget {
  final FlashSaleModel item;

  const FlashSaleCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Navigate to product details when flash sale card is tapped
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              image: item.image,
              discount: item.discount.toString(),
            ),
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          Positioned(
            top: -6,
            right: -6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF81140), Color(0xFFFF5790)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "-${item.discount}%",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  fontFamily: "raleway",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
