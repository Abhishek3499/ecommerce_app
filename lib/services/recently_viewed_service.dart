import 'package:ecommerceapp/models/product_model.dart';

/// Service that provides mock recently viewed products data for the app
/// In a real app, this would fetch from a backend API or local storage
class RecentlyViewedService {
  static final List<ProductModel> recentlyViewed = [
    ProductModel('assets/media/93D04431-85B5-4598-9083-126E95618766.png'),
    ProductModel('assets/media/733AB344-5315-4C26-B1DC-1223523F4A5A.png'),
    ProductModel('assets/media/D0C1E42F-2424-4AC5-A50B-7F31438A87F4.png'),
    ProductModel('assets/media/Placeholder_01.png'),
    ProductModel('assets/media/Placeholder_01.png'),
  ];
}
