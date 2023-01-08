import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/view/screen/utils/helper.dart';
import 'package:volunteer/view/screen/widget/app_text_filed.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> with Helpers {

  late TextEditingController _emailTextController;


  String? _emailErrorValue ;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
  }


  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_forward_ios),
            color: Color(0xFF004AAD),
          ),
        ],
        title: Text('نسيت كلمة المرور',
          style: GoogleFonts.cairo(
              color: Color(0xFF004AAD),
              fontWeight: FontWeight.bold
          ),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('تحقق من البريد الالكتروني'
              ,style: GoogleFonts.cairo(
                color: Color(0xFF004AAD),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 15.h,),
            Text(
              'الرجاء ادخال عنوان البريد الالكتروني للتحقق',
              style: GoogleFonts.cairo(
                height: 1.5.h,
                color: Color(0xFF716787),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20,),
            AppTextField(
                hint: 'ادخل البريد الخاص بك',
                prefixIcon: Icon(Icons.email),
                keyboardType: TextInputType.text,
                controller: _emailTextController,
                emailTextController: _emailTextController,
                emailErrorValue: _emailErrorValue
            ),
            SizedBox(height: 40,),
            SizedBox(
              height: 55.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>PerformForget(),
                child: Text(
                  'تسجيل الدخول',
                  style: GoogleFonts.cairo(fontSize: 22.sp),),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF004AAD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void PerformForget(){
    if(CheckData()){
      check();
    }
  }

  bool CheckData(){
    if(
    _emailTextController.text.isNotEmpty){
      return true ;
    }
    ShowSnackBar(context, message: 'Enter required data!',error: true);
    return false;
  }
  void check(){
    Navigator.pushNamed(context, '/virify_code_screen');
  }
}

