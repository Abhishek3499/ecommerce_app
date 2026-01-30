import 'package:ecommerceapp/screens/home/home_section/categories_section.dart';
import 'package:ecommerceapp/screens/home/home_section/just_for_you_section.dart';
import 'package:ecommerceapp/screens/home/home_section/most_popular_section.dart';
import 'package:ecommerceapp/screens/home/home_section/new_items_section.dart';
import 'package:ecommerceapp/services/top_category_service.dart';
import 'package:ecommerceapp/widgets/big_sales_banner.dart';
import 'package:ecommerceapp/widgets/home/top_category_row.dart';
import 'package:ecommerceapp/widgets/shop_widgets/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // 🔹 SHOP + SEARCH ROW
            Row(
              children: [
                const Text(
                  "Shop",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    fontFamily: "raleway",
                  ),
                ),
                const SizedBox(width: 16),

                // 🔍 SEARCH BAR
                Expanded(
                  child: SearchBar(
                    controller: _searchController,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            const BigSalesBanner(),

            SizedBox(height: 16),
            CategoriesSection(),
            const SizedBox(height: 20),

            TopCategoryRow(categories: TopCategoryService.categories),
            const SizedBox(height: 20),
            NewItemsSection(),
            const SizedBox(height: 20),
            const MostPopularSection(),
            const SizedBox(height: 16),

            const JustForYouSection(),
          ],
        ),
      ),
    );
  }
}
