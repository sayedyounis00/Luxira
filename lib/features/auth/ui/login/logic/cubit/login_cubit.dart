import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxira/features/auth/data/repo/auth_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authrepo) : super(LoginInitial());
  final AuthRepo authrepo;
  void login({required String email,required String password}) async {
    emit(LoginLoading());
    Either<String, Map<String, dynamic>> result =
        await authrepo.login(email: email, password: password);
    result.fold((error) => emit(LoginFailed(erroeMessage: error)),
        (success) => emit(LoginSuccess()));
  }
}
