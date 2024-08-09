import 'package:ecommerce/controller/products_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/categoryModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesProducts extends GetView<ProductsControllerImp> {
  const ListCategoriesProducts({Key? key}) : super(key: key);

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

class Categories extends GetView<ProductsControllerImp> {
  final CategoryModel categoryModel;
  final int? i;
  const Categories({Key? key, required this.categoryModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(controller.categories, i!);
        controller.changeCat(i!, categoryModel.sId!);
      },
      child: Column(
        children: [
          GetBuilder<ProductsControllerImp>(
              builder: (controller) => Container(

                    padding: const EdgeInsets.only(right: 10 , left: 10 , bottom: 5),
                    decoration: controller.selectedCat == i
                        ? const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 3, color: AppColor.primaryColor)))
                        : null,
                    child: Text(
                      "${categoryModel.categoryName}",
                      style:
                          const TextStyle(fontSize: 20, color: AppColor.grey2),
                    ),
                  ))
        ],
      ),
    );
  }
}