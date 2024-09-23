import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();
  Future<Response>  postMethod({required Map<String, dynamic> data, required String url}) async {
    Response response = await dio.post(url, data: data);
    return response;
  }
}
