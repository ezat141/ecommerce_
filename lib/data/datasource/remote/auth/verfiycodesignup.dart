import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(
        AppLink.verifycodessignup, {"email": email, "verifyCode": verifycode});
    return response.fold((l) => l, (r) => r);
  }
  resendData(String email) async {
    var response = await crud.postData(
        AppLink.resendverifycodesignup, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
