import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_stocks/local_themes/color_theme.dart';
import 'package:local_stocks/view/google_maps_location_selection/location_selection_controller.dart';

class LocationPickMap extends StatelessWidget {
 const LocationPickMap({Key, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationSelectionController>(

      builder: (viewModel) => SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Text(
                          'Search Place',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  // decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     prefixIcon: Icon(Icons.search),
                  //     hintText: 'Search Place'),
                  // ),
                ),
                Expanded(
                  child: GoogleMap(
                    zoomControlsEnabled: true,
                    myLocationEnabled: true,
                    tiltGesturesEnabled: true,
                    compassEnabled: true,
                    initialCameraPosition: viewModel.googlePlex,
                    onCameraMove: viewModel.moved,
                    onCameraIdle: viewModel.locationTextUpdate,
                    onTap: viewModel.onMapTap,
                    onMapCreated: (GoogleMapController controller) {
                      viewModel.mapController.complete(controller);
                    },
                    markers: {
                      Marker(
                        markerId: MarkerId('user'),
                        position: viewModel.pickedLocation,
                      )
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select your location from the map',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: LocalStocksColors.secondaryBackgroundColor,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Move the map pin to find your location and select the new address',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      Row(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: SvgPicture.asset(R.assetsImgLocationPin),
                          // ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width,
                              child: Text("${viewModel.locText}",
                                  overflow: TextOverflow.clip,
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'Roboto')),
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                        height: 1,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // AppButton(
                      //   onTap: viewModel.submit,
                      //   type: AppButtonType.MEDIUM,
                      //   text: "Save & Continue",
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}