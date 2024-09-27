import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio();
  Future<Response> postMethod(
      {required Map<String, dynamic> data, required String url}) async {
    try {
      Response response = await _dio.post(url, data: data);
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
