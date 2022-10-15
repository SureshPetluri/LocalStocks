import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_stocks/view/home/home_controller.dart';
import 'carousel_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) =>Scaffold(
        body: Center(child: OffersSectionContent(controller: controller)),
      )
    );
  }
}
