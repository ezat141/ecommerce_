import 'dart:async';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];
  double? lat;
  double? long;

  addMarkers(LatLng lating) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: lating));
    lat = lating.latitude;
    long = lating.longitude;
    // statusRequest = StatusRequest.none;
    update();
  }

  Position? postion;

  CameraPosition? kGooglePlex;

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressadddetails, arguments: {
      "lat": lat.toString(), "long": long.toString(),
    });
  }

  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(postion!.latitude, postion!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(postion!.latitude, postion!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
