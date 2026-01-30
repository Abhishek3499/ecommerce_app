import 'package:flutter/material.dart';
import 'package:ecommerceapp/services/just_for_you_service.dart';
import 'package:ecommerceapp/widgets/home/just_for_you_item_card.dart';

class JustForYouScreen extends StatelessWidget {
  const JustForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = JustForYouService.items;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              'Just For You',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: "raleway",
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.star, color: Color(0xFF004CFF), size: 18),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
            childAspectRatio: 0.58,
          ),
          itemBuilder: (context, index) {
            return JustForYouItemCard(item: items[index]);
          },
        ),
      ),
    );
  }
}
