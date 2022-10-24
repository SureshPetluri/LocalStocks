import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_stocks/local_themes/color_theme.dart';
import 'package:local_stocks/routes/route_constants.dart';
import 'package:local_stocks/view/product_details/product_details_controller.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title:Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "ProductDetail Page",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controller.updateUiWidth(1.0) > 750
                    ? Row(
                  children: [
                    buildColumn(controller),
                    buildContainer2(controller),
                  ],
                )
                    : Column(
                  children: [
                    buildColumn(controller),
                    buildContainer2(controller),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer2(ProductDetailsController controller) {
    return Container(
      padding: EdgeInsets.only(
          left: controller.updateUiWidth(1.0) < 750
              ? controller.updateUiWidth(0.1)
              : 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: controller.updateUiWidth(1.0) > 750
                  ? controller.updateUiWidth(0.5)
                  : controller.updateUiWidth(1.0),
              child: Text(
                controller.productDetailsMap["ProductName"] ?? "",
                style: const TextStyle(
                    overflow: TextOverflow.fade,
                    fontSize: 24.0,
                    color: LocalStocksColors.blackColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: controller.updateUiWidth(1.0) > 750
                ? controller.updateUiWidth(0.5)
                : controller.updateUiWidth(1.0),
            child: Text(
              controller.productDetailsMap["description"],
              style: TextStyle(
                  fontSize: 14.0,
                  color: LocalStocksColors.blackColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          buildPadding(
              controller,
              "Color :",
              controller.productDetailsMap["Color"],
              const TextStyle(
                  fontSize: 16.0,
                  color: LocalStocksColors.blackColor,
                  fontWeight: FontWeight.w600)),
          buildPadding(
              controller,
              "",
              "\$${controller.productDetailsMap["Price"]}",
              const TextStyle(
                  fontSize: 24.0,
                  color: LocalStocksColors.blackColor,
                  fontWeight: FontWeight.w600)),
          buildPadding(
              controller,
              "Seller :",
              controller.productDetailsMap["Seller"],
              const TextStyle(
                  fontSize: 16.0,
                  color: LocalStocksColors.successColor,
                  fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: MaterialButton(
                padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 20),
                color: LocalStocksColors.blueColor,
                onPressed: () {
                  Get.toNamed(AppRoutes.cart);
                },
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: LocalStocksColors.blackColor,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: MaterialButton(
                padding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                color: LocalStocksColors.primaryColor,
                onPressed: () {
                  Get.toNamed(AppRoutes.cart);
                },
                child: const Text(
                  "Save For Later",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: LocalStocksColors.blackColor,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Reviews :",
            style: TextStyle(
                fontSize: 24.0,
                color: LocalStocksColors.greyColor,
                fontWeight: FontWeight.w600),
          ),
          buildReviewContainer(
            controller,
            controller.updateUiWidth(1.0) > 750 ? 0.38 : 0.8,
            LocalStocksColors.successColor,
            LocalStocksColors.blueColor,
          ),
          buildReviewContainer(
            controller,
            controller.updateUiWidth(1.0) > 750 ? 0.3 : 0.6,
            LocalStocksColors.successColor,
            LocalStocksColors.blueColor,
          ),
          buildReviewContainer(
            controller,
            controller.updateUiWidth(1.0) > 750 ? 0.25 : 0.5,
            LocalStocksColors.successColor,
            LocalStocksColors.blueColor,
          ),
          buildReviewContainer(
            controller,
            controller.updateUiWidth(1.0) > 750 ? 0.2 : 0.4,
            LocalStocksColors.successColor,
            LocalStocksColors.blueColor,
          ),
          buildReviewContainer(
            controller,
            controller.updateUiWidth(1.0) > 750 ? 0.1 : 0.2,
            LocalStocksColors.successColor,
            LocalStocksColors.blueColor,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Container buildReviewContainer(ProductDetailsController controller,
      double width, Color startColor, Color endColor) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              startColor,
              endColor,
            ],
          )),
      height: 15,
      width: controller.updateUiWidth(width),
    );
  }

  Padding buildPadding(ProductDetailsController controller, String text,
      String text2, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: style,
          ),
          Text(
            text2,
            style: style,
          ),
        ],
      ),
    );
  }

  Column buildColumn(ProductDetailsController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: controller.updateUiWidth(1.0) < 750
              ? controller.updateUiWidth(1.0) < controller.updateUiHeight(1.0)
              ? controller.updateUiWidth(1.0)
              : controller.updateUiHeight(0.3)
              : controller.updateUiWidth(0.45) > 600
              ? 700
              : controller.updateUiWidth(0.52),
          width: controller.updateUiWidth(1.0) < 750
              ? controller.updateUiWidth(0.82)
              : controller.updateUiWidth(0.45) > 600
              ? 600
              : controller.updateUiWidth(0.45),
          child: Image.asset(
              controller.productDetailsMap["imageList"][controller.imageCount]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            controller.productDetailsMap["imageList"].length,
                (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                border: Border.all(),
                color: LocalStocksColors.secondaryBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: LocalStocksColors.greyColor,
                    blurRadius: 2,
                    offset: Offset(2, 2), // Shadow position
                  ),
                ],
              ),
              margin: EdgeInsets.all(5),
              height: controller.updateUiWidth(0.12) > 51
                  ? 50
                  : controller.updateUiWidth(0.12),
              width: controller.updateUiWidth(0.12) > 51
                  ? 50
                  : controller.updateUiWidth(0.12),
              child: InkWell(
                child: Image.asset(controller.productDetailsMap["imageList"][index]),
                onTap: () {
                  controller.imageCountIncrease(index);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
