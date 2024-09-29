import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:luxira/core/helper/networking/api_constants.dart';
import 'package:luxira/core/helper/networking/api_error_handler.dart';
import 'package:luxira/features/auth/data/repo/auth_repo.dart';
import 'package:luxira/features/auth/ui/register/data/new_user.dart';

class AuthRepoImplemtion implements AuthRepo {
  //?ordinary register
  @override
  Future<Either<String, Map<String, dynamic>>> register(NewUser newUser) async {
    Map<String, dynamic> data = {
      'firstName': newUser.firstname,
      'lastName': newUser.lastname,
      'gender': newUser.gender,
      'role': newUser.role,
      'email': newUser.email,
      'password': newUser.password,
    };
    try {
      Response response = await Dio().post(ApiConstants.register, data: data);
      return right(response.data);
    } on DioException catch (e) {
      left(ApiErrorHandler().getError(e.response!.statusCode!));
    }
    throw UnimplementedError('register el3adi');
  }

//?register using goole
  @override
  registerUsingGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        ApiConstants.regiserUsingGoogle,
      ],
    );
    try {
      await googleSignIn.signIn();
    } catch (error) {
      log(error.toString());
    }
    throw UnimplementedError('google sign in');
  }

//?login
  @override
  Future<Either<String, Map<String, dynamic>>> login(
      {required String email, required String password}) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    try {
      Response response = await Dio().post(ApiConstants.login, data: data);
      log(response.data['message']);
      right(response.data);
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      return left(ApiErrorHandler().getError(e.response!.statusCode!));
    }
    throw UnimplementedError('login');
  }

//?verification
  @override
  Future<Either<String, Map<String, dynamic>>> resendVerifyCode(
      String email) async {
    Map<String, dynamic> data = {'email': email};
    try {
      Response response =
          await Dio().post(ApiConstants.resendVerifyCodeUrl, data: data);
      right(response.data);
    } on DioException catch (e) {
      left(ApiErrorHandler().getError(e.response!.statusCode!));
    }
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Map<String, dynamic>>> verifiyRegistration(
      {required String email, required String code}) async {
    Map<String, dynamic> data = {'email': email, 'code': code};
    try {
      Response response =
          await Dio().post(ApiConstants.confirmAccount, data: data);
      right(response.data);
    } on DioException catch (e) {
      left(ApiErrorHandler().getError(e.response!.statusCode!));
    }
    throw UnimplementedError();
  }

  @override
  void sentNewCodeToResetPAssword(String email) {
    Dio().post(data: {'email': email}, ApiConstants.sendNewCodetoResetPAss);
  }
}
