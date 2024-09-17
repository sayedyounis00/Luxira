part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final NewUser newUser;
  RegisterSuccess({required this.newUser});
}

final class RegisterFailed extends RegisterState {
  final String erroeMessage;

  RegisterFailed({required this.erroeMessage});
}

final class RegisterLoading extends RegisterState {}
