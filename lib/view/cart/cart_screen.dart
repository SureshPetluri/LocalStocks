import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_stocks/local_themes/color_theme.dart';
import 'cart_controller.dart';
import 'cart_product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init:CartController(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: controller.isPlaceOrder
            ? SizedBox()
            : controller.updateUiWidth(1.0) > 750
                ? Container(
                    padding:
                        EdgeInsets.only(right: controller.updateUiWidth(0.4)),
                    // width: controller.updateUiWidth(0.5),
                    child: buildPlaceOrderContainer(controller))
                : SizedBox(),
        appBar: AppBar(
          title: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "My Cart",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0),
            ),
          ),
        ),
        body: controller.updateUiWidth(1.0) < 750
            ? SingleChildScrollView(
          child: buildSizedBoxCart(controller),
        )
            : buildSizedBoxCart(controller),
      ),
    );
  }

  SizedBox buildSizedBoxCart(CartController controller) {
    return SizedBox(
      width: controller.updateUiWidth(1.0),
      child: Wrap(
        direction: controller.updateUiWidth(1.0) > 750
            ? Axis.horizontal
            : Axis.vertical,
        crossAxisAlignment: controller.updateUiWidth(1.0) > 750
            ? WrapCrossAlignment.start
            : WrapCrossAlignment.center,
        children: [
          Container(
            height: controller.updateUiHeight(0.94),
            child: SingleChildScrollView(
              controller: controller.listScrollController,
              child: Column(
                children: [
                  controller.updateUiWidth(1.0) > 750
                      ? Container(
                          constraints: BoxConstraints(
                            maxWidth: controller.updateUiWidth(0.60),
                          ),
                          child: Column(
                            children: [
                              Container(
                                key: controller.itemKey,
                                child: Column(
                                  children: [
                                    LIstCartItems(
                                      listCart: controller.listCart,
                                      text: "cart",
                                    ),
                                    controller.isPlaceOrder
                                        ? buildPlaceOrderContainer(controller)
                                        : controller.containerHeight >
                                                Get.height
                                            ? SizedBox()
                                            : buildPlaceOrderContainer(
                                                controller),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              LIstCartItems(
                                  listCart: controller.mySaveLaterCartMap,
                                  text: "saveLaterCart"),
                            ],
                    ),
                  )
                      : Container(
                    constraints: BoxConstraints(
                      maxWidth: controller.updateUiWidth(1.0),
                    ),
                    child: LIstCartItems(
                        listCart: controller.listCart, text: "cart"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: controller.updateUiWidth(
                controller.updateUiWidth(1.0) > 750 ? 0.30 : 0.85),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Price Details",
                    style: buildTextStyle(
                      18.0,
                      FontWeight.w600,
                      LocalStocksColors.blackColor,
                    ),
                  ),
                ),
                buildRow(
                    controller,
                    "Price(${controller.listCart.length} items) :",
                    "\$ 400",
                    FontWeight.w600,
                    16.0,
                    LocalStocksColors.blackColor),
                buildRow(controller, "Discount :", "- \$90", FontWeight.w500,
                    14.0, LocalStocksColors.successColor),
                buildRow(controller, "Buy more & Save more :", "-\$10",
                    FontWeight.w500, 14.0, LocalStocksColors.successColor),
                buildRow(controller, "Delivery Charges :", "Free Delivery",
                    FontWeight.w500, 14.0, LocalStocksColors.successColor),
                buildRow(controller, "ToTal Amount :", "\$ 300",
                    FontWeight.w600, 16.0, LocalStocksColors.blackColor),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "You will save \$100 on this order",
                    style: buildTextStyle(
                        14.0, FontWeight.w500, LocalStocksColors.successColor),
                  ),
                ),
                controller.updateUiWidth(1.0) > 750
                    ? SizedBox()
                    : buildPlaceOrderContainer(controller),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          controller.updateUiWidth(1.0) > 750
              ? SizedBox()
              : Container(
                  constraints: BoxConstraints(
                    maxWidth: controller.updateUiWidth(1.0),
                  ),
                  child: LIstCartItems(
                      listCart: controller.mySaveLaterCartMap,
                      text: "saveLaterCart"),
                ),
        ],
      ),
    );
  }

  Container buildPlaceOrderContainer(CartController controller) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(),
          color: LocalStocksColors.secondaryBackgroundColor,
          boxShadow: const [
            BoxShadow(
              color: LocalStocksColors.greyColor,
              blurRadius: 4,
              offset: Offset(4, 8),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: controller.updateUiWidth(0.015),
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("300",
                style: buildTextStyle(
                    16.0, FontWeight.w600, LocalStocksColors.blackColor)),
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: controller.updateUiWidth(0.028),
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: LocalStocksColors.primaryColor,
                ),
                child: TextButton(
                  child: Text("Place Order",
                      style: buildTextStyle(
                          16.0, FontWeight.w600, LocalStocksColors.blackColor)),
                  onPressed: () {
                    // Get.toNamed(AppRoutes.orderConformation);
                  },
                )),
          ],
        ));
  }

  TextStyle buildTextStyle(
      double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  Padding buildRow(CartController controller, String text, String colorName,
      FontWeight fontWeight, double fontSize, Color color) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: buildTextStyle(
                fontSize, fontWeight, LocalStocksColors.blackColor),
          ),
          Text(
            colorName,
            style: buildTextStyle(fontSize, fontWeight, color),
          ),
        ],
      ),
    );
  }
}
