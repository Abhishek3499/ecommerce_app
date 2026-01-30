import 'package:ecommerceapp/services/popular_products_service.dart';
import 'package:ecommerceapp/widgets/home/popular_product_card.dart';
import 'package:ecommerceapp/screens/most_popular/most_popular_screen.dart';
import 'package:flutter/material.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = PopularProductsService.items;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Title Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Most Popular",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: "raleway",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MostPopularScreen(),
                  ),
                );
              },
              child: Row(
                children: const [
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontWeight: FontWeight.w700,
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

        // 🔹 Horizontal List
        SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return PopularProductCard(item: items[index]);
            },
          ),
        ),
      ],
    );
  }
}
