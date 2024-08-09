import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class OfferData {
  Crud crud;
  OfferData(this.crud);
  Future<Map<String, dynamic>> getOffers() async {
    var response = await crud.getData(AppLink.offers);
    return response.fold((l) => throw l, (r) => r);
  }
}
