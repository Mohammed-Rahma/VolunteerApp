import 'dart:ffi';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/view/screen/utils/helper.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class VirifyCodeScreen extends StatefulWidget {
  const VirifyCodeScreen({Key? key}) : super(key: key);

  @override
  State<VirifyCodeScreen> createState() => _VirifyCodeScreenState();
}

class _VirifyCodeScreenState extends State<VirifyCodeScreen> with Helpers {


  late String virifyCode ;

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
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
        title: Text('كود التحقق',
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
            Text('ادخل الكود',
              style: GoogleFonts.cairo(
                color: Color(0xFF004AAD),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 15.h,),
            Text(
              'الرجاء ادخال الرمز المرسل عبر البريد الالكتروني',
              style: GoogleFonts.cairo(
                height: 1.5.h,
                color: Color(0xFF716787),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20,),
            OtpTextField(
              fieldWidth: 60.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Colors.red,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                Navigator.pushNamed(context, '/reset_password_screen');
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }

}

