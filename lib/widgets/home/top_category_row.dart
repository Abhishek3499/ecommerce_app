import 'package:ecommerceapp/models/top_category_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/product/product_details_screen.dart';

/// Horizontal row of top categories with circular images
/// Matches the same styling as the Recently Viewed section
class TopCategoryRow extends StatelessWidget {
  final List<TopCategoryModel> categories;

  const TopCategoryRow({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 HEADER
        const Text(
          "Top Categories",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            fontFamily: "raleway",
          ),
        ),

        const SizedBox(height: 16),

        // 🔹 HORIZONTAL LIST
        SizedBox(
          height: 70,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                // Navigate to product details when category is tapped
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        image: category.image,
                        title: 'Top Category ${index + 1}',
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage(category.image),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
