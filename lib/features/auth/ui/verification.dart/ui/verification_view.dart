import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxira/features/auth/data/repo/auth_repo_implemtion.dart';
import 'package:luxira/features/auth/ui/verification.dart/logic/cubit/verification_cubit.dart';
import 'package:luxira/features/auth/ui/verification.dart/ui/widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  final String email;
  const VerificationView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(AuthRepoImplemtion()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'OTP Verification',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: VerificationViewBody(email: email),
      ),
    );
  }
}
