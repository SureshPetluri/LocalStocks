import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  Map<String, dynamic> productDetailsMap = {
    "ProductName": "APPLE iPhone 13 (Midnight, 128 GB)",
    "productImage": "assets/images/Apple-iPhone-12.png",
    "description":
        "iPhone 13. boasts an advanced dual-camera system that allows you to click mesmerising pictures with immaculate clarity. Furthermore, the lightning-fast A15 Bionic chip allows for seamless multitasking, elevating your performance to a new dimension. A big leap in battery life, a durable design, and a bright Super Retina XDR display facilitate boosting your user experience.",
    "Color": "blue",
    "Size": "L",
    "Quantity": "2",
    "Price": "200",
    "Seller": "Product Seller Name",
    "imageList": [
      'assets/images/IPhone-PNG-Background-Image.png',
      "assets/images/Apple-iPhone-12.png",
      "assets/images/apple13.png",
      "assets/images/iphoneFront.png",
      "assets/images/iphone.png"
    ]
  };

  int imageCount = 0;

  imageCountIncrease(int index) {
    imageCount = index;
  }

  double updateUiWidth(double widthSize) {
    double width = Get.width * widthSize;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });

    return width;
  }

  double updateUiHeight(double heightSize) {
    double height = Get.height * heightSize;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });
    return height;
  }
}
