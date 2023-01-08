import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class AppTextField extends StatelessWidget {


   AppTextField({
    Key? key,
     this.hint,
    this.textDirection,
     this.prefixIcon,
    required this.keyboardType,
    required this.controller,
    this.sufficIcon,
    this.obscureText = false,
    required TextEditingController emailTextController,
    required String? emailErrorValue,
  }) : _emailTextController = emailTextController, _emailErrorValue = emailErrorValue, super(key: key);

  final TextEditingController _emailTextController;
  final String? _emailErrorValue;
  final String? hint;
  final Widget? prefixIcon ;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget? sufficIcon;
  final bool obscureText;
  final String? textDirection;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (searchName){
      },
      style: GoogleFonts.cairo(),
      keyboardType: keyboardType,
      obscureText: obscureText,
      textDirection: TextDirection.ltr,
      minLines: 1,
      maxLines: 1,
      expands: false,
      decoration: InputDecoration(
        suffixIcon: sufficIcon,
        constraints: BoxConstraints(
          minHeight: 50,
          maxHeight: _emailErrorValue == null ? 50 : 75,
        ),
        prefixIcon: prefixIcon,
        errorText: _emailErrorValue,
        errorStyle: GoogleFonts.nunito(),
        errorMaxLines: 3,

        hintText: hint,

        hintStyle: GoogleFonts.cairo(),
        // contentPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
              color: Colors.red.shade900,
              width: 1.w
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
              color: Colors.red.shade900,
              width: 1
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
              color: Colors.grey,
              width: 1
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: Colors.pink.shade300,
              width: 1,
            )
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(15.r)
        ),
      ),
    );
  }
}
