import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:luxira/core/helper/networking/api_error_handler.dart';

class ApiServices {
  Dio dio = Dio();
  postMethod({required Map<String, dynamic> data, required String url}) async {
    try {
      Response response = await dio.post(url, data: data);
      ApiErrorHandler().errorHandler(response);
    } on Dio catch (e) {
      log(e.toString());
    }
  }
}
