import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxira/features/auth/data/repo/auth_repo.dart';
part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(this.authRepo) : super(VerificationInitial());
  Dio dio = Dio();

  final AuthRepo authRepo;
  void resendVerifyCode(String email) async {
    var result = await authRepo.resendVerifyCode(email);
    result.fold(
        (error) => emit(
              VerificationFailes(errmessage: error),
            ),
        (success) => emit(VerificationSuccess()));
  }

  void verifiyRegistration(
      {required String email, required String code}) async {
    var result = await authRepo.verifiyRegistration(email: email, code: code);
    result.fold(
      (error) => emit(VerificationFailes(errmessage: error)),
      (success) => emit(VerificationSuccess()),
    );
  }
}
