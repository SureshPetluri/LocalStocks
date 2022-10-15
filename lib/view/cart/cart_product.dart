import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_stocks/local_themes/color_theme.dart';
import 'package:local_stocks/model/cart_model.dart';
import 'cart_controller.dart';

class LIstCartItems extends StatelessWidget {
  LIstCartItems({required this.listCart, required this.text, Key? key}) : super(key: key);
  final List<CartModel> listCart;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listCart.length,
        itemBuilder: (BuildContext context, int index) => Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: controller.updateUiWidth(1.0) > 750
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: controller.updateUiWidth(0.25),
                  width: controller.updateUiWidth(0.25),
                  child: Image.asset(listCart[index].productImage ?? ""),
                ),
                SizedBox(
                  width: controller.updateUiWidth(
                      controller.updateUiWidth(1.0) > 750 ? 0.28 : 0.56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          listCart[index].productName ?? "",
                          style: buildTextStyle(16.0, FontWeight.w600,
                              LocalStocksColors.blackColor),
                        ),
                      ),
                      Container(
                        width: controller.updateUiWidth(
                            controller.updateUiWidth(1.0) > 750 ? 0.25 : 0.60),
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          listCart[index].description ?? "",
                          style: buildTextStyle(14.0, FontWeight.w400,
                              LocalStocksColors.blackColor),
                        ),
                      ),
                      buildRow(
                          controller,
                          "Price",
                          listCart[index].price ?? "",
                          16.0,
                          FontWeight.w600,
                          LocalStocksColors.blackColor),
                      buildRow(
                          controller,
                          "Seller",
                          listCart[index].seller ?? "",
                          14.0,
                          FontWeight.w500,
                          LocalStocksColors.successColor),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                text == "saveLaterCart" ?buildContainer(controller, "Move To Cart", Icons.shopping_cart, index,text):
                buildContainer(controller, "Save Later", Icons.save_alt, index,text),
                SizedBox(
                  width: 1.0,
                ),
                buildContainer(controller, "Remove", Icons.delete, index,text),
                SizedBox(
                  width: 1.0,
                ),
                text != "saveLaterCart" ? buildContainer(controller, "Buy This Now",
                    Icons.energy_savings_leaf_outlined, index,text):SizedBox(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(CartController controller, String text,
      IconData icon, int index, String saveLaterCart) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.0),
        border: Border.all(),
        color: LocalStocksColors.greyColor,
      ),
      width: controller
          .updateUiWidth(controller.updateUiWidth(1.0) > 750 ? saveLaterCart != "saveLaterCart" ? 0.19:0.29: saveLaterCart != "saveLaterCart" ? 0.33 : 0.49),
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          InkWell(
            child: Text(
              text,
              style: buildTextStyle(
                  14.0, FontWeight.w500, LocalStocksColors.blackColor),
            ),
            onTap: () {
              if (text == "Remove") {
                if (saveLaterCart == "saveLaterCart") {
                  controller.removeFromSaveLaterCart(index);
                } else {
                  controller.removeFromCart(index);
                }
              } else if (text == "Buy This Now") {
                // Get.toNamed(AppRoutes.orderConformation);
              } else if(text == "Move To Cart") {
                controller.addToCart(index);
              }else if(text == "Save Later"){
                controller.addSaveLaterCart(index);
                controller.removeFromCart(index);
              }
            },
          ),
        ],
      ),
    );
  }

}

Padding buildRow(CartController controller, String text, String text1,double fontSize,FontWeight fontWeight,Color color) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$text :",
          style: buildTextStyle(
              fontSize, fontWeight, LocalStocksColors.blackColor),
        ),
        Text(
          text1,
          style: buildTextStyle(fontSize, fontWeight, color),
        ),
      ],
    ),
  );
}
TextStyle buildTextStyle(double fontSize,FontWeight fontWeight,Color color) {
  return  TextStyle(
      fontSize: fontSize, fontWeight:fontWeight,color: color );
}