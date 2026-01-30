import 'package:ecommerceapp/models/item_model.dart';

/// Service that provides mock new items data for the app
/// In a real app, this would fetch from a backend API
class NewItemsService {
  static final List<ItemModel> items = [
    ItemModel(
      image: 'assets/new_items/Mask Group (1).png',
      title: 'Lorem ipsum dolor sit amet consectetur.',
      price: 17.00,
    ),
    ItemModel(
      image: 'assets/new_items/Mask Group (2).png',
      title: 'Lorem ipsum dolor sit amet consectetur.',
      price: 32.00,
    ),
    ItemModel(
      image: 'assets/new_items/Mask Group.png',
      title: 'Lorem ipsum dolor sit amet consectetur.',
      price: 21.00,
    ),
  ];
}
