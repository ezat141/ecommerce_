import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/onboarding/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../widget/onboarding/custom_slider.dart';
import '../widget/onboarding/dot_controller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ;
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
