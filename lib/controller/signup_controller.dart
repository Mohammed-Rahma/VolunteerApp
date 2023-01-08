

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:volunteer/view/screen/auth/login_screen.dart';
import 'package:volunteer/view/screen/utils/custom_snakbar.dart';
import 'package:volunteer/view/screen/widget/loader.dart';

class Signup_Controller extends GetxController{

  late TextEditingController nameController,
   emailController,
      phoneController,
   passwordController,
   confirmPasswordController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    emailController=TextEditingController();
    phoneController=TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController=TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  checkSignup(){
    if(nameController.text.isEmpty){
      customSankbar("! خطأ", "يجب إدخال الأسم ", "error");
      return;
    }
    else if(emailController.text.isEmpty || GetUtils.isEmail(emailController.text)==false){
      customSankbar("! خطأ", "يجب إدخال البريد الإلكتروني صحيح", "error");
      return;
    }
    else if(emailController.text.isEmpty ){
      customSankbar("! خطأ", "يجب إدخال رقم الهات ", "error");
      return;
    }
    else if(passwordController.text.isEmpty){
      customSankbar("! خطأ", "يجب ادخال كلمة السر", "error");
      return;
    }
    else if(passwordController.text != confirmPasswordController.text){
      customSankbar("! خطأ", "! كلمة السر غير متطابقة", "error");
      return;
    }
    else {
      Get.showOverlay(asyncFunction:()=> SignUp(),loadingWidget:Loader());
    }

  }
  void PerformSignUp(){
    if(checkSignup()){
      SignUp();
    }
  }

  SignUp()async{
    Get.to(()=>LoginScreen());  }
}