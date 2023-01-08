import 'package:flutter/gestures.dart';
import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/api/api_response.dart';
import 'package:volunteer/api/auth_api_controller.dart';
import 'package:volunteer/api/context_extintion.dart';
import 'package:volunteer/controller/setState.dart';
import 'package:volunteer/view/screen/utils/helper.dart';
import 'package:volunteer/view/screen/widget/app_text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {


  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TapGestureRecognizer _tapGestureRecognizer;

  String? _emailErrorValue ;
  String? _passwordErrorValue;

  final LoginController controller = Get.put(LoginController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = CreateNewAccountAction;
  }
  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void CreateNewAccountAction(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 116.w),
                  child: Image.asset(
                    'images/logo.png',
                    height: 120.h,
                    width: 120.w,
                  ),
                ),
                SizedBox(height: 5.h,),
                Text(
                  'تسجيل الدخول',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.sp,
                      color : Color(0xFF4871C0)
                  ),
                ),
                SizedBox(height: 14.h,),
                Text(
                  ' شبكة لدعم المتطوعين',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      color : Colors.black54
                  ),
                ),
                SizedBox(height: 60.h,),
                AppTextField(
                    hint: 'البريد الإلكتروني',
                    prefixIcon:  Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTextController,
                    emailTextController: _emailTextController,
                    emailErrorValue: _emailErrorValue,
                ),
                SizedBox(height: 10.h,),

                Obx(() => AppTextField(
                    hint: 'كلمة السر',
                    prefixIcon: Icon(Icons.lock),
                    obscureText: controller.hidePassword.value,
                    sufficIcon: IconButton(
                      onPressed: (){
                        controller.hidePassword.value = !controller.hidePassword.value;
                      },
                      icon:Icon(
                          controller.hidePassword.value ? Icons.visibility : Icons.visibility_off
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    controller: _passwordTextController,
                    emailTextController: _passwordTextController,
                    emailErrorValue: _passwordErrorValue
                ),),
                Padding(
                  padding: EdgeInsets.only(left: 213.w),
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/forget_password_screen');
                    },
                    child: Text(
                      'هل نسيت كلمة السر؟',
                      style: GoogleFonts.cairo(
                          color: Colors.blue,
                        fontSize: 16.sp
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      PerformLogin();
                    },
                    child: Text(
                      'تسجيل الدخول',
                      style: GoogleFonts.cairo(
                          fontSize: 25.sp,
                        fontWeight: FontWeight.bold
                      ),),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF004AAD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/register_screen');
                      },
                      child: Text(
                        'إنشاء حساب جديد',
                        style: GoogleFonts.cairo(
                            color: Colors.blue,
                          fontSize: 18.sp
                        ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void PerformLogin(){
    if(CheckData()){
      login();
    }
  }

  bool CheckData(){
    if(_emailTextController.text.isNotEmpty && _passwordTextController.text.isNotEmpty){
      _ControllerErrorValue();
      return true ;
    }
    _ControllerErrorValue();
    ShowSnackBar(context, message: '! أدخل البيانات المطلوبة',error: true);
    return false;
  }
  void _ControllerErrorValue(){
    setState((){
      _emailErrorValue = _emailTextController.text.isEmpty ? 'أدخل بريدك  الإلكتروني' : null ;
      _passwordErrorValue = _passwordTextController.text.isEmpty ? 'أدخل كلمة السر' : null ;
    });
  }
  void login() async {
    ApiResponse apiResponse = await AuthApiController().login(
        email: _emailTextController.text,
        password: _passwordTextController.text
    );
    if(apiResponse.success){
      Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
    }
    context.showSnackBar(message: apiResponse.message,error: !apiResponse.success);
  }

}
