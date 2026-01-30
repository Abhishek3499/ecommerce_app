import 'dart:io';

import 'package:ecommerceapp/models/story_model.dart';
import 'package:ecommerceapp/models/product_model.dart';

import 'package:ecommerceapp/models/user_model.dart';
import 'package:ecommerceapp/screens/home/cart_screen.dart';
import 'package:ecommerceapp/screens/home/favorites_screen.dart';
import 'package:ecommerceapp/screens/settings/settings_screen.dart';
import 'package:ecommerceapp/screens/home/home_section/categories_section.dart';
import 'package:ecommerceapp/screens/home/home_section/flash_card_section.dart';
import 'package:ecommerceapp/screens/home/home_section/just_for_you_section.dart';
import 'package:ecommerceapp/screens/home/home_section/most_popular_section.dart';
import 'package:ecommerceapp/screens/home/home_section/new_items_section.dart';
import 'package:ecommerceapp/widgets/home/top_category_row.dart';

import 'package:ecommerceapp/screens/orders/orders_screen.dart';
import 'package:ecommerceapp/services/stories_service.dart';
import 'package:ecommerceapp/services/top_category_service.dart';
import 'package:ecommerceapp/services/recently_viewed_service.dart';

import 'package:ecommerceapp/widgets/home/announcement_card.dart';
import 'package:ecommerceapp/widgets/home/order_chip.dart';
import 'package:ecommerceapp/widgets/home/profile_header.dart';
import 'package:ecommerceapp/widgets/home/story_card.dart';
import 'package:flutter/material.dart';

/// Profile / Home screen that matches the provided design.
class HomeScreen extends StatefulWidget {
  final UserModel user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // List of screens for each tab
    final List<Widget> screens = [
      // Home tab content (index 0)
      _HomeContent(user: widget.user),

      // Favorites tab content (index 1)
      const FavoritesScreen(),

      // Orders tab content (index 2)
      const OrdersScreen(),

      // Cart tab content (index 3)
      CartScreen(),

      // Profile tab content (index 4)
      const SettingsScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      body: screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black45,
        unselectedItemColor: const Color(0xFF004CFF),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  final UserModel user;

  const _HomeContent({required this.user});

  @override
  Widget build(BuildContext context) {
    final ImageProvider avatarImage = user.profileImage.startsWith('assets/')
        ? AssetImage(user.profileImage)
        : FileImage(File(user.profileImage)) as ImageProvider;

    final String greetingName = user.name;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileHeader(name: greetingName, image: avatarImage),
          const SizedBox(height: 24),

          Text(
            "Hello, $greetingName!",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              fontFamily: 'raleway',
              color: Color(0xFF202020),
            ),
          ),

          const SizedBox(height: 24),
          const AnnouncementCard(),
          const SizedBox(height: 24),

          const Text(
            "Recently viewed",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              fontFamily: 'raleway',
            ),
          ),

          const SizedBox(height: 16),
          SizedBox(
            height: 70,
            child: _RecentlyViewedList(
              products: RecentlyViewedService.recentlyViewed,
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            "My Orders",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 14),
          Row(
            children: const [
              OrderChip(title: 'To Pay', active: true),
              SizedBox(width: 12),
              OrderChip(title: 'To Receive', active: true),
              SizedBox(width: 12),
              OrderChip(title: 'To Review'),
            ],
          ),

          const SizedBox(height: 24),
          _StoriesList(stories: StoriesService.stories),
          const SizedBox(height: 16),
          NewItemsSection(),
          const SizedBox(height: 16),
          MostPopularSection(),
          const SizedBox(height: 15),
          CategoriesSection(),
          const SizedBox(height: 16),
          FlashSaleSection(),
          const SizedBox(height: 16),

          TopCategoryRow(categories: TopCategoryService.categories),
          const SizedBox(height: 16),
          JustForYouSection(),
        ],
      ),
    );
  }
}

class _RecentlyViewedList extends StatelessWidget {
  final List<ProductModel> products;

  const _RecentlyViewedList({required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        primary: false,
        physics: const BouncingScrollPhysics(),

        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = products[index];
          return CircleAvatar(
            radius: 36,
            backgroundImage: AssetImage(product.image),
          );
        },
      ),
    );
  }
}

class _StoriesList extends StatelessWidget {
  final List<StoryModel> stories;

  const _StoriesList({required this.stories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        separatorBuilder: (contex, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final story = stories[index];
          return StoryCard(story: story);
        },
      ),
    );
  }
}
