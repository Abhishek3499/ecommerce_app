import 'package:flutter/material.dart';

/// Placeholder Product Details Screen
/// Shows product information when user taps on any product card
class ProductDetailsScreen extends StatelessWidget {
  final String? image;
  final String? title;
  final double? price;
  final String? tag;
  final String? discount;

  const ProductDetailsScreen({
    super.key,
    this.image,
    this.title,
    this.price,
    this.tag,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // Product Image
            if (image != null)
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),

            const SizedBox(height: 20),

            // Product Title
            if (title != null)
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "raleway",
                ),
              ),

            const SizedBox(height: 10),

            // Price and Tag/Discount
            Row(
              children: [
                if (price != null)
                  Text(
                    '\$${price!.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004CFF),
                      fontFamily: "raleway",
                    ),
                  ),
                if (tag != null) ...[
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF004CFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "raleway",
                      ),
                    ),
                  ),
                ],
                if (discount != null) ...[
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '-$discount%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "raleway",
                      ),
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 30),

            // Placeholder for more product details
            const Text(
              'Product Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "raleway",
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'This is a placeholder screen for product details. '
              'In a real app, this would show complete product information, '
              'reviews, sizing options, and add to cart functionality.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: "raleway",
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
