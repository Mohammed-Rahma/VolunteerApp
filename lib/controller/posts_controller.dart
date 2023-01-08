import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:volunteer/api/posts_api.dart';
import 'package:volunteer/model/posts_model.dart';

class PostsController extends GetxController {
  var postsList = <PostsModel>[].obs;
  var postsListCategory = <PostsModel>[].obs;

  var isLoading = true.obs;

  var searchList = <PostsModel>[].obs;

  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getPots();
  }

  getPots() async {
    var posts = await PostsApi().getPost();

    try {
      isLoading.value = true;
      if (posts.isNotEmpty) {
        postsList.addAll(posts);
      }
    } finally {
      isLoading(false);
    }
  }

  getCategoryPost(int categoryId) {
    postsListCategory.value =
        postsList.where((post) => post.categoryId == categoryId).toList();
    update();
  }

  void addSearchToList(String searchName) {
    searchList.value = postsListCategory.where((search) {
      return search.description.contains(searchName) ||
          search.location.contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList('');
  }
}

//مش مهم
// class CategoryNameController extends GetxController {
//   var categoryList = <Category>[].obs;
//   var isLoading = true.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getCategoryName();
//   }
//
//   Future<dynamic> getCategoryName()async{
//     var response = await http.get(Uri.parse(ApiSettings().posts));
//     if (response.statusCode==200){
//       Category _category= Category.fromJson(jsonDecode(response.body));
//       categoryList.add(
//           Category(
//               name:_category.name)
//           );
//            isLoading.value=true;
//     }
//     else{
//       Get.snackbar('Error Loading data !',
//           'server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
//     }
//   }
//
// }

// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:volunteer_app/api/baseurl.dart';
// import 'package:volunteer_app/model/posts_model.dart';
// import 'package:http/http.dart' as http;
//
//
// class PostsController extends GetxController {
//   var postsList = <PostsModel>[].obs;
//   var isLoading = true.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchPost();
//   }
//
//   Future<dynamic> fetchPost()async{
//     final response =await http.get(Uri.parse('http://amjad.munafd.com/api/posts'));
//     if (response.statusCode==200){
//       PostsModel _postModle= PostsModel.fromJson(jsonDecode(response.body));
//       postsList.add(
//           PostsModel(
//               id: _postModle.id,
//               categoryId: _postModle.categoryId,
//               title: _postModle.title,
//               description: _postModle.description,
//               location: _postModle.location,
//               status: _postModle.status,
//               createdAt: _postModle.createdAt,
//               imageUrl: _postModle.imageUrl,
//               category: _postModle.category)
//       );
//        isLoading.value=true;
//     }
//     else{
//       Get.snackbar('Error Loading data !',
//           'server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
//     }
//   }
//
// }
