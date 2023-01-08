//
//
// import 'package:get/get.dart';
// import 'package:volunteer_app/api/institution_api.dart';
// import 'package:volunteer_app/model/institutions_model.dart';
//
// class InstituteController extends GetxController {
//   var instituteList = <InstitutionsModel>[].obs;
//   var isLoading = true.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getInstitute();
//   }
//
//   // getInstitute() async {
//   //   var institute= await InstitutionsServices.getInstitutions();
//   //
//   //   try {
//   //     isLoading.value = true;
//   //     if (institute.isNotEmpty) {
//   //       instituteList.addAll(institute);
//   //     }
//   //   } finally {
//   //     isLoading(false);
//   //   }
//   // }
// }
