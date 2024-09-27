import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:luxira/core/helper/networking/api_constants.dart';
import 'package:luxira/core/helper/networking/api_services.dart';
import 'package:luxira/features/auth/register/data/err_response.dart';
import 'package:luxira/features/auth/register/data/new_user.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  TextEditingController emailcont = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      ApiConstants.regiserUsingGoogle,
    ],
  );

  void register(NewUser newUser) async {
    emit(RegisterLoading());
    emailcont.text = newUser.email;
    Map<String, dynamic> data = {
      'firstName': newUser.firstname,
      'lastName': newUser.lastname,
      'gender': newUser.gender,
      'email': newUser.email,
      'password': newUser.password,
    };
    try {
      await ApiServices().postMethod(data: data, url: ApiConstants.register);
      // await Dio().post(ApiConstants.register, data: data);
      emit(RegisterSuccess());
    } on DioException catch (e) {
      log(e.response!.data.runtimeType.toString());
      emit(
          RegisterFailed(erroeMessage: ErrResponse.fromJson(e.response!.data)));
    }
  }

  Future<void> googleSignin() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      log(error.toString());
    }
  }
}
