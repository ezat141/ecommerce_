import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData(String userid) async {
    var response =
        await crud.postData(AppLink.pendingorders, {"orders_usersid": userid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int orderid) async {
    var response = await crud.postData(AppLink.ordersdelete, {"orders_id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
