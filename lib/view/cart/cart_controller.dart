import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:local_stocks/model/cart_model.dart';

class CartController extends GetxController {
   final itemKey = GlobalKey();
   double containerHeight = 0.0;
    ScrollController listScrollController = ScrollController();
  //
  // Future scrollToItems(BuildContext context) async {
  //   final itemContext = itemKey.currentContext;
  //
  //   await Scrollable.ensureVisible(itemContext ?? context);
  // }

  List<Map<String, dynamic>> myCartMap = [
    {
      "ProductName": "APPLE iPhone 13 (Midnight, 128 GB)",
      "productImage": "assets/images/Apple-iPhone-12.png",
      "description": "6.1-inch (15.5 cm diagonal) Super Retina XDR display",
      "Color": "blue",
      "Size": "L",
      "Quantity": 2,
      "Price": "200",
      "Seller": "Seller",
    },
    {
      "ProductName": "Apple iPhone 13 Pro (128GB) - Sierra Blue)",
      "productImage": "assets/images/apple13.png",
      "description": "6.1-inch (15.5 cm diagonal) Super Retina XDR display",
      "Color": "blue",
      "Size": "L",
      "Quantity": 2,
      "Price": "200",
      "Seller": "Seller",
    },
    {
      "ProductName": "APPLE iPhone 13 (Midnight, 128 GB)",
      "productImage": "assets/images/iphoneFront.png",
      "description": "6.1-inch (15.5 cm diagonal) Super Retina XDR display",
      "Color": "blue",
      "Quantity": 2,
      "Price": "200",
      "Seller": "Seller",
    },
    {
      "ProductName": "APPLE iPhone 13 (Midnight, 128 GB)",
      "productImage": "assets/images/Apple-iPhone-12.png",
      "description": "6.1-inch (15.5 cm diagonal) Super Retina XDR display",
      "Color": "blue",
      "Size": "L",
      "Quantity": 2,
      "Price": "200",
      "Seller": "Product Seller Name",
    },
    {
      "ProductName": "APPLE iPhone 13 (Midnight, 128 GB)",
      "productImage": "assets/images/Apple-iPhone-12.png",
      "description": "6.1-inch (15.5 cm diagonal) Super Retina XDR display",
      "Color": "blue",
      "Size": "L",
      "Quantity": 2,
      "Price": "200",
      "Seller": "Product Seller Name",
    },
  ];

  List<Map<String, dynamic>> mySaveLaterCart = [
    {
      "ProductName": "APPLE iPhone 13 (Midnight, 128 GB)",
      "productImage": "assets/images/Apple-iPhone-12.png",
      "description": "6.1-inch (15.5 cm diagonal) Super Retina XDR display",
      "Color": "blue",
      "Size": "L",
      "Quantity": 2,
      "Price": "200",
      "Seller": "200",
    },
    {
      "ProductName": "APPLE iPhone 13 (Midnight, 128 GB)",
      "productImage": "assets/images/Apple-iPhone-12.png",
      "description": "6.1-inch (15.5 cm diagonal) Super Retina XDR display",
      "Color": "blue",
      "Size": "L",
      "Quantity": 2,
      "Price": "200",
      "Seller": "200",
    },
    {
      "ProductName": "APPLE iPhone 13 (Midnight, 128 GB)",
      "productImage": "assets/images/Apple-iPhone-12.png",
      "description": "6.1-inch (15.5 cm diagonal) Super Retina XDR display",
      "Color": "blue",
      "Quantity": 2,
      "Price": "200",
      "Seller": "200",
    }
  ];
  List<CartModel> listCart = [];
  List<CartModel> mySaveLaterCartMap = [];
  bool isPlaceOrder = false;
  int quantity = 1;

  @override
  void onInit() {
    super.onInit();

    convertingCartModel();
    convertingSaveLaterCartModel();
  }
   @override
   Future<void> onReady() async {
    containerHeight = itemKey.currentContext?.size?.height ?? 0.0;
    print("containerHeight   $containerHeight   ${Get.height}");
   listScrollController.addListener(_listen);
    update();
   }
  double updateUiWidth(double widthSize) {
    double width = Get.width * widthSize;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });

    return width;
  }
  _listen(){
    double height = listScrollController.offset + Get.height-50;
    if(containerHeight < height){
      isPlaceOrder = true;
    }else{
      isPlaceOrder = false;
    }
    update();

  }
  double updateUiHeight(double heightSize) {
    double height = Get.height * heightSize;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });
    return height;
  }

  addSaveLaterCart(int index){
    mySaveLaterCartMap.add(listCart[index]);
    update();

  }

  void addToCart(int index) {
    listCart.add(mySaveLaterCartMap[index]);
    mySaveLaterCartMap.remove(mySaveLaterCartMap[index]);
    update();
  }

  void removeFromCart(int index) {
    listCart.remove(listCart[index]);
    update();
  }

  void removeFromSaveLaterCart(int index) {
    mySaveLaterCartMap.remove(mySaveLaterCartMap[index]);
    update();
  }

  funcIncrement(int index) {
    quantity++;
    listCart[index].quantity = quantity;
    update();
  }

  funcDecrement(int index) {
    quantity > 1? quantity--:quantity;
    listCart[index].quantity = quantity;
    update();
  }


  convertingCartModel() {
    listCart.addAll(myCartMap.map((e) => CartModel.fromJson(e)));
    debugPrint("iterableCartModel is $listCart");
  }

  convertingSaveLaterCartModel() {
    mySaveLaterCartMap.addAll(mySaveLaterCart.map((e) => CartModel.fromJson(e)));
    debugPrint("iterableCartModel is $mySaveLaterCartMap");
  }

  // void listUpdateScroll() {
  //   if (listScrollController.hasClients) {
  //     final position = listScrollController.position.minScrollExtent;
  //     listScrollController.animateTo(
  //       position,
  //       duration: Duration(seconds: 1),
  //       curve: Curves.easeOut,
  //     );
  //     update();
  //   }
  // }



}
