import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_stocks/local_themes/color_theme.dart';
import 'package:local_stocks/routes/route_constants.dart';
import 'home_controller.dart';

/// filter selection
/*
class FilterSelectionContent extends StatelessWidget {
  const FilterSelectionContent({Key? key, required this.controller})
      : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppTextTheme.updateUiWidth(0.01, controller),
        right: AppTextTheme.updateUiWidth(0.01, controller),
      ),
      width: AppTextTheme.updateUiWidth(1.0, controller),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SelectionContentValue(controller: controller, title: 'Category'),
          SelectionContentValue(controller: controller, title: 'Product'),
          SelectionContentValue(controller: controller, title: 'Type'),
        ],
      ),
    );
  }
}

/// content values
class SelectionContentValue extends StatelessWidget {
  const SelectionContentValue(
      {Key? key, required this.controller, required this.title})
      : super(key: key);
  final HomeController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppTextTheme.updateUiWidth(0.008, controller),
      ),
      child: InkWell(
        hoverColor: LocalStocksColors.secondaryColor,
        child: Container(
          padding: EdgeInsets.all(
            AppTextTheme.updateUiWidth(0.01, controller),
          ),
          decoration: BoxDecoration(
            color: LocalStocksColors.primaryBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                AppTextTheme.updateUiWidth(0.08, controller),
              ),
            ),
          ),
          child: Row(
            children: [
              Text(title),
              SizedBox(width: AppTextTheme.updateUiWidth(0.003, controller)),
              Icon(
                Icons.arrow_drop_down_circle_rounded,
                size: AppTextTheme.updateUiWidth(0.008, controller),
              )
            ],
          ),
        ),
        onTap: () {
          // OnClickSelectionContentValue(controller: controller);
        },
      ),
    );
  }
}
*/

/*
class OnClickSelectionContentValue extends StatelessWidget {
  const OnClickSelectionContentValue({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppTextTheme.updateUiWidth(0.08, controller),
      height: AppTextTheme.updateUiWidth(0.08, controller),
      color: LocalStocksColors.successColor,
    );
  }
}
*/

/// offers section
class OffersSectionContent extends StatelessWidget {
  const OffersSectionContent({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        controller.updateUiWidth(0.004, controller),
      ),
      decoration: BoxDecoration(
        color: LocalStocksColors.primaryBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            controller.updateUiWidth(0.003, controller),
          ),
        ),
      ),
      width: controller.updateUiWidth(0.76, controller),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: controller.updateUiWidth(0.53, controller),
            height: controller.updateUiWidth(0.26, controller),
            child: DisplayCarouselSlider(
              // itemList: controller.images,
              main: true, controller: controller,
            ),
          ),
          Container(
            width: controller.updateUiWidth(0.22, controller),
            height: controller.updateUiWidth(0.26, controller),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: controller.updateUiWidth(0.129, controller),
                  child: DisplayCarouselSlider(
                    // itemList: controller.images1,
                    main: false, controller: controller,
                  ),
                ),
                Container(
                  height: controller.updateUiWidth(0.129, controller),
                  child: DisplayCarouselSlider(
                    // itemList: controller.images2,
                    main: false, controller: controller,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// CarouselSlider.builder to show images
class DisplayCarouselSlider extends StatelessWidget {
  const DisplayCarouselSlider(
      {Key? key,
        /*required this.itemList*/ required this.main,
        required this.controller})
      : super(key: key);

  // final List itemList;
  final bool main;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: controller.list.length,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        viewportFraction: 1.0,
        enlargeCenterPage: true,
        scrollDirection: main ? Axis.vertical : Axis.horizontal,
      ),
      itemBuilder: (context, index, realIdx) {

         var productEntry = controller.list[index];
        return Container(
          child: Center(
            child: controller.isImage(productEntry ?? "")
                ? InkWell(
              onTap: () {
                Get.toNamed(
                    AppRoutes.cart,);
              },
              child: Image.network(
                productEntry ?? "",
              ),
            )
                : Image.asset(
              'assets/images/image_placeholder.png',
            ),
          ),
        );
      },
    );
  }
}

/*
class GridViewListOfProducts extends StatelessWidget {
  const GridViewListOfProducts({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppTextTheme.updateUiWidth(0.90, controller),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 180,
          childAspectRatio: controller.updateUiWidth(1.0) < 350
              ? 0.45
              : controller.updateUiWidth(1.0) > 750
              ? 0.7
              : 0.6,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: controller.getAllProductsModel?.data?.length,
        itemBuilder: (BuildContext context, index) {
          var productEntry = controller.getAllProductsModel?.data?[index];
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: LocalStocksColors.appBarColor,
                border: Border.all(width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Center(
                child: Column(
                  children: [
                    */
/*  Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: () {
                                                controller.deleteProduct(
                                                    productEntry?.id ?? 0);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 15.0,
                                                ),
                                              ),
                                            ),
                                          ),*//*

                    InkWell(
                      onTap: () {
                        Get.toNamed(
                            AppRoutes(id: productEntry?.id)
                                .DirectProductDetailsPage,
                            arguments: productEntry?.id);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height:
                              AppTextTheme.updateUiHeight(0.1, controller),
                              color: LocalStocksColors.appBarColor,
                              child:
                              controller.isImage(productEntry?.imgUrl ?? "")
                                  ? Image.network(
                                productEntry?.imgUrl ?? "",
                              )
                                  : Image.asset(
                                'assets/images/image_placeholder.png',
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: CustomText(
                                      fontweight: FontWeight.w600,
                                      fontSize: 14,
                                      text:
                                      "${productEntry?.name?.toUpperCase() ?? ''}"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: CustomText(
                                    fontSize: 12,
                                    text: "${productEntry?.description ?? ''}",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: CustomText(
                                      fontweight: FontWeight.w700,
                                      text: "\$ ${productEntry?.price ?? ''}",
                                      fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// text
  Widget CustomText({String? text, double? fontSize, FontWeight? fontweight}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "${text}",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: LocalStocksColors.blackColor,
            fontSize: fontSize,
            fontWeight: fontweight,
          ),
        ),
      ),
    );
  }
}
*/
