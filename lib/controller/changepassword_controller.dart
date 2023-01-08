
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:volunteer/view/screen/app/settings/setting_screen.dart';

import '../view/screen/utils/custom_snakbar.dart';

class ChangePassword_Controller extends GetxController {

  late TextEditingController
  passwordController,
      confirmPasswordController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


  checkChangePassword() {
    if (passwordController.text.isEmpty) {
      customSankbar("! خطأ", "يجب ادخال كلمة السر", "error");
      return;
    }
    else if (passwordController.text != confirmPasswordController.text) {
      customSankbar("! خطأ", "! كلمة السر غير متطابقة", "error");
      return;
    }
  }


  changepasswod() async {
    Get.to(() => SettingScreen());
  }
}