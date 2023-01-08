import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin Helpers {
  void ShowSnackBar (BuildContext context,{required String message,bool error = false}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: GoogleFonts.cairo(),),
        backgroundColor: error ? Colors.red.shade700 : Colors.green.shade800,
        behavior: SnackBarBehavior.floating,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onVisible: ()=>print('On Visible'),
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 3),
        padding: const EdgeInsets.all(10),
        action: SnackBarAction(
          label: 'إلغا',
          onPressed: (){},
          textColor: Colors.white,
        ),
      ),
    );
  }

}