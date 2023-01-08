
import 'dart:ui';

import 'package:get/get.dart';
import 'package:volunteer/main.dart';

class myLocaleController extends GetxController{

    Locale intiallang = sharedpref!.getString ("lang")==null ? Get.deviceLocale! :
    Locale(sharedpref!.getString ("lang")!);
  // Locale intiallang = sharedpref!.getString ("language")=="en" ? Locale("en"): Locale("ar");

  void changeLocale(String codeLang){

    Locale locale =Locale(codeLang);
    sharedpref!.setString('language', codeLang);
    Get.updateLocale(locale);
  }

}