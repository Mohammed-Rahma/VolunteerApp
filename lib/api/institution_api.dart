import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:volunteer/model/institute_model.dart';
import 'package:volunteer/model/institutions_model.dart';

import 'baseurl.dart';


class InstitutionsServices {
  Future<List<Instituation>> getInstituation() async {
    Uri uri = Uri.parse(ApiSettings().institutions.replaceFirst('/{id}', "") );
    var response = await http.get(uri);
    print('$uri');
    if(response.statusCode == 200){
      print('Ayman1');
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List ;
      return dataJsonObject
          .map((jsonObject) => Instituation.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
}

