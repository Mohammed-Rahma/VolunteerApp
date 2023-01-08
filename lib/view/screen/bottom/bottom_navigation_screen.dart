import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volunteer/share/constant/constant.dart';
import 'package:volunteer/view/screen/app/home_screen.dart';
import 'package:volunteer/view/screen/app/notifaications.dart';
import 'package:volunteer/view/screen/app/profile/profile_user_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../models/btn_screen.dart';



class BottomNavigationScreen extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<BottomNavigationScreen> {


    List<BnScreen>_screens = <BnScreen> [
      BnScreen(widget:HomeScreen() ),
      BnScreen(widget:ProfileUserScreen() ),
    BnScreen(widget: Notifictions())
  ];

    int _selectPageIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
        backgroundColor: Colors.white,

        body: _screens[_selectPageIndex].widget,
    bottomNavigationBar: ConvexAppBar(
    items: [
      TabItem(icon: Icons.home,title: 'الرئيسية',),
      TabItem(icon: Icons.person,title: 'الملف الشخصي'),
      TabItem(icon: Icons.notifications,title: 'الإشعارات'),

    ],

         backgroundColor: Colors.white,
        height: 60.h,
        elevation: 5,
        activeColor: mainColor,
        color: mainColor,
        onTap: (int selectPageIndex){
          setState(()=>_selectPageIndex = selectPageIndex);
        },
    )
    );
  }
}