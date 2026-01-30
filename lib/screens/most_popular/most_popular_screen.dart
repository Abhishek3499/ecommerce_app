import 'package:flutter/material.dart';
import 'package:ecommerceapp/services/popular_products_service.dart';
import 'package:ecommerceapp/widgets/home/popular_product_card.dart';

class MostPopularScreen extends StatelessWidget {
  const MostPopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = PopularProductsService.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Most Popular',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "raleway",
          ),
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
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (_, index) {
            return PopularProductCard(item: items[index]);
          },
        ),
      ),
    );
  }
}
