import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/categories_model.dart';
import 'baseurl.dart';

class CategoriesServices {
 static Future<List<CategoriesModels>> getCategories() async {
    var response = await http.get(Uri.parse(ApiSettings().category));
    if (response.statusCode == 200) {
      var jsonData =jsonDecode(response.body);
      var dataJsonObject = jsonData['data'] as List ;
      return dataJsonObject.map((jsonObject) => CategoriesModels.fromJson(jsonObject)).toList();
    }
    else{
      return throw Exception("Failed to load Categories");
    }
  }
}

