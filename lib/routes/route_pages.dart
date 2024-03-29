
import 'package:get/get.dart';
import 'package:local_stocks/routes/route_constants.dart';
import 'package:local_stocks/view/cart/cart_binding.dart';
import 'package:local_stocks/view/cart/cart_screen.dart';
import 'package:local_stocks/view/google_maps_location_selection/location_selection_binding.dart';
import 'package:local_stocks/view/google_maps_location_selection/location_selection_screen.dart';
import 'package:local_stocks/view/home/home_binding.dart';
import 'package:local_stocks/view/home/home_screen.dart';
import 'package:local_stocks/view/product_details/product_details_binding.dart';
import 'package:local_stocks/view/product_details/product_details_screen.dart';

class AppPages {
  static getPageWithTransition({required String name,
    required GetPageBuilder page,
    required Bindings binding}) =>
      GetPage(
        name: name,
        page: page,
        binding: binding,
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 700),
      );

  static final List<GetPage> routes = [
    getPageWithTransition(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    getPageWithTransition(
      name: AppRoutes.cart,
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
    getPageWithTransition(
      name: AppRoutes.productDetailsPage,
      page: () => ProductDetailsPage(),
      binding: ProductDetailBinding(),
    ),
    getPageWithTransition(
      name: AppRoutes.googleLocationPicker,
      page: () => LocationPickMap(),
      binding: LocationSelectionBinding(),
    )

  ];
}