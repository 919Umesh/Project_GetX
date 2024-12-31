// ignore_for_file: avoid_void_async

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_test/Helper/constants.dart';
import 'package:get_test/Screens/reusable/appbar_login.dart';
import 'package:get_test/Screens/reusable/icon_button_b.dart';
import 'package:get_test/utils/figmaUtils/design_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Helper/get_routes.dart';
import '../reusable/bottom_snackbar_custom.dart';
import 'login_getx.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarLogin(
        title: "Client Login",
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return CustomDraggableSnackbar(
                      text: "Switch to Admin Profile ?",
                      bodytext: "You will be redirect to admin mode, you will need special permission to enter manager mode.",
                      midChild: const SizedBox(),
                      buttonText1: 'Cancel',
                      onPressed1: () {
                        Get.back();
                      },
                      buttonText2: 'Switch',
                      onPressed2: () {
                        Get.offAllNamed(Routes.signupadmin);
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
              Text("Test",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40.adaptSize,
                      fontWeight: FontWeight.w700,
                      height: 1,
                      color: AppColors.primary)),
              SizedBox(
                height: 80.adaptSize,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Project Code",
                  style: TextStyle(
                    // fontFamily: "Inter",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkGrey,
                    height: 17 / 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(
                height: 8.adaptSize,
              ),

              FormBuilder(
                key: controller.formKeyCode,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      // autofillHints: const ["Enter Project Code"],

                      name: 'project_code',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value == "") {
                          return 'Project code can not be empty ';
                        }

                        if (value.length > 8) {
                          return 'Enter 8 Digit project Code';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter project code eg.pj-XXXX",
                        hintStyle: const TextStyle(color: AppColors.mediumGrey),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20.adaptSize,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: CustomIconButtonB(
                        text: "Enter",
                        icon: Icons.arrow_forward,
                        onPressed: () {
                          controller.trySubmitCode();
                        },
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 32.adaptSize,
              ),
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

              // SizedBox(
              //     width: double.maxFinite,
              //     height: 48.adaptSize,
              //     child: const GoogleLoginButton()),
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
