import 'package:ecommerceapp/services/categories_service.dart';
import 'package:ecommerceapp/widgets/home/categories.dart';
import 'package:ecommerceapp/screens/categories/categories_screen.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesService.categories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 TITLE ROW
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Categories",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: "raleway",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoriesScreen(),
                  ),
                );
              },
              child: Row(
                children: const [
                  Text(
                    "See All",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF202020),
                      fontFamily: "raleway",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 6),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0xFF004CFF),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // 🔹 GRID
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (_, index) {
            return CategoryCard(category: categories[index]);
          },
        ),
      ],
    );
  }
}
