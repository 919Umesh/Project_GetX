// ignore_for_file: avoid_void_async

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Helper/get_routes.dart';
import 'package:get_test/Screens/reusable/appbar_login.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../reusable/bottom_snackbar_custom.dart';
import 'google_login.dart';
import 'login_getx.dart';

class LoginScreenAdmin extends GetView<LoginController> {
  const LoginScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarLogin(
        title: "Manager Login",
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return CustomDraggableSnackbar(
                      text: "Switch to Admin Client ?",
                      bodytext:
                          "You will be redirect to client mode, you will need proejct code to continue",
                      midChild: const SizedBox(),
                      buttonText1: 'Cancel',
                      onPressed1: () {
                        Get.back();
                      },
                      buttonText2: 'Switch',
                      onPressed2: () {
                        Get.offAllNamed(Routes.signin);
                      },
                    );
                  },
                );
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 64.adaptSize),
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
              SizedBox(height: 20.adaptSize),
              Text("Shanti\nEngineering",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40.adaptSize,
                      fontWeight: FontWeight.w700,
                      height: 1,
                      color: AppColors.primary)),
              SizedBox(
                height: 80.adaptSize,
              ),
              SizedBox(
                height: 8.adaptSize,
              ),
              SizedBox(
                  width: double.maxFinite,
                  height: 48.adaptSize,
                  child: GoogleLoginButton(
                    context: context,
                  )),
              Obx(() {
                return Visibility(
                  visible: controller.showHelp.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Having trouble getting project info ?"),
                      SizedBox(
                        height: 8.adaptSize,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: CustomIconButtonF(
                          text: "Contact project manager",
                          icon: Icons.call,
                          onPressed: () {
                            launchDialer("9779826193973");
                          },
                        ),
                      )
                    ],
                  ),
                );
              }),
              SizedBox(
                height: 28.adaptSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

launchUserAgreement() async {
  const url =
      'https://play.google.com/store/apps/details?id=com.nepindidev.easy_snake_ladders';
  try {
    await launchUrl(
      Uri.parse(url),
    );
  } catch (e) {
    throw 'Could not launch $url';
  }
}

launchPrivacyPolicy() async {
  const url =
      'https://play.google.com/store/apps/details?id=com.nepindidev.easy_snake_ladders';
  try {
    await launchUrl(
      Uri.parse(url),
    );
  } catch (e) {
    throw 'Could not launch $url';
  }
}

void launchDialer(String phoneNumber) async {
  final Uri phoneUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  try {
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  } catch (e) {
    print('Errorrr: $e');
    throw 'Could not launch $phoneUri';
  }
}
