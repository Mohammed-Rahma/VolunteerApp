

import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/posts_model.dart';
import 'baseurl.dart';


class PostsApi {
  Future<List<PostsModel>> getPost() async {
    Uri uri = Uri.parse(ApiSettings.posts);
    var response = await http.get(uri);
    if (response.statusCode == 200 ) {
      var json = jsonDecode(response.body);
      var jsonObj = json["data"] as List;
      List<PostsModel> post = jsonObj.map((e) => PostsModel.fromJson(e)).toList();
      return post;
    }
    return [];
  }
}

class CategoryNameApi {
  static Future<List<Category>> getCategoryName() async {
    var response = await http.get(Uri.parse(ApiSettings.posts));
    if (response.statusCode == 200) {
      var jsonData =jsonDecode(response.body);
      var dataJsonObject = jsonData['category'] as List ;
      return dataJsonObject.map((jsonObject) => Category.fromJson(jsonObject)).toList();
    }
    else{
      return throw Exception("Failed to load Categories");
    }
  }
}
