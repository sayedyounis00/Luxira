import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxira/features/auth/data/repo/auth_repo.dart';
import 'package:luxira/features/auth/ui/register/data/new_user.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;
  TextEditingController emailcont = TextEditingController();
  //!

  void reg(NewUser newUser) async {
    emit(RegisterLoading());
    var result = await authRepo.register(newUser);
    result.fold(
      (error) => emit(RegisterFailed(erroeMessage: error)),
      (success) => emit(RegisterSuccess()),
    );
  }

  void registerUsingGoogle() {
    authRepo.registerUsingGoogle();
  }
}
