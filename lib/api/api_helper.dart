



import 'package:volunteer/api/api_response.dart';

mixin ApiHelper {
  ApiResponse get errorResponse => ApiResponse('Somthing went wrong ', false);
}