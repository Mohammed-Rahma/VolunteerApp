import 'package:get/get.dart';

class postController extends GetxController{

  bool Joined = false;

  void isJoined (){
    Joined = !Joined;
    update();
}
}