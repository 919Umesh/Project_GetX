
import 'package:get/get.dart';
import 'package:lottie_screen_onboarding_flutter/introduction.dart';

class OnBoardingController extends GetxController {
  final isLoading = false.obs;


  //Lotte json animation
  final List<Introduction> list = [
    Introduction(
      lottieUrl: 'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
      title: 'Welcome',
      subTitle: 'Enjoy effortless daily weather updates and stay ahead of the weather.',
    ),
    Introduction(
      lottieUrl: 'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
      title: 'At Your Location',
      subTitle: 'Know the weather anytime with one click at your location.',
    ),
    Introduction(
      lottieUrl: 'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
      title: 'Explore world',
      subTitle: 'You can search and discover weather forecasts for cities around the globe.',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    // Initialize any required data here
  }
}