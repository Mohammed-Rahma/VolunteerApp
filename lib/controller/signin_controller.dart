

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:volunteer/view/screen/auth/login_screen.dart';
import 'package:volunteer/view/screen/utils/custom_snakbar.dart';
import 'package:volunteer/view/screen/widget/loader.dart';

class SignInController extends GetxController{

  late TextEditingController
      emailController,
      passwordController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController=TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  checkSignIn(){

     if(emailController.text.isEmpty || GetUtils.isEmail(emailController.text)==false){
      customSankbar("! خطأ", "يجب إدخال البريد الإلكتروني صحيح", "error");
      return;
    }
    else if(passwordController.text.isEmpty){
      customSankbar("! خطأ", "يجب ادخال كلمة السر", "error");
      return;
    }

    else {
      Get.showOverlay(asyncFunction:()=> SignIn(),loadingWidget:Loader());
    }

  }
  void PerformSignIn(){
    if(checkSignIn()){
      SignIn();
    }
  }

  SignIn()async{
    Get.to(()=>LoginScreen());  }
}