import 'package:dartz/dartz.dart';
import 'package:luxira/features/auth/ui/register/data/new_user.dart';

abstract class AuthRepo {
  void registerUsingGoogle();
  void sentNewCodeToResetPAssword(String email);
  Future<Either<String, Map<String, dynamic>>> register(NewUser newUser);
  Future<Either<String, Map<String, dynamic>>> login(
      {required String email, required String password});
  Future<Either<String, Map<String, dynamic>>> resendVerifyCode(String email);
  Future<Either<String, Map<String, dynamic>>> verifiyRegistration(
      {required String email, required String code});
}
