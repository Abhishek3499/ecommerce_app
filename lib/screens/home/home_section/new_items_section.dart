import 'package:flutter/material.dart';
import 'package:ecommerceapp/services/new_items_service.dart';
import 'package:ecommerceapp/widgets/home/new_item_card.dart';
import 'package:ecommerceapp/screens/new_items/new_items_screen.dart';

class NewItemsSection extends StatelessWidget {
  const NewItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = NewItemsService.items;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "New Items",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                fontFamily: "raleway",
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewItemsScreen(),
                  ),
                );
              },
              child: Row(
                children: const [
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF202020),
                      fontFamily: "raleway",
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

        /// 🔹 HORIZONTAL LIST
        SizedBox(
          height: 330,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (contex, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return NewItemCard(item: items[index]);
            },
          ),
        ),
      ],
    );
  }
}
