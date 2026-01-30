import 'package:ecommerceapp/models/popular_product_model.dart';

/// Service that provides mock popular products data for the app
/// In a real app, this would fetch from a backend API
class PopularProductsService {
  static final List<PopularProductModel> items = [
    PopularProductModel(
      image: "assets/most_popular/D1D72D4D-1D49-410C-870A-423B20DE974E.png",
      price: 1780,
      tag: "New",
    ),
    PopularProductModel(
      image: "assets/most_popular/AC1999D5-B8AE-4373-9F4E-2709369408FE.png",
      price: 1780,
      tag: "Sale",
    ),
    PopularProductModel(
      image: "assets/most_popular/E289A622-DB6F-493F-B035-DE553AA20D6D.png",
      price: 1780,
      tag: "Hot",
    ),
    PopularProductModel(
      image: "assets/most_popular/526227CB-E83C-4B8C-91F9-9345C6B6EBFC.png",
      price: 1780,
      tag: "Hot",
    ),
  ];
}
