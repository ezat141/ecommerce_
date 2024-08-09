import 'package:ecommerce/view/screen/offers.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);  
}

class HomeScreenControllerImp extends HomeScreenController {

  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('Settings'),
        )
      ],
    ),
    const OffersView(),
    const Settings()
  ];

  List  bottomappbar = [
    {
      "title": "home",
      "icon": Icons.home,
    },
    {
      "title": "notification",
      "icon": Icons.notifications_active_outlined,
    },
    {
      "title": "offers",
      "icon": Icons.offline_bolt_outlined,
    },
    {
      "title": "settings",
      "icon": Icons.settings,
    },
  ] ;  
  @override
  void changePage(int currentpage) {
    this.currentpage = currentpage;
    update();
  }
  
  
  
}