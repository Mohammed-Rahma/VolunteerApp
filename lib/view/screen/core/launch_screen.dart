import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 3),(){
    //   bool loggedIn = SharedPrefController().getValueFor<bool>(PrefKeys.loggedIn.name)??false;
    //   String route = loggedIn ? '/bottom_navigation_screen' : '/login_screen';
    //   Navigator.pushReplacementNamed(context,route );
    // });
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/login_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF)
              ]
            )
          ),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png',height: 300.h,width: 400.w,),
            ],
          ),
        ),
    );
  }
}
