import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_test/Screens/on_boarding/on_boarding_getX.dart';
import 'package:lottie_screen_onboarding_flutter/introscreenonboarding.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroScreenOnboarding(
          introductionList: controller.list,
          onTapSkipButton: () =>  Get.offNamed('/onBoardingPage'),
          backgroudColor: const Color.fromARGB(255, 213, 213, 213),
          foregroundColor: const Color.fromARGB(255, 112, 86, 208),
          skipTextStyle: const TextStyle(
            color: Color.fromARGB(255, 112, 86, 208),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

// class OnBoardingScreen extends GetView<OnBoardingController> {
//   const OnBoardingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: IntroScreenOnboarding(
//             introductionList: list,
//             onTapSkipButton: () => Routes.getProjectHomepageAdmin,
//             backgroudColor:const Color.fromARGB(255, 213, 213, 213),
//             foregroundColor: const Color.fromARGB(255, 112, 86, 208),
//             skipTextStyle: const TextStyle(
//               color: Color.fromARGB(255, 112, 86, 208),
//               fontSize: 18,
//
//             ),
//           )
//       ),
//     );
//   }
// }