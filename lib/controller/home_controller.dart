import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:ecommerce/data/model/productsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
  // goToPageProductDetails(ProductsModel productsModel);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  // List<ProductsModel> listdata = [];

  String? username;
  String? id;



  String titleHomeCard = "";
  String bodyHomeCard = "";
  int? deliveryTime;

  // HomeData homedata = HomeData(Get.find());


  // List data = [];
  List categories = [];
  List products = [];
  List settingsdata = [];


  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        products.addAll(response['products']);
        settingsdata.addAll(response['settings']);
        titleHomeCard = settingsdata[0]['setting_name'];
        bodyHomeCard = settingsdata[0]['settings_bodyhome'];
        deliveryTime = settingsdata[0]['settings_deliverytime'];
        myServices.sharedPreferences
            .setString("deliverytime", deliveryTime.toString());
      } else {
        Get.defaultDialog(title: "ُWarning", middleText: "Email Not Found");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.products, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  goToPageProductDetails(ProductsModel productsModel) {
    Get.toNamed("productdetails", arguments: {"productsModel": productsModel});
  }
}


class SearchMixController extends GetxController{ 
    List<ProductsModel> listdata = [];
    late StatusRequest statusRequest;
    HomeData homedata = HomeData(Get.find());
    TextEditingController? search;
    bool isSearch = false;

    
  checkSearch(val){
    if(val == ""){
      isSearch = false;
    }
    update();
  }
  onSearchProducts(){
    if (search!.text.isEmpty) {
      Get.defaultDialog(title: "Warning", middleText: "Search field is empty");
      return;
    }
    isSearch = true;
    searchData();
    update();

  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ProductsModel.fromJson(e)));      
      } else {
        Get.defaultDialog(title: "ُWarning", middleText: "Dta Not Found");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  





}
