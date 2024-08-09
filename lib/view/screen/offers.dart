import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/offers_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/offers/customproductsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return  GetBuilder<OffersController>(
      builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, 
      widget: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.data.length,
        itemBuilder: ((context, index) => CustomListProductsOffers(
                      productsModel:
                          controller.data[index],
                    )),)));
  }
}