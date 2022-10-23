
import 'package:get/get.dart';
import 'package:local_stocks/view/google_maps_location_selection/location_selection_controller.dart';

class LocationSelectionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LocationSelectionController());
  }

}