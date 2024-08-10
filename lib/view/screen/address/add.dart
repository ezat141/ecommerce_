import 'package:ecommerce/controller/address/add_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerpage = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add new address'),
      ),
      body: GetBuilder<AddAddressController>(
          builder: ((controllerpage) => HandlingDataView(
              statusRequest: controllerpage.statusRequest,
              widget: Column(children: [
                if (controllerpage.kGooglePlex != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                      
                      GoogleMap(
                        mapType: MapType.hybrid,
                        markers: controllerpage.markers.toSet(),
                        onTap: (latlong) {
                          controllerpage.addMarkers(latlong);
                        },
                        initialCameraPosition: controllerpage.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controllerpage.completercontroller!
                              .complete(controllermap);
                        },
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          child: MaterialButton(
                            minWidth: 200,
                            onPressed: () {
                              controllerpage.goToPageAddDetailsAddress();
                            
                          },
                          color: AppColor.primaryColor, textColor: Colors.white,
                          child: const Text("complete", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),), ),
                        ),
                      )
                    ]),
                  )
              ])))),
    );
  }
}
