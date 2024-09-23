import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:luxira/core/helper/networking/api_constants.dart';
import 'package:luxira/core/helper/networking/api_services.dart';

class VerificatonRepo {
  void resendVerifyCode(String email) async {
    Map<String, dynamic> data = {'email': email};
    Response response = await ApiServices()
        .postMethod(data: data, url: ApiConstants.resendVerifyCodeUrl);
    if (response.statusCode != 200) {
      log('Errro ${response.statusCode}');
    }
  }
  void verifiyRegistration({required String email,required String code}) async {
    Map<String, dynamic> data = {'email': email,'code':code};
    Response response = await ApiServices()
        .postMethod(data: data, url: ApiConstants.resendVerifyCodeUrl);
    if (response.statusCode != 200) {
      log('Errro ${response.statusCode}');
    }
  }
}
