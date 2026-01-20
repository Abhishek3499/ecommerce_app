import 'dart:io';

import 'package:ecommerceapp/models/product_model.dart';
import 'package:ecommerceapp/models/story_model.dart';
import 'package:ecommerceapp/models/user_model.dart';
import 'package:ecommerceapp/services/product_service.dart';
import 'package:ecommerceapp/services/story_services.dart';
import 'package:ecommerceapp/widgets/order_chip.dart';
import 'package:ecommerceapp/widgets/profile_widgets/announcement_card.dart';
import 'package:ecommerceapp/widgets/profile_widgets/profile_header.dart';
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
    final ImageProvider avatarImage = widget.user.profileImage
            .startsWith('assets/')
        ? AssetImage(widget.user.profileImage)
        : FileImage(File(widget.user.profileImage)) as ImageProvider;

    final String greetingName = widget.user.name;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeader(
                  name: greetingName,
                  image: avatarImage,
                ),
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
                const SizedBox(height: 4),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'NunitoSans',
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                const AnnouncementCard(),
                const SizedBox(height: 24),
                const Text(
                  "Recently viewed",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'raleway',
                    color: Color(0xFF202020),
                  ),
                ),
                const SizedBox(height: 16),
                _RecentlyViewedList(
                  products: ProductService.recentlyViewed,
                ),
                const SizedBox(height: 24),
                const Text(
                  "My Orders",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'raleway',
                    color: Color(0xFF202020),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: const [
                    OrderChip(title: "To Pay"),
                    SizedBox(width: 8),
                    OrderChip(
                      title: "To Receive",
                      active: true,
                      showDot: true,
                    ),
                    SizedBox(width: 8),
                    OrderChip(title: "To Review"),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  "Stories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'raleway',
                    color: Color(0xFF202020),
                  ),
                ),
                const SizedBox(height: 16),
                _StoriesList(stories: StoryServices.stories),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF004CFF),
        unselectedItemColor: Colors.black45,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
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

class _RecentlyViewedList extends StatelessWidget {
  final List<ProductModel> products;

  const _RecentlyViewedList({required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = products[index];
          return CircleAvatar(
            radius: 30,
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
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final story = stories[index];
          return _StoryCard(story: story);
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final StoryModel story;

  const _StoryCard({required this.story});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          SizedBox(
            width: 120,
            height: 190,
            child: Image.asset(
              story.image,
              fit: BoxFit.cover,
            ),
          ),
          if (story.isLive)
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF00C853),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Live",
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                size: 24,
                color: Color(0xFF004CFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
