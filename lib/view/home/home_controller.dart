import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_stocks/model/all_products_model.dart';

class HomeController extends GetxController {
  // GetAllProductsModel? getAllProductsModel;
  // HomeProvider homeProvider = HomeProvider();
  ScrollController listScrollController = ScrollController();
  CarouselController caroselController = CarouselController();
  TextEditingController searchController = TextEditingController();

  // GetCategory? getCategory;

  final List<String> images = [];

  final List<String> images1 = [
    'https://m.media-amazon.com/images/I/71NQeJQrOkL._AC_UL320_.jpg',
    'https://m.media-amazon.com/images/I/719pUQCxnmL._AC_UL320_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/01/amazonglobal/images/email/asins/DURM-2358661D4048B394._V535581696_.jpg',
    'https://m.media-amazon.com/images/I/71H2qSWwxqL._AC_UL320_.jpg',
  ];

  final Map<int, List<String>> images2 = {
    1: [
      'https://m.media-amazon.com/images/I/61sDyXAepuL._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/712ALflYTYL._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/7161nwSVX9L._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61nWzrdyUwL._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/71VNa3QYKcL._SL1500_.jpg',
    ],
    2: [
      'https://m.media-amazon.com/images/I/81bsw6fnUiL.jpg',
      'https://m.media-amazon.com/images/I/81JAQKcKkBL.jpg',
      'https://m.media-amazon.com/images/I/71IW+OslV3L.jpg'
      'https://m.media-amazon.com/images/I/8167o-RD4eL.jpg',
    ],
    3: [
      'https://m.media-amazon.com/images/I/61IJBsHm97L._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61rrisp8qiL._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/81HXViH8boL._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/812cOE51JEL._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/617LwLeZGrL._SL1500_.jpg'
    ],
    4: [
      'https://m.media-amazon.com/images/I/710TJuHTMhL._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/610TpF8jQyL._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61XPhYGQOQL._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/61s79OkQwAL._SL1500_.jpg',
    ],
    5:[
      'https://m.media-amazon.com/images/I/71XKAnxCsLL._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/71+xEIlS99L._SL1500_.jpg',
          'https://m.media-amazon.com/images/I/71eVJ+zm4zL._SL1500_.jpg',
      'https://m.media-amazon.com/images/I/71uQUeihqeL._SL1500_.jpg'
    ]
  };
  GetAllProductsModel? listOfProducts;
  List list = [
    'https://m.media-amazon.com/images/I/71XKAnxCsLL._SL1500_.jpg',
    'https://m.media-amazon.com/images/I/71+xEIlS99L._SL1500_.jpg',
    'https://m.media-amazon.com/images/I/61XPhYGQOQL._SL1500_.jpg',
    'https://m.media-amazon.com/images/I/61s79OkQwAL._SL1500_.jpg'
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

  scrollToBottom(){
    final position = listScrollController.position.maxScrollExtent;
    listScrollController.animateTo(
      position,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

  scrollToTop(){
    final position = listScrollController.position.minScrollExtent;
    listScrollController.animateTo(
      position,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }
  scrollToBooks(){
    final position = listScrollController.position.maxScrollExtent/2.8;
    listScrollController.animateTo(
      position,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }
  scrollToIphone(){
    final position = listScrollController.position.maxScrollExtent/1.38;
    listScrollController.animateTo(
      position,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

  DateFormatChangeToUtc(
      {String timeZone = "GMT+05:30", String date = "2022-11-17 01:30:40"}) {
    try {
      var f = DateFormat('E, d MMM yyyy HH:mm:ss');
      if (timeZone.split("").contains('+')) {
        String hours = timeZone.split("+")[1].split(":")[0];
        String minutes = timeZone.split("+")[1].split(":")[1];
        print("my hours and minutes ++++ ${hours} ...$minutes");
        DateTime localDate = DateTime.parse(date)
            .add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
        print("my UTC++++ ${f.format(localDate)}");
        return f.format(localDate);
      } else {
        String hours = timeZone.split("-")[1].split(":")[0];
        String minutes = timeZone.split("-")[1].split(":")[1];
        print("my hours and minutes ---- ${hours} ...$minutes");
        DateTime localDate = DateTime.parse(date).subtract(
            Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
        print("my UTC------ ${f.format(localDate)}");
        return f.format(localDate);
      }
    } catch (e) {
      print('Error ******' + e.toString());
      throw e;
    }
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
