import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/controller/changepassword_controller.dart';
import 'package:volunteer/share/constant/constant.dart';
import 'package:volunteer/view/screen/app/settings/setting_screen.dart';
import 'package:volunteer/view/screen/utils/helper.dart';
import 'package:volunteer/view/screen/widget/app_text_filed.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> with Helpers {



  String? _password1ErrorValue;

  String? _password2ErrorValue;
final controller = Get.put(ChangePassword_Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFEBEBEB),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFFEBEBEB),
          title: Text(
            'تغير كلمة المرور',
            style: GoogleFonts.cairo(
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
                color: mainColor
            ),
          ),
          actions: [IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_forward_ios, color: mainColor,)
          ),
          ]

      ),
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.w, vertical: 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'أدخل كلمة المرور',
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(height: 30,),
                      AppTextField(
                          hint: 'كلمة المرور',
                          prefixIcon: Icon(Icons.lock),
                          keyboardType: TextInputType.text,
                          controller: controller.passwordController,
                          emailTextController: controller.passwordController,
                          emailErrorValue: _password1ErrorValue
                      ),
                      SizedBox(height: 30.h,),
                      AppTextField(
                          hint: 'تأكيد كلمة المرور ',
                          prefixIcon: Icon(Icons.lock),
                          keyboardType: TextInputType.text,
                          controller: controller.confirmPasswordController,
                          emailTextController: controller
                              .confirmPasswordController,
                          emailErrorValue: _password2ErrorValue
                      ),
                      SizedBox(height: 30.h,),
                      ElevatedButton(
                        onPressed: () => {_performChange()},
                        child: Text (
                          'تغير كلمة المرور',
                          style: GoogleFonts.cairo(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 4, backgroundColor: mainColor,
                          minimumSize: Size(325.w, 50.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          )

      ),
    );
  }
  void _performChange(){
    if(controller.checkChangePassword()){
      changepassword();
    }
  }
  void changepassword(){
    Navigator.pop(context);
  }
}



