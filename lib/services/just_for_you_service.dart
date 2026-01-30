import 'package:ecommerceapp/models/just_for_you_model.dart';

/// Service that provides mock "Just For You" products data for the app
/// In a real app, this would fetch from a backend API based on user preferences
class JustForYouService {
  static final List<JustForYouModel> items = [
    JustForYouModel(
      image: 'assets/just_for_you/45D808E0-5E00-4D2A-9BDC-5ED6F427010E (2).png',
      title: ' Lorem ipsum dolor sit amet consectetur',
      price: 17.00,
    ),
    JustForYouModel(
      image: 'assets/just_for_you/92265483-9E7E-4FC3-A355-16CCA677C11C (3).png',
      title: 'Lorem ipsum dolor sit amet consectetur',
      price: 17.00,
    ),
    JustForYouModel(
      image: 'assets/just_for_you/50C51A0F-BC20-497B-AC11-9B4129753C92.png',
      title: "Lorem ipsum dolor sit amet consectetur",
      price: 17.00,
    ),
    JustForYouModel(
      image: 'assets/just_for_you/733AB344-5315-4C26-B1DC-1223523F4A5A.png',
      title: 'Lorem ipsum dolor sit amet consectetur',
      price: 17.00,
    ),
    JustForYouModel(
      image: 'assets/just_for_you/4AA32357-E9FC-4176-84AF-DF4CA24D9257.png',
      title: 'Lorem ipsum dolor sit amet consectetur',
      price: 17.00,
    ),
    JustForYouModel(
      image: 'assets/just_for_you/333CBBCA-9390-4C5A-A60A-21E776BF77D2 (1).png',
      title: 'Lorem ipsum dolor sit amet consectetur',
      price: 17.00,
    ),
  ];
}
