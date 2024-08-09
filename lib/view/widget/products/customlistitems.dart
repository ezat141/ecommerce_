import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/products_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/productsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListProducts extends GetView<ProductsControllerImp> {
  final ProductsModel productsModel;

  const CustomListProducts({
    Key? key,
    required this.productsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => controller.goToPageProductDetails(productsModel),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: "${productsModel.image}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 10),
                  Text(productsModel.productName!,
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        child: const Icon(Icons.timer_sharp, color: AppColor.grey),
                      ),
                      const SizedBox(width: 4,),
                      Text("${controller.deliveryTime} Minute", textAlign: TextAlign.center, style: const TextStyle(fontFamily: "sans"),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${productsModel.productPrice} \$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if(controller.isFavorite[productsModel.sId] == true){
                                controller.setFavorite(productsModel.sId, false);
                                controller.removeFavorite(productsModel.sId!);
                              } else{
                                controller.setFavorite(productsModel.sId, true);
                                controller.addFavorite(productsModel.sId!);
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[productsModel.sId] == true
                              
                              ?Icons.favorite
                              : Icons.favorite_border_outlined,
                              color: AppColor.primaryColor,
                            )),
                      )
                    ],
                  )
                ]),
          ),
        ));
  }
}
