import 'package:ecommerceapp/models/top_category_model.dart';

/// Service that provides mock top categories data for the app
/// In a real app, this would fetch from a backend API
class TopCategoryService {
  static final List<TopCategoryModel> categories = [
    TopCategoryModel(
      'assets/Top_products/83AD853C-1A81-400B-8AF3-8E08589AB454 (1).png',
    ),
    TopCategoryModel(
      'assets/Top_products/F2E8E4C3-E5F7-45BC-9DFD-34A479B8D2B7 (3).png',
    ),
    TopCategoryModel(
      'assets/Top_products/F2E8E4C3-E5F7-45BC-9DFD-34A479B8D2B7 (4).png',
    ),
    TopCategoryModel(
      'assets/Top_products/A70864C8-1B1F-4014-84A4-450CD75C9CEF (4).png',
    ),
    TopCategoryModel(
      'assets/Top_products/F8382341-AF5B-48F9-B401-87FE74FEBC69 (2).png',
    ),
  ];
}
