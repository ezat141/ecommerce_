import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/getdecodepoyline.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
    Set<Polyline> polylineSet = {};

  GoogleMapController? gmc;
  List<Marker> markers = [];
  late StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  MyServices myServices = Get.find();

  double? currentlat;
  double? currentlong;
  double? destlat;
  double? destlong;

  CameraPosition? cameraPosition;



  initialData() {
    cameraPosition = CameraPosition(
      target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      zoom: 12.4746,
    );

    markers.add(Marker(
      markerId: const MarkerId("current"),
      position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
    ));
    // positionStream =
    //     Geolocator.getPositionStream().listen((Position? position) {
    //   print("================== Current Postion");
    //   currentlat = position!.latitude;
    //   currentlong = position.longitude;
    //   print(position.latitude);
    //   print(position.longitude);

    //   if (gmc != null) {
    //     gmc!.animateCamera(
    //         CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
    //   }
    //   markers.removeWhere((element) => element.markerId.value == "current");
      
    //   update();
    // });
  }



  initPolyLine() async{
    destlat = ordersModel.addressLat;
    destlong = ordersModel.addressLong;
    await Future.delayed(const Duration(seconds: 1));
    polylineSet= await getPolyLine(currentlat!, currentlong, destlat, destlong);
    update();

  }
  getlocationdelivery(){
    FirebaseFirestore.instance.collection("delivery").doc(ordersModel.ordersId.toString()).snapshots().listen((event){
      if (event.exists) {
        destlat = event.get("lat");
        destlong = event.get("long");
        updataMarkerDelivery(destlat, destlong);
      }
      
    });
  }

  updataMarkerDelivery(newlat, newlong) {
    markers.removeWhere((element) => element.markerId.value == "dest");
      markers.add(Marker(
        markerId: const MarkerId("dest"),
        position: LatLng(newlat, newlong),
      ));
      update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initialData();
    getlocationdelivery();
    
    // initPolyLine();
    super.onInit();
  }

  @override
  void onClose() {
    gmc!.dispose();
    super.onClose();
  }
}
