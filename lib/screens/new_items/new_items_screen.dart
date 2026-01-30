import 'package:flutter/material.dart';
import 'package:ecommerceapp/services/new_items_service.dart';
import 'package:ecommerceapp/widgets/home/new_item_card.dart';

class NewItemsScreen extends StatelessWidget {
  const NewItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = NewItemsService.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Items',
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
            childAspectRatio: 0.56,
          ),
          itemBuilder: (_, index) {
            return NewItemCard(item: items[index]);
          },
        ),
      ),
    );
  }
}
