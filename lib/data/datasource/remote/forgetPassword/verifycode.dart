import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifycodeforgetpassword,
        {"email": email, "verifyCode": verifyCode});
    return response.fold((l) => l, (r) => r);
  }
}
