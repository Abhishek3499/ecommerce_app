import 'package:ecommerceapp/widgets/home/flash_sale_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/services/flash_sales_service.dart';

class FlashSaleSection extends StatelessWidget {
  const FlashSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = FlashSalesService.items;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Flash Sale",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                fontFamily: "raleway",
              ),
            ),
            Row(
              children: [
                const Icon(Icons.timer, color: Color(0xFF004CFF)),
                const SizedBox(width: 6),
                _timeBox("00"),
                const SizedBox(width: 4),
                _timeBox("36"),
                const SizedBox(width: 4),
                _timeBox("58"),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        // GRID
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return FlashSaleCardWidget(item: items[index]);
          },
        ),
      ],
    );
  }
}

Widget _timeBox(String value) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    decoration: BoxDecoration(
      color: Color(0xFFFFEBEB),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      value,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 17,
        fontFamily: "raleway",
      ),
    ),
  );
}
