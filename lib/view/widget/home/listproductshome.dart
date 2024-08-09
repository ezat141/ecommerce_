import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/productsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProductsHome extends GetView<HomeControllerImp> {
  const ListProductsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.products.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                productsModel: ProductsModel.fromJson(controller.products[i]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ProductsModel productsModel;
  const ItemsHome({Key? key, required this.productsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.goToPageProductDetails(productsModel),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              "${productsModel.image}",
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            height: 120,
            width: 200,
          ),
          Positioned(
              left: 10,
              child: Text(
                "${productsModel.productName}",
                style: const TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 14),
              ))
        ],
      ),
    );
  }
}