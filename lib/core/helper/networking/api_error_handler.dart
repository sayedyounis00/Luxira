import 'package:dio/dio.dart';

class ApiErrorHandler {
  String errorHandler(Response response) {
    if (response.statusCode == 200) {
      return "Done";
    } else if (response.statusCode == 404) {
      return 'email not exist';
    } else {
      return 'add Condition yasta';
    }
  }
}
