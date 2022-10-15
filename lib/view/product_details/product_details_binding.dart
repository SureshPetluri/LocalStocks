import 'package:get/get.dart';
import 'package:local_stocks/view/product_details/product_details_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailsController());
  }
}
