import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommerce/data/model/myfavorite.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

//  key => id items
//  Value => 1 OR 0

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      // if (response['status'] == "success") {
      //   List <dynamic>responsedata = response['data'];
      //   data.addAll(responsedata.map((item) {
      //     return MyFavoriteModel.fromJson(item);
      // }));

      //   print("data");
      //   print(data);
      // }
      if (response['status'] == "success") {
        List<dynamic> responseData = response['data'];
        data.addAll(responseData
            .map((item) => MyFavoriteModel.fromJson(item))
            .toList());
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromFavorite(String favoriteId) async {
    // data.clear();
    var response = await favoriteData.deleteData(favoriteId);
    data.removeWhere((element) => element.sId == favoriteId);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
    
  }
}
