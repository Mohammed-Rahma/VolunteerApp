
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volunteer/view/screen/auth/login_screen.dart';

import '../bottom/bottom_navigation_screen.dart';
import '../drawer/drawer_screen.dart';
import 'home_screen.dart';

class Notifictions extends StatefulWidget {
  const Notifictions({Key? key}) : super(key: key);

  @override
  State<Notifictions> createState() => _NotifictionsState();
}

class _NotifictionsState extends State<Notifictions> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
         centerTitle: true,
        title: Text(
          'الإشعارات',
          style: GoogleFonts.cairo(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: Icon(
                    Icons.dehaze_rounded,
                    color: Color(0xFF003F75),
                    size: 35.sp,
                  ));
            },
          ),
        ],
      ),

      endDrawer: DrawerScreen(),

      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
        child: ListView(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: (){},
                  child: Text(
                    'حذف الكل',
                    style: GoogleFonts.cairo(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 20.h,),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/description_post_screen');
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 5.sp),
                      margin: EdgeInsetsDirectional.only(bottom:10,start: 10,end: 10),
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,0),
                            color: Colors.black45,
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(Icons.notification_important_sharp,size: 40.sp,),
                        title: Text('تم نشر عمل تطوعي من قبل مؤسسة الامل',style: GoogleFonts.cairo(fontSize: 15.sp)),
                        subtitle: Text(
                          'يمكننا أن نعرف أي عمل تطوعي على أنه عمل خير يهدف إلى مساعدة',
                          style: GoogleFonts.cairo(fontSize: 12.sp),),
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
