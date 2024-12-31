import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart' hide FormData, Response;
import 'package:get_test/Screens/login/login_repo.dart';
import 'package:get_test/utils/theme/theme.dart';
import '../../Helper/constants.dart';
import '../../Helper/get_routes.dart';
import '../../Helper/shared_preference_fun.dart';
import '../reusable/snackbar_custom.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final formKeyCode = GlobalKey<FormBuilderState>();
  RxBool isPassHidden = true.obs;
  RxString hidePassText = 'Show'.obs;
  RxBool submitLoading = false.obs;
  RxBool showHelp = false.obs;

  RxString tokenDetail = ''.obs;
  RxString tokenDetailResponse = ''.obs;

  Future trySubmitLogin() async {
    // Get.toNamed(Routes.wrapperPage);

    Get.focusScope!.unfocus();
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    Response response = await logInRepository
        .signIn(FormData.fromMap(formKey.currentState!.value));

    if (response.statusCode == 200) {
      String token = response.data['token'];
      await SharedPreferencesHelper.save(SharedPreferenceKey.token, token);
      await SharedPreferencesHelper.saveInt(key: SharedPreferenceKey.userid, value: response.data['user_id']);
      if (response.data['token'] != null && response.data['is_complete']) {
        Get.offAndToNamed(Routes.homePageAdmin);
      } else {
//TODO
      }
    } else {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
            'Couldn\'t log in, make sure the email and password are correct.',
            'If you haven\'t activated your account yet, please check your email for an activation link. If the problem persists, try resetting your password. ',
            backgroundColor: PrimaryColors.white900,
            borderWidth: 1,
            borderColor: PrimaryColors.gray60001,
            duration: const Duration(seconds: 6));
      }
    }
  }

  void showPassword() {
    isPassHidden.value = !isPassHidden.value;
    hidePassText.value = isPassHidden.value == false ? 'Hide' : 'Show';
  }

  Future trySubmitCode() async {
    // Get.toNamed(Routes.wrapperPage);

    Get.focusScope!.unfocus();
    final isValid = formKeyCode.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKeyCode.currentState!.save();

    try {
      Response response = await logInRepository.getProjectCode(formKeyCode.currentState!.value["project_code"]);

      if (response.statusCode == 200) {
        String token = response.data['token'];
        await SharedPreferencesHelper.save(SharedPreferenceKey.token, token);

        await SharedPreferencesHelper.saveInt(
            key: SharedPreferenceKey.userid, value: response.data['user_id']);
        if (response.data['token'] != null) {
          Get.offAndToNamed(Routes.homePageAdmin);
        } else {
          //TODO
        }
      } else {
        showHelp(true);
        showCustomSnackbar(
          title: "Project Doesn't exist",
          message: "Make sure you have correct project code.Contact admin",
        );
      }
    } catch (e) {
      showHelp(true);
      showCustomSnackbar(
        title: "Project Doesn't exist",
        message: "Make sure you have correct project code.Contact admin",
      );
    }
  }
}
