import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class card_widdget extends StatelessWidget {
  const card_widdget({
    Key? key,
    required IconData ledingIcon,
    required String Title ,
    required String SubTitle,
    required IconData TraillingIcon,
    double marginBottom = 20 ,
  }) : _ledingIcon = ledingIcon ,
        _Title = Title ,
        _SubTitle = SubTitle ,
        _TraillingIcon = TraillingIcon ,
        _marginBottom = marginBottom,
        super(key: key);



  final IconData _ledingIcon;
  final String _Title ;
  final String _SubTitle ;
  final IconData _TraillingIcon;
  final double _marginBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w ),
      child: Container(
        height: 90.h,
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          color: Colors.blueGrey.shade50,
          child:  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Icon(_ledingIcon),
                SizedBox(width: 20.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(_Title,
                      style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(_SubTitle,
                      style: GoogleFonts.cairo(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    Spacer(),

                  ],
                ),
                Spacer(),
                Icon(_TraillingIcon)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
