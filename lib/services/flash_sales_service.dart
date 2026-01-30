import 'package:ecommerceapp/models/flash_sale_model.dart';

/// Service that provides mock flash sale data for the app
/// In a real app, this would fetch from a backend API
class FlashSalesService {
  static final List<FlashSaleModel> items = [
    FlashSaleModel(
      image: "assets/flash_sales/2289C231-211F-4850-B7AF-5EF0F942B4F7.png",
      discount: 20,
    ),
    FlashSaleModel(
      image: "assets/flash_sales/88CAB39F-4168-412E-A874-015ED4199CF3.png",
      discount: 20,
    ),
    FlashSaleModel(
      image: "assets/flash_sales/92265483-9E7E-4FC3-A355-16CCA677C11C.png",
      discount: 20,
    ),
    FlashSaleModel(
      image: "assets/flash_sales/45D808E0-5E00-4D2A-9BDC-5ED6F427010E.png",
      discount: 20,
    ),
    FlashSaleModel(
      image: "assets/flash_sales/84439DCD-10EF-4585-80F8-D23D06DFBC5E.png",
      discount: 20,
    ),
    FlashSaleModel(
      image: "assets/flash_sales/333CBBCA-9390-4C5A-A60A-21E776BF77D2.png",
      discount: 20,
    ),
  ];
}
