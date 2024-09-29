part of 'verification_cubit.dart';

sealed class VerificationState {}

final class VerificationInitial extends VerificationState {}

final class VerificationLoadinng extends VerificationState {}

final class VerificationSuccess extends VerificationState {}

final class VerificationFailes extends VerificationState {
  final String errmessage;

  VerificationFailes({required this.errmessage});
}
