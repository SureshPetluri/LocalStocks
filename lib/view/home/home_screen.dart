import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:local_stocks/login/login_Screen.dart';
import 'package:local_stocks/routes/route_constants.dart';
import 'package:local_stocks/view/home/home_controller.dart';
import 'package:local_stocks/view/widgets/textfield_value_change.dart';
import 'carousel_widget.dart';
import 'package:flutter/foundation.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) =>Scaffold(
        appBar: AppBar(title: Text("Home Screen"),
        actions: [
          IconButton(
              splashRadius:0.5,
              onPressed: (){
                Get.dialog(const LoginScreen());
              }, icon: const Icon(Icons.login_outlined),),
        ],),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          visible: true,
          switchLabelPosition: true,
          renderOverlay: true,
          useRotationAnimation: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          activeForegroundColor: Colors.white,
          activeBackgroundColor: Colors.blue,
          elevation: 8.0,
          isOpenOnStart: false,
          animationCurve: Curves.elasticInOut,
          shape: const StadiumBorder(),
          children: [
            SpeedDialChild(
              child: const Icon(Icons.camera_alt_rounded),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              label: 'Add Selfie',
              onTap: () {},
            ),
            SpeedDialChild(
              child: const Icon(Icons.add_circle),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              label: 'Add Tok',
              onTap: () {},
            ),
            SpeedDialChild(
              child: const Icon(Icons.add_circle),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              label: 'to Local',
              onTap: () => controller.DateFormatChangeToUtc(),
            ),
          ],
        ),
        body:  Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(50),
                     width: controller.updateUiWidth(0.5, controller),
                    child: TextFormField(
                      inputFormatters: [
                        //DateFormatter
                        // CardFormatter(sample: "**/**/****",separator: '/')
                        //normal
                         CardFormatter(sample: "********",separator: '/')
                      ],
                      controller: controller.searchController,
                      onChanged: (text){
                        if(text == "laptops"){
                         controller.scrollToBottom();
                        }else if(text == "mobiles"){
                          controller.scrollToTop();
                        }else if(text == 'books'){
                          controller.scrollToBooks();
                        }else if(text == 'iphone'){
                          controller.scrollToIphone();
                        }
                      },
                      decoration: InputDecoration(
                        border:  OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 6.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    )),
                Text("Select Ur Location"),
                IconButton(
                  splashRadius:0.5,
                  onPressed: (){
                    Get.toNamed(AppRoutes.googleLocationPicker);
                  }, icon: const Icon(Icons.location_on_rounded),),
              ],
            ),
            Expanded(
              child: ListView.builder(
                controller: controller.listScrollController,
                  itemCount: controller.images2.length,
                  itemBuilder: (BuildContext context, int index) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OffersSectionContent(controller: controller,carousalList: controller.images2[index+1] ?? [],),
                  ),  ),
            ),
          ],
        ),
      )
    );
  }
}
