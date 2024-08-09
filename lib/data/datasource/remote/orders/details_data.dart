import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(int id) async {
    var response = await crud.postData(AppLink.ordersdetails, {"ordersid": id});
    return response.fold((l) => l, (r) => r);
  }
}
