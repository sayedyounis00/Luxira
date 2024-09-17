import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();
   postMethod(
      {required Map<String, dynamic> data, required String url}) async {
    await dio.post(url, data: data);
  }

}
