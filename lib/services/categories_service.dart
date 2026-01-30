import 'package:ecommerceapp/models/category_model.dart';

/// Service that provides mock category data for the app
/// In a real app, this would fetch from a backend API
class CategoriesService {
  static final List<CategoryModel> categories = [
    CategoryModel(
      title: "Clothing",
      count: 109,
      images: [
        "assets/categories/532C6DCF-29CA-4FB0-A2E4-04F0AC1D802A.png",
        "assets/categories/74C5B250-BCB7-4AEA-9861-6BD3CB74D4E1.png",
        "assets/categories/0F26E045-AA02-4EB7-83BB-94DED23C9E45.png",
        "assets/categories/A82F2881-8414-4807-9EB4-4D7CF68DA020.png",
      ],
    ),
    CategoryModel(
      title: "Shoes",
      count: 530,
      images: [
        "assets/categories/A70864C8-1B1F-4014-84A4-450CD75C9CEF.png",
        "assets/categories/DDF8E2EF-1A43-4C29-BB9C-4548488D9378.png",
        "assets/categories/6D305338-A2A1-480E-AEBB-80A9382518E9.png",
        "assets/categories/A0A54F52-A5F3-45D8-8517-39D6BCC0A5E1.png",
      ],
    ),
    CategoryModel(
      title: " Bags",
      count: 87,
      images: [
        "assets/categories/1F888CAB-A065-4AED-85C1-14DAA9B89010.png",
        "assets/categories/3F402E7A-1674-4060-9B2C-3998C0EDD403.png",
        "assets/categories/83AD853C-1A81-400B-8AF3-8E08589AB454.png",
        "assets/categories/27CE7B24-8B28-4012-8BFE-07ED419E450E.png",
      ],
    ),
    CategoryModel(
      title: "Lingerie",
      count: 218,
      images: [
        "assets/categories/F2E8E4C3-E5F7-45BC-9DFD-34A479B8D2B7.png",
        "assets/categories/18E41C34-1DA0-43BC-9EA8-C7A71E0811DE.png",
        "assets/categories/F8382341-AF5B-48F9-B401-87FE74FEBC69.png",
        "assets/categories/B35CFC93-A1B9-4A92-B4F2-EFCE760C5BDD.png",
      ],
    ),
  ];
}
