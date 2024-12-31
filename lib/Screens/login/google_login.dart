import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:get_test/Helper/get_routes.dart';
import 'package:get_test/Screens/login/login_getx.dart';
import 'package:get_test/Screens/reusable/bottom_draggable_info.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Helper/constants.dart';
import '../../Helper/shared_preference_fun.dart';
import 'login_repo.dart';

class GoogleLoginButton extends StatefulWidget {
  const GoogleLoginButton({super.key, required this.context});

  final BuildContext context;
  @override
  State<GoogleLoginButton> createState() => _GoogleLoginButtonState();
}

class _GoogleLoginButtonState extends State<GoogleLoginButton> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId: If needed, replace with your client ID
    scopes: ['email'],
  );

  Future<void> _signIn() async {
    try {
      _googleSignIn.signOut();
      GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account != null) {
        await handleSignIn(account); // Replace with your custom handling
      } else {
        debugPrint('Error login . Account not found');
      }
    } catch (error) {
      debugPrint('Error login . Account not found $error');
    }
  }

  LoginController loginController = Get.find();

  Future<void> handleSignIn(GoogleSignInAccount account) async {
    // Obtain authenticated user ID and other relevant information

    final GoogleSignInAuthentication auth = await account.authentication;
    final accessToken = auth.accessToken;
    final idToken = auth.idToken;
    loginController
        .tokenDetail("Access Token :  $accessToken       idToken : $idToken ");

    try {
      Response response = await logInRepository.googleSignIn(
        accessToken,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        loginController.tokenDetailResponse(response.data.toString());

        String token = response.data['token'];
        await SharedPreferencesHelper.save(SharedPreferenceKey.token, token);

        await SharedPreferencesHelper.saveInt(key: SharedPreferenceKey.userid, value: response.data['user_id']);

        Get.offAndToNamed(Routes.homePageAdmin);
      } else {
        log(response.data.toString());
        if (mounted) {
          showModalBottomSheet(
            context: widget.context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return CustomDraggableInfo(
                text: "Error!!",
                textcolor: AppColors.red,
                bodytext:
                    "Manager doesn't exist or manger not registered contact admin to register this email as manger",
                buttonText1: 'Okay',
                onPressed1: () {
                  Get.back();
                },
              );
            },
          );
        }
      }
    } catch (e) {
      log(e.toString());

      if (mounted) {
        showModalBottomSheet(
          context: widget.context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return CustomDraggableInfo(
              textcolor: AppColors.red,
              text: "Error!!",
              bodytext:
                  "Manager doesn't exist or manger not registered contact admin to register this email as manger",
              buttonText1: 'Okay',
              onPressed1: () {
                Get.back();
              },
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _signIn,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset('assets/images/googlelogo.png'),
          ),
          Text(
            'Sign in with google',
            style: context.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
