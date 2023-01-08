import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:volunteer/api/api_helper.dart';
import 'package:volunteer/api/api_response.dart';
import 'package:volunteer/api/baseurl.dart';
import 'package:volunteer/model/User.dart';
// import 'package:volunteer/pref/shared_pref.controller.dart';

class AuthApiController with ApiHelper {
  Future<ApiResponse> login(
      {required String email, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response =
        await http.post(uri, body: {'email': email, 'password': password});
    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        User user = User.fromJson(json['data']);
        // SharedPrefController().save(user);
      }
      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }

  Future<ApiResponse> register(User user) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'password_confirmation': user.password_confirmation
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiResponse(json['message'], true);
      } else if (response.statusCode == 401) {
        return ApiResponse(json['message'], false);
      }
    }
    return errorResponse;
  }

  // Future<ApiResponse> logout() async {
  //   String token =
  //   SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
  //   Uri uri = Uri.parse(ApiSettings.logout);
  //   var response = await http.get(uri, headers: {
  //     HttpHeaders.authorizationHeader: token,
  //     HttpHeaders.acceptHeader: 'application/json'
  //   });
  //   if (response.statusCode == 200 || response.statusCode == 401) {
  //     SharedPrefController().clear();
  //     return ApiResponse('تم تسجيل الخروج بنجاح', true);
  //   }
  //   return errorResponse;
  // }

}
