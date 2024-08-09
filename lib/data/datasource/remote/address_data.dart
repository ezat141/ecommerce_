

import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.addressView, {"address_usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "address_usersid": usersid,
      "address_name": name,
      "address_city": city,
      "address_street": street,
      "address_lat": lat,
      "address_long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response =
        await crud.postData(AppLink.addressDelete, {"id": addressid});
    return response.fold((l) => l, (r) => r);
  }
}