import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/categoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoryModel:
                CategoryModel.fromJson(controller.categories[index]), 
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoryModel categoryModel;
  final int? i;
  const Categories({Key? key, required this.categoryModel, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItems(controller.categories, i!, categoryModel.sId!);
        
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
                "${categoryModel.image}",
                color: AppColor.secondColor),
          ),
          Text(
            "${categoryModel.categoryName}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}