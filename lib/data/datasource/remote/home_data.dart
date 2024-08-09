import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';


class HomeData {
  Crud crud;
  HomeData(this.crud);
  // getData() async {
  //   var response = await crud.postData(AppLink.homepage, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  Future<Map<String, dynamic>> getData() async {
    var response = await crud.getData(AppLink.homepage);
    return response.fold((l) =>  throw l, (r) => r);
  }
  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"query": search});
    return response.fold((l) => l, (r) => r);
  }
}