

import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartadd, {"cart_usersid": usersid, "cart_productsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {"cart_usersid": usersid, "cart_productsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartgetcountitems, {"cart_usersid": usersid, "cart_productsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartview, {
      "cart_usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {"coupon_name": couponname});
    return response.fold((l) => l, (r) => r);
  }
}