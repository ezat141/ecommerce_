

import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.ordersarchive, {"orders_usersid": userid});
    return response.fold((l) => l, (r) => r);
  }

  rating(int ordersid, int rating, String comment) async {
    var response = await crud.postData(AppLink.rating, {"orders_id": ordersid, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}
