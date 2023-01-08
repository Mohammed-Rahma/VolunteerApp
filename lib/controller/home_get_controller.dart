
import 'package:get/get.dart';
import 'package:volunteer/api/institution_api.dart';
import 'package:volunteer/model/institute_model.dart';

class HomeGetController extends GetxController {

  List<Instituation> instituat = <Instituation>[];
  bool loading = false;

  static HomeGetController get to => Get.find<HomeGetController>();

  @override
  void onInit() {
    readInstituat();
    super.onInit();
  }


  void readInstituat() async {
    loading = true;
    instituat = await InstitutionsServices().getInstituation();
    loading = false;
    update();
  }



}
