import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:local_stocks/model/product_detail.dart';

class HomeController extends GetxController {
  // GetAllProductsModel? getAllProductsModel;
  // HomeProvider homeProvider = HomeProvider();

  TextEditingController searchController = TextEditingController();
  // GetCategory? getCategory;

  final List<String> images = [

  ];

  final List<String> images1 = [
    'https://m.media-amazon.com/images/I/71NQeJQrOkL._AC_UL320_.jpg',
    'https://m.media-amazon.com/images/I/719pUQCxnmL._AC_UL320_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/01/amazonglobal/images/email/asins/DURM-2358661D4048B394._V535581696_.jpg',
    'https://m.media-amazon.com/images/I/71H2qSWwxqL._AC_UL320_.jpg',
  ];

  final List<String> images2 = [
    'https://images-na.ssl-images-amazon.com/images/G/01/gift-certificates/consumer/2022/Fall/GCLP/4C_BGC_US.png',
    'https://m.media-amazon.com/images/I/41duljjD6%2BL.jpg',
    'https://m.media-amazon.com/images/I/31pQrwJSnwL.jpg',
    'https://m.media-amazon.com/images/I/41YlI1LTqBL.jpg',
    'https://m.media-amazon.com/images/I/21MYxeX9EXL.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/01/gift-certificates/consumer/2022/Fall/GCLP/3C_Event_MilestoneMoments_US-en.png',
  ];
  GetAllProductsModel? listOfProducts;
  List list = [
    'https://m.media-amazon.com/images/I/71Y9bkev+iL._AC_SX466_.jpg',
    'https://m.media-amazon.com/images/I/61WdTalEcKL._AC_SX466_.jpg',
    'https://m.media-amazon.com/images/I/61iD0U2YwqL._AC_UL320_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/01/AMAZON_FASHION/2022/SITE_FLIPS/WIN_22/GW/PWPS/DCC_FEB_PS_M_02_1x._SY304_CB647593327_.jpg',
  ];
  @override
  void onInit() async {
    super.onInit();

    /// decoded accessToken to get user Id

    /// calling getAllProducts method
    // await getAllProducts();
    // await viewCategory();
  }
   updateUiWidth(double widthSize, GetxController controller) {
    double width = Get.width * widthSize;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.update();
    });

    return width;
  }

   updateUiHeight(double heightSize, GetxController controller) {
    double height = Get.height * heightSize;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.update();
    });
    return height;
  }
  bool isImage(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".jpg") ||
        ext.endsWith(".jpeg") ||
        ext.endsWith(".png") ||
        ext.endsWith(".gif") ||
        ext.endsWith(".bmp");
  }

  /// view all category
 /* viewCategory() async {
    try {
      /// start spinning indicator
      // FormUtils.showProgress();

      ///  API call
      Map<String, dynamic> data = await CategoryProvider().getAllCategory();

      /// stop spinning indicator
      // FormUtils.stopProgress();

      DebugUtils.printCT('view all category API call data $data');

      if (data['API_STATUS_CODE'] == 200) {
        getCategory = GetCategory.fromJson(data);
        // TODO
      } else {
        // TODO
      }
    } on Exception catch (e) {
      /// display exception message in console
      DebugUtils.printCT('Exception while loading view all category data $e');
    } finally {
      /// display finally message in console
      DebugUtils.printCT('view all category API call is terminated');
      update();
    }

    update();
  }*/

  /// get all products method
 /* getAllProducts() async {
    try {
      // FormUtils.showProgress();

      ///  API call
      Map<String, dynamic> data = await homeProvider.getAllProducts();

      /// stop spinning indicator
      // FormUtils.stopProgress();

      if (data['API_STATUS_CODE'] == 200) {
        getAllProductsModel = GetAllProductsModel.fromJson(data);
        // TODO
      } else {
        // TODO
      }
    } on Exception catch (e) {
      /// display exception message in console
      DebugUtils.printCT('Exception while loading getAllProducts data $e');
    } finally {
      /// display finally message in console
      DebugUtils.printCT('getAllProducts API call is terminated');
      update();
    }
  }*/

  /// delete product method
  /*Future<dynamic> deleteProduct(int id) async {
    try {
      /// start spinning indicator
      FormUtils.showProgress();

      ///  API call
      Map<String, dynamic> data = await homeProvider.deleteProduct(id);

      /// stop spinning indicator
      FormUtils.stopProgress();

      DebugUtils.printCT('deleteProduct API call data $data');

      if (data['API_STATUS_CODE'] == 200) {
        await getAllProducts();
        DebugUtils.printCT('deleteProductAfter API call data $data');
      } else {
        // TODO
      }
    } on Exception catch (e) {
      /// display exception message in console
      DebugUtils.printCT('Exception while loading deleteProduct data $e');
    } finally {
      /// display finally message in console
      DebugUtils.printCT('deleteProduct API call is terminated');
      update();
    }
  }*/

  /// Search by key
  /*searchByKey(v) async {
    try {
      ///  API call
      if (searchController.text.length >= 1 || searchController.text.isEmpty) {
        /// start spinning indicator

        // FormUtils.showProgress();
        Map<String, dynamic> data = await ProductProviders()
            .searchProducts("${searchController.text.trim()}");

        /// stop spinning indicator
        // FormUtils.stopProgress();

        DebugUtils.printCT('search API call data $data');

        if (data['API_STATUS_CODE'] == 200) {
          getAllProductsModel = GetAllProductsModel.fromJson(data);
        } else {
          // TODO
        }
      }
    } on Exception catch (e) {
      /// display exception message in console
      DebugUtils.printCT('Exception while loading search data $e');
    } finally {
      /// display finally message in console
      DebugUtils.printCT('search API call is terminated');
      update();
    }
  }*/

  /// Get products by category id
  /*getProductsByCategory(int id) async {
    try {
      FormUtils.showProgress();

      List categoryIdList = [int.parse("$id")];
      Map<String, dynamic> data =
      await HomeProvider().getCategoryViseProduct(categoryIdList);

      /// stop spinning indicator
      FormUtils.stopProgress();

      DebugUtils.printCT('category vise list call data $data');

      if (data['API_STATUS_CODE'] == 200) {
        getAllProductsModel = GetAllProductsModel.fromJson(data);
      } else {
        // TODO
      }
    } on Exception catch (e) {
      /// display exception message in console
      DebugUtils.printCT('Exception while loading category vise list data $e');
    } finally {
      /// display finally message in console
      DebugUtils.printCT('category vise list API call is terminated');
      update();
    }
  }*/

  /*double updateUiWidth(double widthSize) {
    double width = Get.width * widthSize;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });

    return width;
  }*/
}
