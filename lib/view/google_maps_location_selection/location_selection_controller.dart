import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:place_picker/place_picker.dart';
class LocationSelectionController extends GetxController {
  LatLng _locationData = LatLng(0.0, 0.0);

  LatLng get pickedLocation => _locationData;
  final Completer<GoogleMapController> _controller = Completer();

  Completer get mapController => _controller;
  CameraPosition _kGooglePlex = CameraPosition(target: LatLng(0.0, 0.0));

  CameraPosition get googlePlex => _kGooglePlex;
  String? _selectedAddress;
  String locText = '';

  LocationPickMapViewModel() {
    fetchLocation();
  }

  onMapTap(position) async {
    _locationData = position;
   update();
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newLatLngZoom(_locationData, 16))
        .catchError((e) {
      print(position);
    });
  }

  /*pickPlace() async {
    try {
      LocationResult locationResult = await navService.navigateToView(
          PlacePicker('AIzaSyD1lCyCP4Qyq9nfuTVBGQnNovwntdcYqY0'));

      if (locationResult != null) {
        onMapTap(locationResult.latLng);
      }
    } catch (e, s) {
      print("$e , $s");
    }
  }*/

  fetchLocation() async {
    try {
      PermissionStatus _permissionGranted;
      _permissionGranted = await Permission.location.status;
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await Permission.location.request();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      Position _temp = await Geolocator.getCurrentPosition();
      _locationData = LatLng(_temp.latitude, _temp.longitude);
      final GoogleMapController controller = await _controller.future;
      controller
          .animateCamera(CameraUpdate.newLatLngZoom(_locationData, 16))
          .catchError((e) {});
      locationTextUpdate();
      update();
    } catch (e, s) {
      print("$e , $s");
    }
  }

  moved(CameraPosition cp) async {
    try {
      _kGooglePlex = cp;
      _locationData = cp.target;
    } catch (e, s) {
      print("$e , $s");
    }
    update();
  }

  locationTextUpdate() async {
    try {
      List<Location> locations = await locationFromAddress("Buchireddypalem, spsrNellore");
      print("locationslocations ${locations.first.latitude}    ${locations.first.longitude}");


      List<Placemark> placemarks = await placemarkFromCoordinates(_locationData.latitude, _locationData.longitude);

      // var address = await Geocoder.local.findAddressesFromCoordinates(
      //     Coordinates(_locationData.latitude, _locationData.longitude));
      locText = placemarks.first.postalCode ?? "";
      _selectedAddress = locText;
    } catch (e, s) {
      print("$e , $s");
    }
    update();
  }

  /*submit() {
    if (_selectedAddress != null) {
      navService.back(result: _selectedAddress);
    } else {
      utilsService.showToast("User address cannot be empty");
    }
  }*/

@override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    locationTextUpdate();
  }
}
