import 'package:get/get.dart';
import 'package:volunteer/controller/categories_controller.dart';
import 'package:volunteer/controller/posts_controller.dart';

class BindingsDependence implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoriesController());
    Get.put(PostsController());
  }
}
