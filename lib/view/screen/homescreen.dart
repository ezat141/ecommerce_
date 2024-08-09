import 'dart:io';

import 'package:ecommerce/controller/homescreen_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.cart);
                  },
                  child: const Icon(Icons.shopping_basket_outlined)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: PopScope(
                  child: controller.listPage.elementAt(controller.currentpage),
                  onPopInvoked: (shouldPop) async {
                    await Get.defaultDialog(
                      title: "warning",
                      titleStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                      middleText: "Are you sure you want to exit?",
                      onCancel: () {},
                      cancelTextColor: AppColor.secondColor,
                      confirmTextColor: AppColor.secondColor,
                      buttonColor: AppColor.thirdColor,
                      onConfirm: () {
                        exit(0);
                      },
                    );
                    shouldPop = false;
                  }),
            ));
  }
}
