import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/auth/verfiycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());

  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verfiyCodeSignUpData.postdata(email!, verfiyCodeSignUp);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      // Check if the response is a ServerFailure
      if (response is ServerFailure) {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Server Error: ${response.errMessage}");
        statusRequest = StatusRequest.failure;
      } else {
        // Assuming the response is successful, handle success status
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successSignUp);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Verify Code Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
  resend(){
    verfiyCodeSignUpData.resendData(email!);
  }
}
