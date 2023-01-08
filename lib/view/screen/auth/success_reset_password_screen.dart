import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class SuccessResetPasswordScreen extends StatefulWidget {
  const SuccessResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SuccessResetPasswordScreen> createState() => _SuccessResetPasswordScreenState();
}

class _SuccessResetPasswordScreenState extends State<SuccessResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('تمت العملية بنجاح',
          style: GoogleFonts.cairo(
              color: Color(0xFF004AAD),
              fontWeight: FontWeight.bold
          ),

        ),
      ),
      body:Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h,),
            Center(child: Icon(Icons.check_circle_outline,color: Color(0xFF004AAD),size: 200,)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'تم تغيير كلمة المرور بنجاح',
                style: GoogleFonts.cairo(
              height: 1.5.h,
                color: Color(0xFF716787),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              ),
            ),
            SizedBox(height: 50.h,),
            SizedBox(
              height: 55.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>{
                  Navigator.pushReplacementNamed(context, '/login_screen'),
                },
                child: Text('انتقل الى تسجيل الدخول',style: GoogleFonts.cairo(fontSize: 22.sp),),
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
      ) ,
    );
  }
}
