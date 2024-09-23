import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxira/core/helper/networking/api_constants.dart';
import 'package:luxira/features/auth/register/data/err_response.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

   login({required String email,required String password}) async {
    emit(LoginLoading());
    Map<String, dynamic> data = {
      'email':email,
      'password':password,
    };
    try {
      await Dio().post(ApiConstants.login, data: data);
      emit(LoginSuccess());
    } on DioException catch (e) {
      log(e.response!.data.runtimeType.toString());
      emit(
          LoginFailed(erroeMessage: ErrResponse.fromJson(e.response!.data)));
    }
  }
}
