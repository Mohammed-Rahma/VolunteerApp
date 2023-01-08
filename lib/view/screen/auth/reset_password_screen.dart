import 'dart:ffi';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/view/screen/utils/helper.dart';
import 'package:volunteer/view/screen/widget/app_text_filed.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> with Helpers {

  late TextEditingController _passwordTextController;
  late TextEditingController _repasswordTextController;

  bool _obscure = true ;
  bool _obscure2 = true ;



  String? _passwordErrorValue ;
  String? _repasswordErrorValue ;

  @override
  void initState() {
    super.initState();
    _passwordTextController = TextEditingController();
    _repasswordTextController = TextEditingController();
  }


  @override
  void dispose() {
    _passwordTextController.dispose();
    _repasswordTextController.dispose();
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
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('كلمة المرور الجديدة',
                  style: GoogleFonts.cairo(
                    color: Color(0xFF004AAD),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 15.h,),
                Text(
                  'من فضلك ادخل كلمة المرور الجديدة',
                  style: GoogleFonts.cairo(
                height: 1.5.h,
                  color: Color(0xFF716787),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                ),
                SizedBox(height: 20,),
                AppTextField(
                  hint: 'كلمة المرور الجديدة',
                  prefixIcon: Icon(Icons.lock),
                  keyboardType: TextInputType.text,
                  controller: _passwordTextController,
                  emailTextController: _passwordTextController,
                  emailErrorValue: _passwordErrorValue,
                  obscureText: _obscure,
                  sufficIcon: IconButton(
                    onPressed: (){
                      setState(()=> _obscure =! _obscure);
                    }, icon:
                  Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off
                  ),
                  ),
                ),
                SizedBox(height: 10.h,),
                AppTextField(
                  hint: 'تأكيد كلمة المرور',
                  prefixIcon: Icon(Icons.lock),
                  keyboardType: TextInputType.text,
                  controller: _repasswordTextController,
                  emailTextController: _repasswordTextController,
                  emailErrorValue: _repasswordErrorValue,
                  obscureText: _obscure2,
                  sufficIcon: IconButton(
                    onPressed: (){
                      setState(()=> _obscure2 =! _obscure2);
                    }, icon:
                  Icon(
                      _obscure2 ? Icons.visibility : Icons.visibility_off
                  ),
                  ),
                ),

                SizedBox(height: 40,),
                SizedBox(
                  height: 55.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=>PerformForget(),
                    child: Text('حفظ',
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
    _passwordTextController.text.isNotEmpty && _repasswordTextController.text.isNotEmpty
    ){
      return true ;
    }
    ShowSnackBar(context, message: 'Enter required data!',error: true);
    return false;
  }
  void check(){
    Navigator.pushNamed(context, '/success_reset_password_screen');
  }
}

