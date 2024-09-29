import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxira/core/helper/networking/api_constants.dart';
import 'package:luxira/features/auth/ui/verification.dart/logic/cubit/verification_cubit.dart';


class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());
  Dio dio = Dio();
  void resendVerifyCode(String email) async {
    Map<String, dynamic> data = {'email': email};
    try {
      await dio.post(ApiConstants.resendVerifyCodeUrl, data: data);
      emit(VerificationSuccess());
    } on DioException catch (e) {
      emit(VerificationFailes(
          errmessage: ''));
    }
  }

  void verifiyRegistration(
      {required String email, required String code}) async {
    Map<String, dynamic> data = {'email': email, 'code': code};
        try {
      await dio.post(ApiConstants.confirmAccount, data: data);
      emit(VerificationSuccess());
    } on DioException catch (e) {
      emit(VerificationFailes(
          errmessage: ''));
    }

  }
}
