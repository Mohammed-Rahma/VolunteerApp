import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:volunteer/view/screen/app/home_screen.dart';
import 'package:volunteer/view/screen/app/profile/event_screen.dart';
import 'package:volunteer/view/screen/app/profile/follow_screen.dart';
import 'package:volunteer/view/screen/app/profile/profile_user_screen.dart';
import 'package:volunteer/view/screen/app/settings/setting_screen.dart';
import 'package:volunteer/view/screen/auth/forget_password_screen.dart';
import 'package:volunteer/view/screen/auth/login_screen.dart';
import 'package:volunteer/view/screen/auth/register_screen.dart';
import 'package:volunteer/view/screen/auth/reset_password_screen.dart';
import 'package:volunteer/view/screen/auth/success_reset_password_screen.dart';
import 'package:volunteer/view/screen/auth/virification_code_screen.dart';
import 'package:volunteer/view/screen/bottom/bottom_navigation_screen.dart';
import 'package:volunteer/view/screen/core/launch_screen.dart';

import 'bindings/bindings.dart';

SharedPreferences? sharedpref;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // sharedpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // myLocaleController Controller =Get.put(myLocaleController());

    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(428, 926),
      builder: (context, child) {
        return GetMaterialApp(
          // locale: Controller.intiallang,
          // translations:mylocale(),
          debugShowCheckedModeBanner: false,
          initialBinding: BindingsDependence(),
          initialRoute: '/bottom_navigation_screen',
          routes: {
            // '/SearchPage':(context)=> SearchPage(),

            // core
            '/launch_screen': (context) => const LaunchScreen(),

            //auth
            '/login_screen': (context) => const LoginScreen(),
            '/register_screen': (context) => const RegisterScreen(),
            '/forget_password_screen': (context) =>
                const ForgotPasswordScreen(),
            '/virify_code_screen': (context) => const VirifyCodeScreen(),
            '/reset_password_screen': (context) => const ResetPasswordScreen(),
            '/success_reset_password_screen': (context) =>
                const SuccessResetPasswordScreen(),

            //app
            '/home_screen': (context) => const HomeScreen(),
            '/bottom_navigation_screen': (context) => BottomNavigationScreen(),
            // '/post_screen':(context)=> PostScreen(),
            // '/description_post_screen':(context)=> const PostDescriptionScreen(),
            '/profile_user_screen': (context) => const ProfileUserScreen(),
            // '/profile_org_screen':(context)=>const ProfileOrgScreen(),
            '/setting_screen': (context) => const SettingScreen(),

            //profile
            '/event_screen': (context) => const EventScreen(),
            '/follow_screen': (context) => const FollowScreen()
          },
        );
      },
    );
  }
}
